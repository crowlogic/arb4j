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
 * <p>Two grid sizes are exercised: a smoke run on N = 1024 points with the
 * full available-processor worker count, and the production-sized run on
 * the same N = 100,000 default grid the GUI uses ([0, 1000] @ dt = 0.01).
 * The latter is the configuration in which earlier worker NPEs on
 * RealPolynomial.coeffs and Φ⁻¹ Newton non-convergence appeared, so it is
 * the one this test exists to keep regression-free.
 *
 * <p>Failure criterion: any worker thread throws, OR any sampled F(t) is
 * non-finite. The progress interval is bumped up so the surefire log does
 * not get drowned in 100k progress lines.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class InverseShiftedPhasePullbackSamplerHeadlessTest extends
                                                            TestCase
{
  /**
   * 1024-point smoke run with full worker parallelism. Exists to fail fast
   * if a regression of the per-worker Φ-clone path is introduced.
   *
   * <p><b>Disabled in surefire</b> (method name does not start with
   * {@code test}) until F's referenced-function reentrancy is settled
   * — currently flaky on ≥ 4-core hosts. Invoke explicitly with
   * {@code -Dtest=InverseShiftedPhasePullbackSamplerHeadlessTest#runSmokeRunFullParallelism}.
   */
  public static void testSmokeRunFullParallelism()
  {
    runHeadless(0.0, 10.24, 0.01, null, 250);
  }

  /**
   * Production-size run: matches the no-arg sampler defaults of the GUI
   * ([0, 1000] @ dt = 0.01, N = 100,000) with one worker per available
   * core. This is the configuration in which earlier reentrancy crashes
   * appeared.
   *
   * <p><b>Disabled in surefire</b> (method name does not start with
   * {@code test}) until F's referenced-function reentrancy is settled.
   * Invoke explicitly with
   * {@code -Dtest=InverseShiftedPhasePullbackSamplerHeadlessTest#runProductionSizeRun}
   * once the diagnosis is in place.
   */
  public static void testProductionSizeRun()
  {
    runHeadless(0.0, 1000.0, 0.01, null, 5000);
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
    long wallStart = System.nanoTime();
    try ( InverseShiftedPhasePullbackSampler sampler = new InverseShiftedPhasePullbackSampler(new FloatInterval(t0,
                                                                                                                t1),
                                                                                              dt))
    {
      if (workers != null)
      {
        sampler.numberOfWorkers = workers;
      }
      sampler.progressInterval = progress;
      System.out.printf("[headless] N=%d  workers=%d  dt=%.6f  span=[%.3f,%.3f]%n",
                        sampler.N,
                        sampler.numberOfWorkers,
                        sampler.dt,
                        t0,
                        t1);

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

      double wallSec = (System.nanoTime() - wallStart) / 1e9;
      System.out.printf("[headless] OK: N=%d  finite=%d  wall=%.3fs%n", N, N, wallSec);
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
