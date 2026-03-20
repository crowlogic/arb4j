package arb.expressions.nodes;

import arb.*;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class VariableNodeTest extends
                              TestCase
{
  public void testSubstitution()
  {
    Expression<Real, Real, RealFunction>   realExpr = RealFunction.parse("x^2");
    VariableNode<Real, Real, RealFunction> x        = realExpr.getIndependentVariable();
    realExpr.substitute("x", x.sin());
    realExpr.substitute("x", x.div(2));
    assertEquals("x➔sin(x/2)^2", realExpr.toString());
  }

  public void testResolutionOfNullaryPolynomialFunction()
  {
    Expression<Object, RealPolynomial, RealPolynomialNullaryFunction> expression = RealPolynomialNullaryFunction.parse("3*x+x^2");
    RealPolynomialNullaryFunction                                     f          = expression.instantiate();
    RealPolynomial                                                    poly       = f.evaluate();
    assertEquals("x² + 3*x", poly.toString());
  }

  public void testResolutionOfRealToRealPolynomialFunctionWithDifferentIndependentAndPlaceholderVariables()
  {
    Expression<Real, RealPolynomial, Function<Real, RealPolynomial>> expression = Function.parse(Real.class,
                                                                                                 RealPolynomial.class,
                                                                                                 Function.class,
                                                                                                 "t->t+3*x+x^2");
    Function<Real, RealPolynomial>                                   f          = expression.instantiate();
    RealPolynomial                                                   poly       = f.evaluate(RealConstants.two, 0, 128, new RealPolynomial());
    assertEquals("x² + 3*x", poly.toString());
  }

  public void testResolutionOfRealToRealPolynomialFunctionWithSameIndependentAndPlaceholderVariables()
  {
    Expression<Real, RealPolynomial, Function<Real, RealPolynomial>> expression = Function.parse(Real.class,
                                                                                                 RealPolynomial.class,
                                                                                                 Function.class,
                                                                                                 "x->x+3*x+x^2");
    Function<Real, RealPolynomial>                                   f          = expression.instantiate();
    RealPolynomial                                                   poly       = f.evaluate(RealConstants.two, 0, 128, new RealPolynomial());
    assertEquals("12", poly.toString());
  }

  public void testResolutionOfRealToRealFunctionWithDifferentIndependentAndPlaceholderVariables()
  {
    Expression<Real, Real, RealFunction> expression = Function.parse(Real.class, Real.class, RealFunction.class, "t->t+3*x+x^2");
    Function<Real, Real>                 f          = expression.instantiate();
    Real                                 poly       = f.evaluate(RealConstants.two, 0, 128);
    assertEquals("x² + 3*x + 2", poly.toString());
  }

}
