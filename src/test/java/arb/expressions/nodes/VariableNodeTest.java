package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Expression;
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
}
