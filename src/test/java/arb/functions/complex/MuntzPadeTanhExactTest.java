package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Verifies that the Müntz-Padé approximant produces tanh(t) exactly.
 * A Padé approximant IS the function — zero error in arb precision.
 */
public class MuntzPadeTanhExactTest extends
                                   TestCase
{
  private static final int     BITS   = 256;
  private static final Complex ZERO_V = new Complex();

  private static RiccatiMuntzPadeFunctional makeTanhFunctional()
  {
    return new RiccatiMuntzPadeFunctional(new Real().set("1", BITS),
                                          "1",
                                          "0",
                                          "-1");
  }

  private static void assertExactTanh(String label, String tStr)
  {
    try ( RiccatiMuntzPadeFunctional eq = makeTanhFunctional();
          ComplexFunction approx = eq.evaluate(ZERO_V, 1, BITS, null);
          Complex z = new Complex(tStr, BITS);
          Complex r = new Complex();
          Real ref = new Real();
          Real err = new Real())
    {
      approx.evaluate(z, 1, BITS, r);
      RealNullaryFunction.express("tanh(" + tStr + ")").evaluate(BITS * 2, ref);
      r.getReal().sub(ref, BITS * 2, err);
      assertTrue(label + " error must be zero: " + err, err.isZeroUpTo(BITS));
    }
  }

  public void testTanhAtZero()     { assertExactTanh("tanh(0)",     "0");   }
  public void testTanhAtQuarter()  { assertExactTanh("tanh(1/4)",   "1/4"); }
  public void testTanhAtHalf()     { assertExactTanh("tanh(1/2)",   "1/2"); }
  public void testTanhAtOne()      { assertExactTanh("tanh(1)",     "1");   }
  public void testTanhAtTwo()      { assertExactTanh("tanh(2)",     "2");   }
  public void testTanhAtThree()    { assertExactTanh("tanh(3)",     "3");   }
  public void testTanhAtFive()     { assertExactTanh("tanh(5)",     "5");   }
  public void testTanhAtMinusOne() { assertExactTanh("tanh(-1)",    "-1");  }
}
