package arb.expressions.nodes.unary;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealPolynomialSequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionNodeOfTheFirstKindTest extends
                                                           TestCase
{
  public static void testj0ViaRealFunctionalExpression()
  {
    boolean              caught = false;

    RealFunctionSequence jk     = RealFunctionSequence.express("k->j(k,x)");
    RealFunction       y      = jk.evaluate(3, 128);

    System.out.println("j0(3)=" + y);

    assert false : "cool";
  }

  public static void testj0ViaExpression()
  {
    boolean caught = false;

    try
    {
      RealPolynomialSequence j0 = RealPolynomialSequence.express("k->j(k,x)");
      RealPolynomial         y  = j0.evaluate(3, 128);

      System.out.println("j0(2.3)=" + y);
      assertEquals(0.0856499630648839, y.eval(2.3));
    }
    catch (CompilerException e)
    {
      caught = true;
      assertTrue(e.getMessage().contains("can not be represented"));
    }
    assertTrue(caught);
  }

  public static void testj0ViaRealFunction()
  {
    RealFunction j0 = RealFunction.express("j(3,x)");
    double       y  = j0.eval(2.3);
    // System.out.println("j0(2.3)=" + y);
    assertEquals(0.0856499630648839, y);
  }
}
