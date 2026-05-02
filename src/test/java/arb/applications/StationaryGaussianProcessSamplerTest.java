package arb.applications;

import arb.Complex;
import arb.FloatConstants;
import arb.FloatInterval;
import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Round-trip and grid-customization checks for the refactored
 * {@link StationaryGaussianProcessSampler} — the new path-based ingestion
 * mode (samplePath → FFT → orthogonal random measure → empirical PSD), and
 * the constructor that lets subclasses choose a non-default time interval
 * and step.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class StationaryGaussianProcessSamplerTest extends
                                                 TestCase
{

  /**
   * Minimal concrete sampler with a small custom grid. Sub-classes only need
   * a no-theory body; spectralSupport comes from the base default.
   */
  static class TinySampler extends
                           StationaryGaussianProcessSampler
  {
    TinySampler(double L, double dt)
    {
      super(new FloatInterval(0, (int) L), dt);
    }

    @Override
    public RealFunction getKernel()
    {
      return null;
    }

    @Override
    protected FloatInterval getSpectralSupport()
    {
      return new FloatInterval(FloatConstants.negOne, FloatConstants.one);
    }
  }

  /**
   * Construct a tiny sampler on [0, 16] @ dt = 0.5 (N = 32), build a known
   * deterministic Complex path, ingest it, derive the orthogonal random
   * measure, IFFT back, and verify the round-trip matches the original
   * within arithmetic precision.
   */
  public static void testIngestRoundTrip()
  {
    int  N    = 32;
    double dt = 0.5;
    double L  = N * dt;

    try ( var sampler = new TinySampler(L, dt))
    {
      assertEquals("N from constructor", N, sampler.N);
      assertEquals("dt from constructor", dt, sampler.dt, 1e-15);

      try ( Complex original = Complex.newVector(N);
            Complex roundTrip = Complex.newVector(N);
            Real    diff      = new Real())
      {
        for (int i = 0; i < N; i++)
        {
          double t = i * dt;
          original.get(i).set(Math.sin(0.7 * t) + 0.3 * Math.cos(1.4 * t),
                              0.2 * Math.sin(0.5 * t));
        }

        sampler.ingestPrecomputedSamplePath(original);

        // Path-based ingestion fills randomMeasure via forward FFT with the
        // 1/N normalization (Complex#applyDiscreteFourierTransform). The
        // matching inverse must recover the original samplePath.
        sampler.randomMeasure.applyInverseDiscreteFourierTransform(128, roundTrip);

        double maxAbsErr = 0.0;
        for (int i = 0; i < N; i++)
        {
          double er = roundTrip.get(i).re().doubleValue() - original.get(i).re().doubleValue();
          double ei = roundTrip.get(i).im().doubleValue() - original.get(i).im().doubleValue();
          maxAbsErr = Math.max(maxAbsErr, Math.hypot(er, ei));
        }
        assertTrue(String.format("FFT/IFFT round-trip error %g exceeds 1e-14", maxAbsErr),
                   maxAbsErr < 1e-14);

        // Empirical PSD non-negative and finite at all bins.
        for (int k = 0; k < N; k++)
        {
          double p = sampler.powerSpectralDensity.get(k).getMid().doubleValue();
          assertTrue("PSD[" + k + "] = " + p + " not finite/non-negative",
                     Double.isFinite(p) && p >= 0.0);
        }
      }
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }

  /**
   * Grid customization: a sampler constructed with a non-default timeSpan
   * and dt must report consistent N, df, nyquistFrequency, nyquistIndex.
   */
  public static void testCustomGridDerivedFields()
  {
    try ( var sampler = new TinySampler(20.0, 0.1))
    {
      int    expectedN  = 200;
      double expectedDf = 1.0 / 20.0;
      double expectedNy = 1.0 / (2 * 0.1);

      assertEquals("N",                expectedN,  sampler.N);
      assertEquals("df",               expectedDf, sampler.df, 1e-15);
      assertEquals("nyquistFrequency", expectedNy, sampler.nyquistFrequency, 1e-15);
      assertEquals("nyquistIndex",     expectedN / 2, sampler.nyquistIndex);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }
}
