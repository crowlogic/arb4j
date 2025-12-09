package arb.expressions.nodes;

import static org.junit.Assert.assertNotEquals;

import arb.*;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomialSequence;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class IntegralNodeTest
                              extends
                              TestCase
{

  public void testIntegral()
  {
    var          context = new Context();
    var          w       = RealFunction.express("w:1/√(1-λ²)",
                                                context);
    RealFunction wInt    = RealFunction.express("t➔∫s➔w(s)ds∈{-1..t}",
                                                context);
    assertEquals(Math.PI,
                 wInt.eval(1));

  }

  /**
   * <pre>
   * </pre>
   */
  public void testSincIntegral()
  {
    var     f     = ComplexFunction.express("y➔∫x➔exp(-I*x*y)dx∈{-1..1}");//int(exp(-I*x*y),x=-1..1)");
    Complex eval  = f.eval(1.0,
                           new Complex());
    Complex eval2 = f.eval(2.0,
                           new Complex());
    assertNotEquals(eval,
                    eval2);
  }

  public void testDefiniteIntegralOfSquareRoot()
  {

    var e = RealFunction.express("ω➔∫λ➔1/√(1-λ²)dλ∈(-1,ω)");
    var f = RealFunction.express("x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)");
    var y = f.eval(0.75);

    var g = RealFunction.express("arcsin(x)+π⁄2");
    var z = g.eval(0.75);

    assertEquals(z,
                 y);

  }

  public void testDefiniteIntegralOfSquareRootStringRepresentation()
  {
    var e = RealFunction.express("ω➔∫λ➔1/√(1-λ²)dλ∈(-1,ω)");
    var f = RealFunction.express("x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)");
    var y = f.eval(0.75);

    var g = RealFunction.express("arcsin(x)-arcsin(-1)");
    var z = g.eval(0.75);

    assertEquals(g.toString(),
                 f.toString());
  }

  public void testIntegralOfSquareRootToo()
  {
    var f = RealFunction.express("∫y➔1/sqrt(1-y^2)dy");
    var y = f.eval(0.75);

    var g = RealFunction.express("arcsin(y)");
    var z = g.eval(0.75);

    assertEquals(y,
                 z);

  }

  public void testBothWaysOfSpecifyingTheFunctionName()
  {
    var f = RealFunction.express("f:arcsin(y)");
    var g = RealFunction.express("f",
                                 "arcsin(y)");
    assertEquals(f.toString(),
                 g.toString());
  }

  public void testStringRepresentationOfIntegralOfSquareRoot()
  {
    var f = RealFunction.express("f",
                                 "∫y➔1/sqrt(1-y^2)dy");
    var y = f.eval(0.75);

    var g = RealFunction.express("f",
                                 "arcsin(y)");
    var z = g.eval(0.75);
    assertEquals(f.toString(),
                 g.toString());

  }

  public void testIntegralOfSquareRoot()
  {
    var f = RealFunction.express("1/sqrt(1-x^2)");
    var y = f.eval(0.75);

    var g = RealFunction.express("diff(arcsin(x),x)");
    var z = g.eval(0.75);
    assertEquals(f.toString(),
                 g.toString());

    assertEquals(y,
                 z);

  }

  public void testGetElementOfAsequence()
  {

    var context = new Context();
    var P       = new ShiftedJacobiPolynomials();
    context.registerSequence("P",
                             P);
    var f = RealPolynomialNullaryFunction.express("P(3)",
                                                  context);
    assertEquals(P.evaluate(3,
                            128),
                 f.evaluate());
  }

  public void testJacobiPolynomialSquared()
  {
    var context = new Context();
    context.registerSequence("P",
                             new ShiftedJacobiPolynomials());
    var F = RealPolynomialNullaryFunction.express("P(3)^2",
                                                  context);
    var f = F.evaluate();
    assertEquals("6.25*x⁶ - 9.375*x⁴ - 5*x³ + 3.515625*x² + 3.75*x + 1",
                 f.toString());
  }

  public void testIntegralOfAElementOfAContextualSequence()
  {
    try ( Real result = new Real())
    {

      var context = new Context();
      var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                                 RealConstants.negHalf);
      context.registerSequence("P",
                               P);
      var p3norm = RealNullaryFunction.express("int(P(3)(x),x=-1...1)",
                                               context);
      assertTrue(p3norm.evaluate(128,
                                 result).isZero());
    }
  }

  public void testAnotherIntegralOfASequenceAnotherWay()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var P4 = RealPolynomialNullaryFunction.express("P4:P(4)",
                                                   context);
    context.injectReferences(P4);

    var poly = P4.integral();

    assertEquals("0.4375*x⁵ - 0.72916666666666666666666666666666666666*x³ + 0.2734375*x",
                 poly.toString());
  }

  public void testAnotherIntegralOfASequence()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var P4 = RealPolynomialNullaryFunction.express("P4:P(4)",
                                                   context);
    context.injectReferences(P4);

    var P4int = RealPolynomialNullaryFunction.express("int(P4(x),x)",
                                                      context);

    var poly  = P4int.evaluate();
    assertEquals("0.4375*x⁵ - 0.72916666666666666666666666666666666666*x³ + 0.2734375*x",
                 poly.toString());
  }

  public void testAnotherToo()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var    P4     = P.evaluate(3,
                               128);

    var    P4int  = P4.integral();

    double top    = P4int.eval(1.0);
    double bottom = P4int.eval(-1.0);
    assertEquals(-0.15625,
                 top);
    assertTrue(top < 0);
    assertTrue(bottom < 0);
    assertEquals(top,
                 bottom);
  }

  public void testFunctionOfPolynomialElementOfAContextualSequence()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var  prototype = RealNullaryFunction.parse("P(3)(0.75)",
                                               context);

    var  p3val     = prototype.instantiate();

    Real val       = p3val.evaluate();
    assertEquals(-0.17578125,
                 val.doubleValue());
  }

  public void testIntegralOfAnElementOfAContextualSequenceSquared2()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var            p3norm = RealPolynomialNullaryFunction.express("int((P(3)^2)(x),x)",
                                                                  context);
    RealPolynomial A      = p3norm.evaluate();
    var            wtf    = A.eval(1.0) - A.eval(-1.0);
    assertEquals(0.09486607142857142,
                 wtf);
  }

  public void testIntegralOfAnElementOfAContextualSequenceSquared()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P",
                             P);
    var p3norm = RealNullaryFunction.express("int((P(3)^2)(x),x=-1..1)",
                                             context);
    assertEquals(0.09486607142857142,
                 p3norm.eval());
  }

  public void testIntegralProgrammerSyntax()
  {
    var z = RealFunction.express("int(x,x=2..4)");
    var x = z.evaluate(new Real("0",
                                128),
                       128);
    assertEquals("6",
                 x.toString());
  }
}
