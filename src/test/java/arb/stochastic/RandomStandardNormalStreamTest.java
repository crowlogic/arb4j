package arb.stochastic;

import arb.Real;
import junit.framework.TestCase;

public class RandomStandardNormalStreamTest extends
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
      double mean2 = whiteNoise.stream(128, limit)
                               .mapToDouble(Real::doubleValue)
                               .average()
                               .getAsDouble();
      assertEquals(mean, mean2);
      double variance = whiteNoise.stream(128, limit)
                                  .mapToDouble(x -> x.pow(2, bits).doubleValue())
                                  .average()
                                  .getAsDouble();
      assertTrue(String.format("variance %s < 0.95", variance), variance >= 0.95);
    }
  }
}
