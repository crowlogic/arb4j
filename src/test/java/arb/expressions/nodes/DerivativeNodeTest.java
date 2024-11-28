package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNodeTest extends
                                TestCase
{
  public void testRealFunctionDerivative()
  {
    var context    = new Context(Real.named("a").set(2),
                                 Real.named("b").set(4),
                                 Real.named("c").set(6));
    var f          = RealFunction.parse("x->a*x+b*x²+c*x³", context);
    var derivative = f.rootNode.differentiate(f.independentVariable).simplify();
    f.rootNode   = derivative;
    f.expression = derivative.toString();
    var    func = f.instantiate();
    double val  = func.eval(2.3);
    assertEquals(115.61999999999998, val);
  }
}
