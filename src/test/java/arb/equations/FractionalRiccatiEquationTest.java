package arb.equations;

import arb.Complex;
import arb.FloatConstants;
import arb.FloatInterval;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;
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
    FractionalRiccatiEquation freq = new FractionalRiccatiEquation(RealConstants.one,
                                                                   "0",
                                                                   "2",
                                                                   "1");
    System.out.println(freq);
    var     discriminant = freq.discriminant();

    Complex p            = freq.p.eval(0.0, new Complex());
    System.out.println("p=" + p);
    Complex q = freq.q.eval(0.0, new Complex());
    System.out.println("q=" + q);
    Complex r = freq.r.eval(0.0, new Complex());
    System.out.println("r=" + r);
    assertEquals("0", p.toString());
    assertEquals("2", q.toString());
    assertEquals("1", r.toString());
    ShiftedJacobiPolynomials basis    = new ShiftedJacobiPolynomials();
    FloatInterval            domain   = new FloatInterval(FloatConstants.negOne,
                                                          FloatConstants.one);
    var p4 = basis.evaluate(4, 128).mul(freq.p);
    Function<Real, Complex> p4int = p4.asRealToComplexFunction().integral();
    var upper = p4int.evaluate(RealConstants.one, 1,128, new Complex());
    var lower = p4int.evaluate(RealConstants.zero, 1,128, new Complex());
    System.out.println("upper=%s\nlower=%s\n");
    
//    p4.inte
//    freq.r.project(basis.enumerate(0, 5),128,new Real());
    RealFunction             solution =
                                      RealFunction.express("1+sqrt(2)*tanh(sqrt(2)*x+1/2*log(((sqrt(2)-1)/(sqrt(2)+1))))");
    var                      y        = solution.eval(1.0);
    assertEquals(1.68949839159438298686019048603, y);
    var u = solution.evaluate(RealConstants.zero, 128, new Real());
    assertTrue(u.approximatelyEquals(RealConstants.zero, 128));
    ShellFunctions.plot(0, 1, 1000, solution);
    Thread.sleep(1000 * 100000000);
  }

}
