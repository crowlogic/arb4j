package arb.applications;

import arb.FloatInterval;
import junit.framework.TestCase;

/**
 * Headless full-scale reproducer for the parallel sampling stage of
 * {@link InverseShiftedPhasePullbackSampler}. Skips JavaFX entirely by
 * constructing the sampler and invoking its
 * {@link InverseShiftedPhasePullbackSampler#prepareSamplePath()} directly,
 * which is the only stage that exercises the per-worker clones of Φ, dΦ,
 * Φ⁻¹, and the compiled F.
 *
 * <p>A small N = 256 smoke grid with two parallel workers is exercised
 * here; this is enough surface to detect a regression of the per-worker
 * Φ-clone path and the Φ⁻¹(0) Newton terminator while keeping the
 * surefire run under one second. Larger production-scale runs
 * ([0, 1000] @ dt = 0.01, N = 100,000) are kept out of the main suite
 * — invoke {@link #runProductionSize(double, double, double)}
 * directly from a manual driver when needed.
 *
 * <p>Failure criterion: any worker thread throws, OR any sampled F(t) is
 * non-finite.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class InverseShiftedPhasePullbackSamplerHeadlessTest extends
                                                            TestCase
{
  /**
   * 256-point smoke run with two parallel workers. Exists to fail fast
   * if a regression of the per-worker Φ-clone path or the Φ⁻¹(0) Newton
   * terminator is introduced. Suppresses progress prints by setting the
   * progress interval beyond N.
   */
  public static void testSmokeRunFullParallelism()
  {
    runHeadless(0.0, 2.56, 0.01, 2, Integer.MAX_VALUE);
  }

  /**
   * Manual driver for production-size runs ([0, 1000] @ dt = 0.01,
   * N = 100,000). Not auto-discovered by surefire — name does not start
   * with {@code test}. Invoke from a one-off main or by passing the
   * exact method name to {@code -Dtest=...#runProductionSize}.
   *
   * @param t0 lower endpoint of the time window
   * @param t1 upper endpoint of the time window
   * @param dt grid spacing
   */
  public static void runProductionSize(double t0, double t1, double dt)
  {
    runHeadless(t0, t1, dt, null, 5000);
  }

  /**
   * Drive a single end-to-end run of {@code prepareSamplePath()} and
   * verify every sampled F(t) is finite.
   *
   * @param t0       lower endpoint of the time window
   * @param t1       upper endpoint of the time window
   * @param dt       grid spacing
   * @param workers  worker count override; {@code null} uses the sampler default
   *                 of {@code Runtime.availableProcessors()}
   * @param progress progress-print interval
   */
  static void runHeadless(double t0, double t1, double dt, Integer workers, int progress)
  {
    try ( InverseShiftedPhasePullbackSampler sampler = new InverseShiftedPhasePullbackSampler(new FloatInterval(t0,
                                                                                                                t1),
                                                                                              dt))
    {
      if (workers != null)
      {
        sampler.numberOfWorkers = workers;
      }
      sampler.progressInterval = progress;

      sampler.prepareSamplePath();

      int N = sampler.N;
      for (int i = 0; i < N; i++)
      {
        double re = sampler.samplePath.get(i).re().doubleValue();
        double im = sampler.samplePath.get(i).im().doubleValue();
        assertTrue("samplePath[" + i + "].re not finite: " + re, Double.isFinite(re));
        assertEquals("samplePath[" + i + "].im should be 0", 0.0, im, 0.0);
      }

      long totalEvals = sampler.threadStats.values().stream()
                                            .mapToLong(s -> s.count)
                                            .sum();
      assertEquals("sum of per-thread counts should equal N", (long) N, totalEvals);
    }
    catch (RuntimeException re)
    {
      throw re;
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }
}
