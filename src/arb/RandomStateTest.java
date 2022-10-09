package arb;

import junit.framework.TestCase;

public class RandomStateTest extends
                             TestCase
{
  final static int prec = 128;

  public static void testRandomState()
  {

    try ( RandomState randomState = new RandomState(43); Real x = new Real())
    {
      randomState.nextElement(prec, x);
      System.out.println("first element drawn from RandomState(42) is " + x);
    }
  }
}
