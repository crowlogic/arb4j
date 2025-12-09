package arb.expressions.nodes.nary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class SumNodeTest
                         extends
                         TestCase
{
  public static void testFunctionFormOfSum()
  {
    var f = RealFunction.express("x->sin(sum(x^k{k=0..4}))");
    assertNotNull(f);
  }
}
