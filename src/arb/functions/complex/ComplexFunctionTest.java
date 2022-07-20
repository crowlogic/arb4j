package arb.functions.complex;

import static arb.RealConstants.*;

import arb.*;
import arb.functions.*;
import junit.framework.*;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testAbs()
  {
    try ( Complex a = new Complex();)
    {
      a.set(one, one);
      Function<Complex, Real> absoluteValueOfAConstantFunction = new ComplexConstant(a).abs();

      Real                    sqrt2                            = a.abs(128, new Real());
      Real                    b                                = absoluteValueOfAConstantFunction.evaluate(ComplexConstants.ZERO,
                                                                                                           1,
                                                                                                           128,
                                                                                                           new Real());
//      System.out.println("|1+i|="
//                    + b);
      assertEquals(sqrt2, b);

    }
  }

}
