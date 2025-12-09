package arb.expressions.nodes.unary;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WhenTest extends
                      TestCase
{
  public static void testWhen()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n=0,5,n=1,7,else,10)");
    assertEquals(5.0, seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(7.0, seq.evaluate(new Integer(1), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(2), 128, new Real()).doubleValue());

  }

}
