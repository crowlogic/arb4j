package arb.stochastic;

import junit.framework.TestCase;

public class ComplexWhiteNoiseProcessTest extends
                                          TestCase
{
  public void testComplexWhiteNoiseSampleStream()
  {
    int bits = 128;
    try ( ComplexWhiteNoiseProcess whiteNoise = new ComplexWhiteNoiseProcess())
    {
      whiteNoise.initializeWithSeed(777);
      int    limit = 10000;
      double mean  = whiteNoise.stream(128, limit)
                               .mapToDouble(x -> x.re().doubleValue())
                               .average()
                               .getAsDouble();
      whiteNoise.initializeWithSeed(777);
      double mean2 = whiteNoise.stream(128, limit)
                               .mapToDouble(x -> x.re().doubleValue())
                               .average()
                               .getAsDouble();
      assertEquals(mean, mean2);
      whiteNoise.initializeWithSeed(777);
      double variance = whiteNoise.stream(128, limit)
                                  .mapToDouble(x -> x.re().pow(2, bits).doubleValue())
                                  .average()
                                  .getAsDouble();
      assertTrue(String.format("variance %s < 0.95", variance), variance >= 0.95);

      whiteNoise.initializeWithSeed(777);
      mean = whiteNoise.stream(128, limit)
                       .mapToDouble(x -> x.im().doubleValue())
                       .average()
                       .getAsDouble();
      whiteNoise.initializeWithSeed(777);
      mean2 = whiteNoise.stream(128, limit)
                        .mapToDouble(x -> x.im().doubleValue())
                        .average()
                        .getAsDouble();
      assertEquals(mean, mean2);
      whiteNoise.initializeWithSeed(777);
      variance = whiteNoise.stream(128, limit)
                           .mapToDouble(x -> x.im().pow(2, bits).doubleValue())
                           .average()
                           .getAsDouble();
      assertTrue(String.format("variance %s < 0.95", variance), variance >= 0.95);
    }
  }
}
