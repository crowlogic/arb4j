package arb.applications;

import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicLong;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

/**
 * <h3>Raw Hardy Z Sampler</h3>
 *
 * <p>
 * Samples the Hardy Z function directly on a uniform grid
 * {@code [0, 0 + N·dt) ⊂ [0, L]} and feeds it into the path-based ingestion
 * mode of {@link StationaryGaussianProcessSampler}. This is the same
 * pipeline as {@link InverseShiftedPhasePullbackSampler}, but without the
 * inverse-shifted-phase reparameterization \u2014 no Φ, no Φ⁻¹, no
 * Jacobian. The compiled DSL expression is simply
 *
 * <pre>
 *   F(t) = Z(t)
 * </pre>
 *
 * <p>
 * <b>Z is not stationary.</b> The downstream consumer
 * {@link StationaryGaussianProcessSampler#ingestPrecomputedSamplePath}
 * expects a wide-sense stationary input and computes its empirical
 * autocorrelation and periodogram on that assumption. Feeding the raw
 * Z(t) on [0, L] deliberately violates that assumption \u2014 the height
 * dependence of the local Z-zero density makes the second-order statistics
 * non-translation-invariant. The interesting empirical artifact this
 * exposes (referenced by the user) is exactly what shows up in the four
 * StationaryGaussianProcessSampler chart panes when this contract is
 * violated on Z directly.
 *
 * <p>
 * The N evaluations of Z(t_i) are independent and embarrassingly parallel.
 * Each worker owns a freshly-instantiated copy of the compiled
 * {@code t -> Z(t)} expression so that the per-evaluation register set is
 * thread-local; the bytecode class is shared.
 *
 * @see InverseShiftedPhasePullbackSampler the stationary counterpart
 *      this class is copied from
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link arb.documentation.TheArb4jLibrary}
 */
public class HardyZSampler extends
                           StationaryGaussianProcessSampler
{
  private static final Logger log = LoggerFactory.getLogger(HardyZSampler.class);

  public static void main(String[] args)
  {
    launch(args);
  }

  protected final Expression<Real, Real, RealFunction> compiledZ;

  /**
   * Default time span [0, 2000] with dt = 0.01, matching
   * {@link InverseShiftedPhasePullbackSampler}'s no-arg constructor so the
   * two side-by-side runs share their grid.
   */
  public HardyZSampler()
  {
    this(new FloatInterval(2000,
                           4000),
         0.01);
  }

  /**
   * Sample Z(t) on the uniform grid {@code [t0, t0 + N·dt)} where
   * {@code t0 = timeSpan.getA()} and {@code N = (int) (length(timeSpan) / dt)}.
   *
   * @param timeSpan time-domain support; the user-supplied "upper length"
   *                 is the right endpoint (typically {@code timeSpan.getA() = 0}
   *                 and {@code timeSpan.getB() = L}).
   * @param dt       uniform spacing between samples.
   */
  public HardyZSampler(FloatInterval timeSpan, double dt)
  {
    super(timeSpan,
          dt);
    compiledZ = RealFunction.compile("F:t->Z(t)");
    // Force the compile so the first instantiate() is cheap.
    compiledZ.instantiate();
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

          // Each worker owns its own fresh instance of the compiled
          // expression. The bytecode class is shared; only the
          // per-evaluation register set is fresh.
          RealFunction Zworker = compiledZ.instantiate();

          try ( Real t = Real.valueOf(0.0); Real Zval = Real.valueOf(0.0))
          {
            for (int i = workerIndex; i < N; i += W)
            {
              t.set(t0 + i * dt);

              long evalStart = System.nanoTime();
              Zworker.evaluate(t, 1, bits, Zval);
              s.totalNanos += System.nanoTime() - evalStart;
              s.count++;

              var slot = sampledPath.get(i);
              slot.re().set(Zval);
              slot.im().zero();

              long doneCount = completed.incrementAndGet();
              if (doneCount % progressInterval == 0 || doneCount == N)
              {
                double pct        = 100.0 * doneCount / N;
                double elapsedSec = (System.nanoTime() - startNanos) / 1e9;
                System.out.printf("[%s] i=%d  done=%d/%d  %5.1f%%  %.2fs  thread\u2011rate=%.2f eval/s  thread\u2011mean=%.3f ms/eval%n",
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
                                "HardyZWorker-"
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
        throw new RuntimeException("Interrupted while sampling Z(t)",
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
    report.append("\n\u2500\u2500\u2500 per\u2011thread benchmark \u2500\u2500\u2500\n");
    report.append(String.format("%-44s  %10s  %12s  %14s  %14s%n", "thread", "count", "sumEval(s)", "rate(eval/s)", "mean(ms/eval)"));
    for (Map.Entry<String, ThreadStats> e : threadStats.entrySet())
    {
      ThreadStats s = e.getValue();
      totalCount     += s.count;
      totalEvalNanos += s.totalNanos;
      report.append(String.format("%-44s  %10d  %12.3f  %14.2f  %14.2f%n", e.getKey(), s.count, s.totalNanos / 1e9, s.meanRate(), s.meanMillisPerEval()));
    }
    double globalRate = wallSec == 0 ? 0.0 : totalCount / wallSec;
    report.append(String.format("\u2500\u2500\u2500 total: count=%d  wall=%.3fs  sumEval=%.3fs  global\u2011rate=%.2f eval/s  threads=%d \u2500\u2500\u2500",
                                totalCount,
                                wallSec,
                                totalEvalNanos / 1e9,
                                globalRate,
                                threadStats.size()));
    log.debug("{}", report);
  }
}
