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

  public void testCosecantDerivative()
  {
    var f  = RealFunction.parse("∂csc(x)/∂x");
    var df = RealFunction.parse("-csc(x)*cot(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }
  
  public void testSecantDerivative()
  {
    var f  = RealFunction.parse("∂sec(x)/∂x");
    var df = RealFunction.parse("sec(x)*tan(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testTanhDerivative()
  {
    var f  = RealFunction.parse("∂tanh(x)/∂x");
    var df = RealFunction.parse("1-tanh(x)²");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testArcSinDerivative()
  {
    var f  = RealFunction.parse("∂arcsin(x)/∂x");
    var df = RealFunction.parse("1/√(1-x^2)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

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
