package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegralNodeTest extends
                              TestCase
{
  public void testIntegralProgrammerSyntax()
  {
    var z = RealFunction.express("int(x,x=2..4)");
    var x = z.evaluate(new Real("0",
                                128),
                       128);
    assertEquals("6", x.toString());
  }
}
