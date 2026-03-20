package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that when a functional expression is evaluated with a bound upstream
 * independent variable, the resulting functional instance's
 * {@link Object#toString()} renders the bound variable as {@code "name=value"}
 * rather than just {@code "name"}.
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unchecked")
public class BoundVariableToStringTest extends
                                       TestCase
{
  public void testBoundUpstreamVariableAppearsInFunctionalToString()
  {
    Expression<Integer, RealFunction, Sequence<RealFunction>> expr = new Expression<>("BesselSequence",
                                                                                      Integer.class,
                                                                                      RealFunction.class,
                                                                                      (Class) Sequence.class,
                                                                                      "n➔t➔J(n,t)",
                                                                                      null,
                                                                                      "jBessel",
                                                                                      null);

    Sequence<RealFunction>                                    seq  = expr.instantiate();

    try ( Integer n = new Integer(); Real t = new Real(); Real result = new Real())
    {
      n.set(3);
      RealFunction f   = seq.evaluate(n, 0, 128, null);
      String       str = f.toString();
      assertEquals("jBesselfunc:t➔J(3,t)", str);
    }
  }
}
