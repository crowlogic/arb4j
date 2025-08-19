package arb.expressions.nodes.binary;

import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class DivisionNodeTest extends
                              TestCase
{
  public void testSineIntegral()
  {
    var f = RealFunction.express("int(sin(t)/t,t)");

  }

  public void testSimplificationOfExponentialDivision()
  {
    var context = new Context(Real.named("t").set(2),
                              Real.named("s").set(3));
    var expr    = ComplexNullaryFunction.parse("exp(t)/exp(s)", context);
    var inst    = expr.instantiate();
    assertEquals("exp(t-s)", inst.toString());
  }
}
