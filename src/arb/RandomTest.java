package arb;

import static arb.utensils.Utilities.println;

import junit.framework.TestCase;

public class RandomTest extends
                        TestCase
{
  @SuppressWarnings("resource")
  public static void testRandomState()
  {
    RandomState state  = new RandomState(55);
    RandomState state2 = new RandomState(55);
    Real        rnd    = new Real().random(state, 128);
    Real        rnd2   = new Real().random(state2, 128);
    println("rnd(55)=" + rnd);
    println("rnd(55)=" + rnd2);
  }

  public static void testUniformRandom()
  {

    try ( RandomState state = new RandomState(55); Real rnd = new Real(); Real x = new Real())
    {
      rnd.printPrecision = true;

      int n = 1000000;
      for (int i = 0; i < n; i++)
      {
        x.add(rnd.random(state, 128), 128, x);
      }
      x.div(n / 2, 128);
      assertEquals(RealConstants.one.doubleValue(), x.doubleValue(), Math.pow(10, -3));
    }
  }
}
