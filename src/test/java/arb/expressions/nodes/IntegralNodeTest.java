package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegralNodeTest extends
                              TestCase
{
  public void testGetElementOfAsequence()
  {

    var context = new Context();
    var P       = new ShiftedJacobiPolynomials();
    context.registerSequence("P", P);
    var f = RealPolynomialNullaryFunction.express("P(3)", context);
    assertEquals(P.evaluate(3, 128), f.evaluate() );
  }

  public void testIntegralOfAElementOfAContextualSequence()
  {
    var context = new Context();
    var P       = new ShiftedJacobiPolynomials();
    context.registerSequence("P", P);
    var p3norm = RealNullaryFunction.express("int(P(3)^2,x=-1..1)", context);
    
    System.out.println("p3norm=" + p3norm);
    assertEquals(0.09486607143, p3norm.eval());
  }

  public void testIntegralProgrammerSyntax()
  {
    var z = RealFunction.express("int(x,x=2..4)");
    var x = z.evaluate(new Real("0",
                                128),
                       128);
    assertEquals("6", x.toString());
  }
}
