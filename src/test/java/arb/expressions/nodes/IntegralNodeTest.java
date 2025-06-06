package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomials;
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
  public void testIntegralOfSquareRoot()
  {
    var f = RealFunction.express("1/sqrt(1-x^2)");
    var y = f.eval(0.75);

    var g = RealFunction.express("diff(arcsin(x),x)");
    var z = g.eval(0.75);
    assertEquals(f.toString(), g.toString());

    assertEquals(y, z);

  }

  public void testGetElementOfAsequence()
  {

    var context = new Context();
    var P       = new ShiftedJacobiPolynomials();
    context.registerSequence("P", P);
    var f = RealPolynomialNullaryFunction.express("P(3)", context);
    assertEquals(P.evaluate(3, 128), f.evaluate());
  }

  public void testJacobiPolynomialSquared()
  {
    var context = new Context();
    context.registerSequence("P", new ShiftedJacobiPolynomials());
    var F = RealPolynomialNullaryFunction.express("P(3)^2", context);
    var f = F.evaluate();
    assertEquals("6.25*x⁶ - 9.375*x⁴ - 5*x³ + 3.515625*x² + 3.75*x + 1", f.toString());
  }

  public void testIntegralOfAElementOfAContextualSequence()
  {
    var context = new Context();
    var P       = new JacobiPolynomials(RealConstants.negHalf,
                                        RealConstants.negHalf);
    context.registerSequence("P", P);
    var    p3norm = RealNullaryFunction.express("int(P(3)(x),x=-1...0)", context);
    double val    = p3norm.eval();
    assertEquals(0.15625, val);
  }

  public void testFunctionOfPolynomialElementOfAContextualSequence()
  {
    var context = new Context();
    var P       = new JacobiPolynomials(RealConstants.negHalf,
                                        RealConstants.negHalf);
    context.registerSequence("P", P);
    var  prototype = RealNullaryFunction.parse("P(3)(0.75)", context);

    var  p3val     = prototype.instantiate();

    Real val       = p3val.evaluate();
    assertEquals(-0.17578125, val.doubleValue());
  }

  public void testIntegralOfAnElementOfAContextualSequenceSquared()
  {
    var context = new Context();
    var P       = new JacobiPolynomials(RealConstants.negHalf,
                                        RealConstants.negHalf);
    context.registerSequence("P", P);
    var p3norm = RealNullaryFunction.express("int((P(3)^2)(x),x=-1..1)", context);
    assertEquals(0.09486607142857142, p3norm.eval());
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
