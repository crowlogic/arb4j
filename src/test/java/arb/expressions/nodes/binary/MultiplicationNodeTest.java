package arb.expressions.nodes.binary;

import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.ComplexNullaryFunction;
import junit.framework.TestCase;

public class MultiplicationNodeTest extends
                                    TestCase
{
  public void testSimplificationOfExponentialMultiplication()
  {
    var context = new Context();
    context.registerVariable(Real.named("t").set(2));
    context.registerVariable(Real.named("s").set(3));
    var expr = ComplexNullaryFunction.parse("exp(t)*exp(-s)", context);
    var inst = expr.instantiate();
    assertEquals("exp(t-s)", inst.toString());
  }
}
