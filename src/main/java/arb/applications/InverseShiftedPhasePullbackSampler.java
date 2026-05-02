package arb.applications;

import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicLong;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
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
 * on a uniform grid [t₀, t₀ + N·dt) and feeds it into the path-based ingestion
 * mode of {@link StationaryGaussianProcessSampler}. Here Z is the Hardy Z
 * function on the real line, ϑ is the Riemann–Siegel theta function, Φ(τ) =
 * ϑ(τ) + c·τ is the {@link MonotonicRiemannSiegelThetaFunction} (with c = 3 by
 * default), and Φ⁻¹ is its global inverse on [Φ(0), ∞).
 *
 * <p>
 * The map τ → Φ(τ) reparameterizes the height τ on the critical line by the
 * cumulative phase Φ. Under that reparameterization, Z ∘ Φ⁻¹ rescaled by 1/√Φ′
 * becomes wide-sense stationary in the t-coordinate (the Jacobian absorbs the
 * local stretching of the t-axis), so its empirical second-order statistics —
 * autocorrelation and power spectral density — are translation invariant in t.
 * That is exactly the input contract of
 * {@link StationaryGaussianProcessSampler#ingestPrecomputedSamplePath}.
 *
 * <p>
 * The N evaluations of F(t_i) are independent and embarrassingly parallel. Each
 * worker holds thread-local copies of Φ, its derivative dΦ, the inverse Φ⁻¹,
 * and the compiled DSL expression {@code F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))},
 * since those compiled functions carry mutable evaluation state.
 * Common-subexpression elimination in
 * {@link arb.expressions.Expression#optimize} collapses the two textual
 * occurrences of Φ⁻¹(t) into a single node per evaluation.
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link arb.documentation.TheArb4jLibrary}
 */
public class InverseShiftedPhasePullbackSampler extends
                                                StationaryGaussianProcessSampler
{
  private static final Logger log = LoggerFactory.getLogger(InverseShiftedPhasePullbackSampler.class);

  public static void main(String[] args)
  {
    launch(args);
  }

  final MonotonicRiemannSiegelThetaFunction            Φ  = new MonotonicRiemannSiegelThetaFunction();

  protected final RealFunction                         dΦ = Φ.derivative();

  protected final Context                              context;
  protected final Expression<Real, Real, RealFunction> compiledF;

  public InverseShiftedPhasePullbackSampler()
  {
    this(new FloatInterval(0,
                           4000),
         0.01);
  }

  public InverseShiftedPhasePullbackSampler(FloatInterval timeSpan, double dt)
  {
    super(timeSpan,
          dt);
    context = new Context();
    context.registerFunction("Φ", Φ);
    context.registerFunction("dΦ", dΦ);
    compiledF = RealFunction.compile("F:t->Z(Φ⁻¹(t))/sqrt(dΦ(Φ⁻¹(t)))", context);
    // Force the compile so the first instantiate() is cheap.
    compiledF.instantiate();
  }

  public int progressInterval = 1000;

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

  public Map<String, ThreadStats> threadStats     = new TreeMap<>();

  public int                      numberOfWorkers = Runtime.getRuntime().availableProcessors();

  @Override
  protected void prepareSamplePath()
  {
    double                                 t0         = timeSpan.getA().doubleValue();
    AtomicLong                             completed  = new AtomicLong(0);
    ConcurrentHashMap<String, ThreadStats> stats      = new ConcurrentHashMap<>();
    int                                    W          = numberOfWorkers;
    long                                   startNanos = System.nanoTime();

    try ( var sampledPath = Complex.newVector(N))
    {
      CountDownLatch done    = new CountDownLatch(W);
      Thread[]       workers = new Thread[W];

      for (int k = 0; k < W; k++)
      {
        final int workerIndex = k;
        workers[k] = new Thread(() ->
        {
          String      tname = Thread.currentThread().getName();
          ThreadStats s     = new ThreadStats();
          stats.put(tname, s);

          // Each worker owns its own fresh instance of the compiled expression.
          // The bytecode class is shared; only the per-evaluation register set
          // is fresh.
          RealFunction Fworker = compiledF.instantiate();

          try ( Real t = Real.valueOf(0.0); Real Fval = Real.valueOf(0.0))
          {
            for (int i = workerIndex; i < N; i += W)
            {
              if (progress.isCancelled())
              {
                break;
              }
              t.set(t0 + i * dt);

              long evalStart = System.nanoTime();
              Fworker.evaluate(t, 1, bits, Fval);
              s.totalNanos += System.nanoTime() - evalStart;
              s.count++;

              var slot = sampledPath.get(i);
              slot.re().set(Fval);
              slot.im().zero();

              long doneCount = completed.incrementAndGet();
              progress.setFraction((double) doneCount / N);
              if (doneCount % progressInterval == 0 || doneCount == N)
              {
                double pct        = 100.0 * doneCount / N;
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
        },
                                "PullbackWorker-"
           + workerIndex);
        workers[k].start();
      }

      try
      {
        done.await();
      }
      catch (InterruptedException ie)
      {
        Thread.currentThread().interrupt();
        throw new RuntimeException("Interrupted while sampling F(t)",
                                   ie);
      }

      ingestPrecomputedSamplePath(sampledPath);
    }

    threadStats = new TreeMap<>(stats);
    long elapsedNanos = System.nanoTime() - startNanos;
    printBenchmarkSummary(elapsedNanos);
  }

  protected void printBenchmarkSummary(long elapsedNanos)
  {
    double wallSec        = elapsedNanos / 1e9;
    long   totalCount     = 0;
    long   totalEvalNanos = 0;
    if (!log.isDebugEnabled())
    {
      for (ThreadStats s : threadStats.values())
      {
        totalCount     += s.count;
        totalEvalNanos += s.totalNanos;
      }
      return;
    }
    StringBuilder report = new StringBuilder();
    report.append("\n─── per‑thread benchmark ───\n");
    report.append(String.format("%-44s  %10s  %12s  %14s  %14s%n", "thread", "count", "sumEval(s)", "rate(eval/s)", "mean(ms/eval)"));
    for (Map.Entry<String, ThreadStats> e : threadStats.entrySet())
    {
      ThreadStats s = e.getValue();
      totalCount     += s.count;
      totalEvalNanos += s.totalNanos;
      report.append(String.format("%-44s  %10d  %12.3f  %14.2f  %14.2f%n", e.getKey(), s.count, s.totalNanos / 1e9, s.meanRate(), s.meanMillisPerEval()));
    }
    double globalRate = wallSec == 0 ? 0.0 : totalCount / wallSec;
    report.append(String.format("─── total: count=%d  wall=%.3fs  sumEval=%.3fs  global‑rate=%.2f eval/s  threads=%d ───",
                                totalCount,
                                wallSec,
                                totalEvalNanos / 1e9,
                                globalRate,
                                threadStats.size()));
    log.debug("{}", report);
  }
}
