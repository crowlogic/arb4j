package arb.expressions.nodes;

import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Expression;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;
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
    RealPolynomialNullaryFunction f = expression.instantiate();
    RealPolynomial poly = f.evaluate();
    System.out.println( expression.inspect(f));
    assertEquals( "x² + 3*x",poly.toString() );
  }
}
