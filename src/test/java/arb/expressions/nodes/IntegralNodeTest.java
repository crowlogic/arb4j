package arb.expressions.nodes;

import arb.functions.real.RealNullaryFunction;
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
    var x = RealNullaryFunction.express("int(x,x=2..4)").evaluate();
    assertEquals( "6", x.toString() );
  }
}
