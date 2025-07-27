package arb.stochastic;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.RealWhiteNoiseProcess;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 **/
public class RealWhiteNoiseProcessTest extends
                                       TestCase
{
  public void testWhiteNoiseSampleStream()
  {
    int bits = 128;
    try ( RealWhiteNoiseProcess whiteNoise = new RealWhiteNoiseProcess())
    {
      whiteNoise.initializeWithSeed(777);
      int    limit = 10000;
      double mean  = whiteNoise.stream(128, limit)
                               .mapToDouble(Real::doubleValue)
                               .average()
                               .getAsDouble();
      whiteNoise.initializeWithSeed(777);
      double mean2 = whiteNoise.sample(128, Real.newVector(limit))
                               .stream()
                               .mapToDouble(Real::doubleValue)
                               .average()
                               .getAsDouble();
      assertEquals(mean, mean2);
      whiteNoise.initializeWithSeed(777);
      double variance = whiteNoise.stream(128, limit)
                                  .mapToDouble(x -> x.pow(2, bits).doubleValue())
                                  .average()
                                  .getAsDouble();
      assertTrue(String.format("variance %s < 0.95", variance), variance >= 0.95);
    }
  }
}
