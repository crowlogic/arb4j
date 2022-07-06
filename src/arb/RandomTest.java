package arb;

import junit.framework.*;

public class RandomTest extends
                        TestCase
{
  public static void testBoring()
  {
    Real rnd = new Real();
    rnd.printPrecision = true;

    RandomState state = new RandomState(405);

    for (int i = 0; i < 10; i++)
    {
      rnd.random(state, 128);
      System.out.println(rnd);
    }

  }
}
