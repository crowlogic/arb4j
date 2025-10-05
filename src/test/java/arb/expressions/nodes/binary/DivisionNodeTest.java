package arb.expressions.nodes.binary;

import arb.Real;
import arb.RealDataSet;
import arb.expressions.Context;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class DivisionNodeTest extends
                              TestCase
{
  public void testSineIntegral()
  {
    var fe = RealFunction.parse("int(sin(t)/t,t)");
    var f  = fe.instantiate();
    assertEquals("t➔si(t)", f.toString());
    RealDataSet q = f.quantize(0, 10, 1000);
    assertFalse(q.get(1, 100) == 0.0);
    assertEquals(1.7222074818055033, f.eval(2.3));
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
