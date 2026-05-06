package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Regression test for the {@link java.util.MissingFormatArgumentException}
 * thrown by the generated {@code toString()} method when an upstream-bound
 * input variable appears more than once in the body of the inner expression.
 * <p>
 * Before the fix, {@link arb.expressions.nodes.VariableNode#toString()} emitted
 * a bare {@code "%s"} for every occurrence of each bound variable while the
 * arguments array only held one entry per unique variable name. For an inner
 * body that mentioned {@code m} three times, {@link String#format} received
 * three {@code %s} placeholders but only one argument, so it threw
 * {@code MissingFormatArgumentException: Format specifier '%s'} from inside
 * the generated class's {@code toString()}. The fix switched to indexed
 * specifiers {@code "%1$s"}, {@code "%2$s"}, … so repeated occurrences of the
 * same variable share a single positional argument.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unchecked")
public class RepeatedBoundVariableToStringTest extends
                                               TestCase
{
  /**
   * Reproduces the original crash with a minimal expression: the inner body
   * references the upstream input {@code m} three times and the local
   * argument {@code t} twice. After fix, {@code toString()} must succeed and
   * must contain the substituted value of {@code m}.
   */
  public void testRepeatedUpstreamVariableToStringDoesNotThrow()
  {
    Expression<Integer, RealFunction, Sequence<RealFunction>> expr =
                 new Expression<>("RepeatedBoundSequence",
                                  Integer.class,
                                  RealFunction.class,
                                  Sequence.class,
                                  "n➔t➔n*t+n*t+n",
                                  null,
                                  "rep",
                                  null);

    Sequence<RealFunction>                                    seq  = expr.instantiate();

    try ( Integer n = new Integer())
    {
      n.set(5);
      RealFunction f   = seq.evaluate(n, 0, 128, null);
      // The call that used to throw MissingFormatArgumentException:
      String       str = f.toString();
      assertNotNull(str);
      // The bound value of n must appear in the rendered form.
      assertTrue("expected bound value of n in toString, got: " + str,
                 str.contains("5"));
    }
  }
}
