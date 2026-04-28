package arb.applications;

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
   * Sample F on [t₀, t₀ + N·dt) with N = ⌊length(timeSpan) / dt⌋. The lower
   * endpoint of {@code timeSpan} is t₀ and must lie in the domain of Φ⁻¹,
   * i.e. t₀ ≥ Φ(0) ≈ −0.156. The default {@code timeSpan} of [0, 10000]
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
   * Override of the path-preparation hook in
   * {@link StationaryGaussianProcessSampler}. Builds samplePath[i] = F(t_i)
   * in parallel across the common ForkJoinPool, then delegates to
   * {@link #ingestPrecomputedSamplePath(Complex)} for the FFT, the empirical
   * orthogonal random measure, and the empirical PSD.
   *
   * F(t) is real-valued on the real t-axis; samplePath[i].im is set to 0.
   */
  @Override
  protected void prepareSamplePath()
  {
    double t0 = timeSpan.getA().doubleValue();
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
      });

      ingestPrecomputedSamplePath(sampledPath);
    }
  }
}
