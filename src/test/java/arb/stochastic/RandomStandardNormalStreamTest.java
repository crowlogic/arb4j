package arb.stochastic;

import arb.Real;
import junit.framework.TestCase;

public class RandomStandardNormalStreamTest extends
                                            TestCase
{
  public void testIt()
  {
    int bits = 128;
    try ( RandomStandardNormalStream stream = new RandomStandardNormalStream())
    {
      stream.initializeWithSeed(777);

      for (int i = 0; i < 45; i++)
      {
        try ( var sample = new Real())
        {
          stream.sample(bits, sample);
          System.out.println(sample);
        }
      }
    }
  }
}
