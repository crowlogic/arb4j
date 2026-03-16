package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that when a functional expression is evaluated with a bound upstream
 * independent variable, the resulting functional instance's {@link Object#toString()}
 * renders the bound variable as {@code "name=value"} rather than just {@code "name"}.
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class BoundVariableToStringTest extends
                                       TestCase
{
  public void testBoundUpstreamVariableAppearsInFunctionalToString()
  {
    Context      context    = new Context(Integer.named("n").set(3));
    RealFunction functional = RealFunction.express("t->J(n,t)", context);
    String       str        = functional.toString();
    assertTrue("Expected functional toString to contain 'n=3' but got: " + str,
               str.contains("n=3"));
  }
}
