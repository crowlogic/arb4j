package arb.applications;

import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.IntStream;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.expressions.Context;
import arb.functions.real.MonotonicRiemannSiegelThetaFunction;
import arb.functions.real.RealFunction;

/**
 * <h3>Inverse Shifted Phase Pullback of the Hardy Z Function</h3>
 *
 * <p>
 * Samples the wide-sense stationary process
 *
 * <pre>
 *   F(t) = Z(Φ⁻¹(t)) / √(Φ′(Φ⁻¹(t)))
 * </pre>
 *
 * on a uniform grid [t₀, t₀ + N·dt) and feeds it into the path-based
 * ingestion mode of {@link StationaryGaussianProcessSampler}. Here Z is the
 * Hardy Z function on the real line, ϑ is the Riemann–Siegel theta function,
 * Φ(τ) = ϑ(τ) + c·τ is the {@link MonotonicRiemannSiegelThetaFunction} (with
 * c = 3 by default), and Φ⁻¹ is its global inverse on [Φ(0), ∞).
 *
 * <p>
 * The map τ → Φ(τ) reparameterizes the height τ on the critical line by the
 * cumulative phase Φ. Under that reparameterization, Z ∘ Φ⁻¹ rescaled by
 * 1/√Φ′ becomes wide-sense stationary in the t-coordinate (the Jacobian
 * absorbs the local stretching of the t-axis), so its empirical second-order
 * statistics — autocorrelation and power spectral density — are translation
 * invariant in t. That is exactly the input contract of
 * {@link StationaryGaussianProcessSampler#ingestPrecomputedSamplePath}.
 *
 * <p>
 * The N evaluations of F(t_i) are independent and embarrassingly parallel.
 * Each worker holds thread-local copies of Φ, its derivative dΦ, the inverse
 * Φ⁻¹, and the compiled DSL expression
 * {@code F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))}, since those compiled functions
 * carry mutable evaluation state. Common-subexpression elimination in
 * {@link arb.expressions.Expression#optimize} collapses the two textual
 * occurrences of Φ⁻¹(t) into a single node per evaluation.
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link arb.documentation.TheArb4jLibrary}
 */
public class InverseShiftedPhasePullbackSampler extends
                                                StationaryGaussianProcessSampler
{
  /**
   * Per-thread evaluator bundle. {@code F} is the compiled DSL expression
   * producing F(t); the bundle owns the Φ, dΦ, Φ⁻¹ that {@code F} closes over
   * via its private {@link Context}.
   */
  private static final class PullbackEvaluator implements
                                              AutoCloseable
  {
    final MonotonicRiemannSiegelThetaFunction Φ    = new MonotonicRiemannSiegelThetaFunction();
    final RealFunction                        dΦ   = Φ.derivative();
    final RealFunction                        Φinv;
    final RealFunction                        F;

    PullbackEvaluator(int prec)
    {
      Φinv          = Φ.invert(null, 0, prec);
      var context   = new Context();
      context.registerFunction("Φ",  Φ);
      context.registerFunction("dΦ", dΦ);
      F             = RealFunction.express("F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))",
                                           context);
    }

    @Override
    public void close()
    {
    }
  }

  private final ThreadLocal<PullbackEvaluator> evaluator;

  /**
   * Default sampler: [0, 1000] @ dt = 0.01, giving N = 100,000 grid points.
   * Matches the historical defaults of {@link StationaryGaussianProcessSampler}.
   */
  public InverseShiftedPhasePullbackSampler()
  {
    this(new FloatInterval(0, 1000), 0.01);
  }

  /**
   * Sample F on [t₀, t₀ + N·dt) with N = ⌊length(timeSpan) / dt⌋. The lower
   * endpoint of {@code timeSpan} is t₀ and must lie in the domain of Φ⁻¹,
   * i.e. t₀ ≥ Φ(0) ≈ −0.156. The default {@code timeSpan} of [0, 1000]
   * easily satisfies that.
   *
   * @param timeSpan time-domain support of F; t₀ = timeSpan.left()
   * @param dt       uniform spacing on the t-axis
   */
  public InverseShiftedPhasePullbackSampler(FloatInterval timeSpan, double dt)
  {
    super(timeSpan, dt);
    evaluator = ThreadLocal.withInitial(() -> new PullbackEvaluator(bits));
  }

  /**
   * One progress line is emitted every this many completed evaluations.
   * Configurable per instance for tests that want quieter or more frequent
   * output.
   */
  public int progressInterval = 100;

  /**
   * Override of the path-preparation hook in
   * {@link StationaryGaussianProcessSampler}. Builds samplePath[i] = F(t_i)
   * in parallel across the common ForkJoinPool, then delegates to
   * {@link #ingestPrecomputedSamplePath(Complex)} for the FFT, the empirical
   * orthogonal random measure, and the empirical PSD.
   *
   * Each worker bumps a shared {@link AtomicLong} after each F(t)
   * evaluation; whenever the post-bump count crosses a multiple of
   * {@link #progressInterval} the worker prints a single line carrying its
   * thread name, the index just completed, the running total, and the
   * percentage of N reached. Output goes to {@code System.out}.
   *
   * F(t) is real-valued on the real t-axis; samplePath[i].im is set to 0.
   */
  @Override
  protected void prepareSamplePath()
  {
    double t0 = timeSpan.getA().doubleValue();
    AtomicLong completed = new AtomicLong(0);
    long startNanos = System.nanoTime();

    try ( var sampledPath = Complex.newVector(N))
    {
      IntStream.range(0, N).parallel().forEach(i ->
      {
        try ( Real t = Real.valueOf(t0 + i * dt);
              Real Fval = Real.valueOf(0.0))
        {
          evaluator.get().F.evaluate(t, 1, bits, Fval);
          var slot = sampledPath.get(i);
          slot.re().set(Fval);
          slot.im().zero();
        }
        long done = completed.incrementAndGet();
        if (done % progressInterval == 0 || done == N)
        {
          double pct = 100.0 * done / N;
          double elapsedSec = (System.nanoTime() - startNanos) / 1e9;
          System.out.printf("[%s] i=%d  done=%d/%d  %5.1f%%  %.1fs%n",
                            Thread.currentThread().getName(),
                            i,
                            done,
                            N,
                            pct,
                            elapsedSec);
        }
      });

      ingestPrecomputedSamplePath(sampledPath);
    }
  }
}
