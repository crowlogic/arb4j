package arb.applications;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import junit.framework.TestCase;

/**
 * Small-grid smoke test for {@link InverseShiftedPhasePullbackSampler}.
 * Builds F(t) = Z(Φ⁻¹(t))/√Φ′(Φ⁻¹(t)) on a short t-window, drives the
 * path-based ingestion of {@link StationaryGaussianProcessSampler}, and
 * verifies (1) all samplePath entries are finite real numbers, (2) the
 * empirical orthogonal random measure round-trips back to the sampled F via
 * the inverse DFT, and (3) the empirical power spectral density is finite
 * and non-negative on every bin.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class InverseShiftedPhasePullbackSamplerTest extends
                                                    TestCase
{

  /**
   * Exercise the end-to-end pullback pipeline on a 16-point grid. The
   * window [50, 50 + 16·0.5] = [50, 58] is well above Φ(0), so Φ⁻¹ is in its
   * comfortable domain at every grid point.
   */
  public static void testSamplePathIngestionRoundTrip()
  {
    double t0 = 50.0;
    double dt = 0.5;
    int    N  = 16;
    double L  = N * dt;

    try ( var sampler = new InverseShiftedPhasePullbackSampler(new FloatInterval(t0, t0 + L), dt))
    {
      assertEquals("N from constructor", N, sampler.N);
      assertEquals("dt from constructor", dt, sampler.dt, 1e-15);

      sampler.prepareSamplePath();

      for (int i = 0; i < N; i++)
      {
        double re = sampler.samplePath.get(i).re().doubleValue();
        double im = sampler.samplePath.get(i).im().doubleValue();
        assertTrue("samplePath[" + i + "].re not finite: " + re, Double.isFinite(re));
        assertEquals("samplePath[" + i + "].im should be 0", 0.0, im, 0.0);
      }

      try ( Complex roundTrip = Complex.newVector(N);
            Real    err       = new Real())
      {
        sampler.randomMeasure.applyInverseDiscreteFourierTransform(128, roundTrip);
        double maxAbsErr = 0.0;
        for (int i = 0; i < N; i++)
        {
          double dr = roundTrip.get(i).re().doubleValue() - sampler.samplePath.get(i).re().doubleValue();
          double di = roundTrip.get(i).im().doubleValue() - sampler.samplePath.get(i).im().doubleValue();
          maxAbsErr = Math.max(maxAbsErr, Math.hypot(dr, di));
        }
        assertTrue("randomMeasure → IFFT → samplePath round-trip error " + maxAbsErr,
                   maxAbsErr < 1e-12);
      }

      for (int k = 0; k < N; k++)
      {
        double p = sampler.powerSpectralDensity[k];
        assertTrue("PSD[" + k + "] = " + p + " not finite/non-negative",
                   Double.isFinite(p) && p >= 0.0);
      }
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }
}
