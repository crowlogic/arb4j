package arb.applications;

import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicLong;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
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
   * Single shared Φ, dΦ, Φ⁻¹. All three are reentrant: every {@code evaluate}
   * call allocates its own try-with-resources scratch and the only closed-over
   * state ({@code c} on Φ, {@code MAX_ITER} on Φ⁻¹) is read-only.
   */
  protected final MonotonicRiemannSiegelThetaFunction        Φ                = new MonotonicRiemannSiegelThetaFunction();
  protected final RealFunction                                dΦ              = Φ.derivative();
  protected final RealFunction                                Φinv;

  /**
   * Single shared {@link Context} into which Φ and dΦ are registered, and
   * the single compiled {@link Expression} for F(t) = Z(Φ⁻¹(t))/√dΦ(Φ⁻¹(t)).
   * The DSL is parsed and the bytecode class generated exactly once; per-
   * worker fresh evaluation state is obtained via {@link Expression#instantiate()}.
   */
  protected final Context                                     context;
  protected final Expression<Real, Real, RealFunction>        compiledF;

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
    Φinv      = Φ.invert(null, 0, bits);
    context   = new Context();
    context.registerFunction("Φ",  Φ);
    context.registerFunction("dΦ", dΦ);
    compiledF = RealFunction.compile("F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))", context);
    // Force the compile so the first instantiate() is cheap.
    compiledF.instantiate();
  }

  /**
   * One progress line is emitted every this many completed evaluations.
   * Configurable per instance for tests that want quieter or more frequent
   * output.
   */
  public int progressInterval = 100;

  /**
   * Per-thread benchmark record collected during the most recent
   * {@link #prepareSamplePath()} run. {@code count} is the number of F(t)
   * evaluations performed by that thread; {@code totalNanos} is the sum of
   * per-evaluation wall-clock durations measured around
   * {@code F.evaluate(...)}. Mean rate = count / (totalNanos·10⁻⁹) Hz.
   */
  public static final class ThreadStats
  {
    public long count;
    public long totalNanos;

    public double meanRate()
    {
      return totalNanos == 0 ? 0.0 : count / (totalNanos / 1e9);
    }

    public double meanMillisPerEval()
    {
      return count == 0 ? 0.0 : (totalNanos / 1e6) / count;
    }
  }

  /**
   * Snapshot of per-thread statistics from the last
   * {@link #prepareSamplePath()} call, keyed by thread name. Sorted by name
   * for stable reporting.
   */
  public Map<String, ThreadStats> threadStats = new TreeMap<>();

  /**
   * Number of worker threads to spawn for the parallel F(t) evaluation.
   * Defaults to {@code Runtime.getRuntime().availableProcessors()} — one
   * worker per core. Override before {@link #prepareSamplePath()} for
   * benchmarks that want to study scaling.
   */
  public int numberOfWorkers = Runtime.getRuntime().availableProcessors();

  /**
   * Override of the path-preparation hook. Spawns exactly
   * {@link #numberOfWorkers} worker threads. Worker {@code k} evaluates
   * indices {@code k, k + W, k + 2·W, …} where {@code W = numberOfWorkers},
   * a strided partition that spreads any t-axis non-stationarity in F's
   * cost (e.g. Newton iteration count growing with t) evenly across
   * workers instead of dumping the slow tail on one thread.
   *
   * <p>The DSL expression is compiled exactly once in the constructor.
   * Each worker calls {@link Expression#instantiate()} on the shared
   * compiled {@link #compiledF} to obtain a fresh {@link RealFunction}
   * with its own evaluation registers; Φ, dΦ, and Φ⁻¹ are shared and
   * reentrant.
   *
   * <p>Per-thread benchmark statistics record only the wall-clock time of
   * the {@code F.evaluate(…)} call; allocation of the input/output
   * {@link Real} scratch is excluded.
   */
  @Override
  protected void prepareSamplePath()
  {
    double                                  t0       = timeSpan.getA().doubleValue();
    AtomicLong                              completed = new AtomicLong(0);
    ConcurrentHashMap<String, ThreadStats>  stats    = new ConcurrentHashMap<>();
    int                                     W        = numberOfWorkers;
    long                                    startNanos = System.nanoTime();

    try ( var sampledPath = Complex.newVector(N))
    {
      CountDownLatch done = new CountDownLatch(W);
      Thread[]       workers = new Thread[W];

      for (int k = 0; k < W; k++)
      {
        final int workerIndex = k;
        workers[k] = new Thread(() ->
        {
          String tname = Thread.currentThread().getName();
          ThreadStats s = new ThreadStats();
          stats.put(tname, s);

          // Each worker owns its own fresh instance of the compiled expression.
          // The bytecode class is shared; only the per-evaluation register set
          // is fresh.
          RealFunction Fworker = compiledF.instantiate();

          try ( Real t    = Real.valueOf(0.0);
                Real Fval = Real.valueOf(0.0))
          {
            for (int i = workerIndex; i < N; i += W)
            {
              t.set(t0 + i * dt);

              long evalStart = System.nanoTime();
              Fworker.evaluate(t, 1, bits, Fval);
              s.totalNanos += System.nanoTime() - evalStart;
              s.count++;

              var slot = sampledPath.get(i);
              slot.re().set(Fval);
              slot.im().zero();

              long doneCount = completed.incrementAndGet();
              if (doneCount % progressInterval == 0 || doneCount == N)
              {
                double pct = 100.0 * doneCount / N;
                double elapsedSec = (System.nanoTime() - startNanos) / 1e9;
                System.out.printf("[%s] i=%d  done=%d/%d  %5.1f%%  %.2fs  thread‑rate=%.2f eval/s  thread‑mean=%.3f ms/eval%n",
                                  tname,
                                  i,
                                  doneCount,
                                  N,
                                  pct,
                                  elapsedSec,
                                  s.meanRate(),
                                  s.meanMillisPerEval());
              }
            }
          }
          finally
          {
            done.countDown();
          }
        }, "PullbackWorker-" + workerIndex);
        workers[k].start();
      }

      try
      {
        done.await();
      }
      catch (InterruptedException ie)
      {
        Thread.currentThread().interrupt();
        throw new RuntimeException("Interrupted while sampling F(t)", ie);
      }

      ingestPrecomputedSamplePath(sampledPath);
    }

    threadStats = new TreeMap<>(stats);
    long elapsedNanos = System.nanoTime() - startNanos;
    printBenchmarkSummary(elapsedNanos);
  }

  /**
   * Emit a final benchmark report: per-thread count, total CPU-time on F(t),
   * mean evaluation rate, mean ms/eval; followed by an aggregate line giving
   * the overall wall-clock elapsed time and the global mean rate (sum of
   * thread counts divided by wall-clock time, the meaningful throughput
   * figure since the workers run in parallel).
   */
  protected void printBenchmarkSummary(long elapsedNanos)
  {
    double wallSec = elapsedNanos / 1e9;
    long   totalCount = 0;
    long   totalEvalNanos = 0;
    System.out.println("─── per‑thread benchmark ───");
    System.out.printf("%-44s  %10s  %12s  %14s  %14s%n",
                      "thread", "count", "sumEval(s)", "rate(eval/s)", "mean(ms/eval)");
    for (Map.Entry<String, ThreadStats> e : threadStats.entrySet())
    {
      ThreadStats s = e.getValue();
      totalCount     += s.count;
      totalEvalNanos += s.totalNanos;
      System.out.printf("%-44s  %10d  %12.3f  %14.2f  %14.2f%n",
                        e.getKey(),
                        s.count,
                        s.totalNanos / 1e9,
                        s.meanRate(),
                        s.meanMillisPerEval());
    }
    double globalRate = wallSec == 0 ? 0.0 : totalCount / wallSec;
    System.out.printf("─── total: count=%d  wall=%.3fs  sumEval=%.3fs  global‑rate=%.2f eval/s  threads=%d ───%n",
                      totalCount,
                      wallSec,
                      totalEvalNanos / 1e9,
                      globalRate,
                      threadStats.size());
  }
}
