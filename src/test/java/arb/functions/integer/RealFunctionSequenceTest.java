package arb.functions.integer;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealFunctionSequenceTest extends
                                      TestCase
{
  public static void testSeq1()
  {
    // Expression.trace
    RealFunctionSequence func = RealFunctionSequence.express("χ", "i➔p➔int(t➔t^(i+p), t=-1..1)");
    
    
  }
  public static void testRealFunctionSequence()
  {

    var    f  =
             RealFunctionSequence.express("f:k➔√((2*k+½)/π)*((k+1)⋰-½)^2*√((8*k+2)/π)*(-1)^k*j(2*k,x)");
    var    f3 = f.evaluate(3, 128);
    double x  = f3.eval(2.3, new Real()).doubleValue();
    assertEquals(-0.0011637168426654918, x, 6e-9);
  }
}
