package arb.functions.integer;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFunctionSequenceTest extends
                                         TestCase
{
  public static void testComplexFunctionSeq1()
  {

    ComplexFunctionSequence seq      =
                                ComplexFunctionSequence.express("χ", "i➔p➔int(t➔t^(i+p), t=-1..1)");
    ComplexFunction         function = seq.apply(3);
    Complex                 y        = function.eval(2.3, new Complex());

    assertEquals("0.0654309123345280 +/- 2.84e-17 + i*-0.1284153959325313 +/- 2.69e-17",
                 y.toString());
  }
}
