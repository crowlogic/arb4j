package arb.equations;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalRiccatiEquationTest extends
                                           TestCase
{

  public static void testFractionalRiccati() throws InterruptedException
  {
    FractionalRiccatiEquation fractionalRiccatiEquation = new FractionalRiccatiEquation(RealConstants.one,
                                                                                        "0",
                                                                                        "2",
                                                                                        "1");
    System.out.println(fractionalRiccatiEquation);
    var     discriminant = fractionalRiccatiEquation.discriminant();

    Complex p            = fractionalRiccatiEquation.p.eval(0.0, new Complex());
    System.out.println("p=" + p);
    Complex q = fractionalRiccatiEquation.q.eval(0.0, new Complex());
    System.out.println("q=" + q);
    Complex r = fractionalRiccatiEquation.r.eval(0.0, new Complex());
    System.out.println("r=" + r);
    assertEquals("0", p.toString());
    assertEquals("2", q.toString());
    assertEquals("1", r.toString());

    RealFunction solution = RealFunction.express("1+sqrt(2)*tanh(sqrt(2)*x+1/2*log(((sqrt(2)-1)/(sqrt(2)+1))))");
    var          y        = solution.eval(1.0);
    assertEquals(1.68949839159438298686019048603, y);
    var u = solution.evaluate(RealConstants.zero, 128, new Real());
    assertTrue(u.approximatelyEquals(RealConstants.zero, 128));
    // ShellFunctions.plot(0, 1, 1000, solution);
    // Thread.sleep(1000*100000000);
  }

}
