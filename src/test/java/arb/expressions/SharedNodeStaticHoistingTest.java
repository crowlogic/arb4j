package arb.expressions;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Regression test for the case where a {@link arb.expressions.nodes.StaticNode}
 * is buried inside a {@link arb.expressions.nodes.SharedNode}'s delegate.
 *
 * <p>
 * Common-subexpression elimination wraps the duplicated subtree
 * {@code √(t/(2·π))} in a SharedNode pair before constant hoisting wraps
 * {@code 2·π} in a StaticNode. The static field that holds {@code 2·π} is
 * populated only by {@code evaluateStaticSubexpressions}, whose body is
 * emitted by enumerating every StaticNode reachable from the root via
 * {@code nodeStream()}. That enumeration goes through
 * {@code Node.accept(Consumer)}; if {@code CachedNode.accept} fails to
 * descend into its delegate, the buried StaticNode is invisible, no
 * canonical store is emitted for it, the field is left at its default
 * {@code Real} (numerically zero), and {@code t/(2·π)} becomes
 * {@code t/0 = NaN}. Each operand evaluated in isolation is correct because
 * isolation removes the SharedNode wrapper and exposes the StaticNode
 * directly to the traversal.
 *
 * <p>
 * The test pins the published behaviour:
 * <ul>
 * <li>{@code ceil(√(t/(2·π)))} alone evaluates to a finite integer at
 *     {@code t = 55.3};</li>
 * <li>{@code floor(√(t/(2·π)))} alone evaluates to a finite integer at
 *     {@code t = 55.3};</li>
 * <li>their difference, which forces CSE on {@code √(t/(2·π))}, evaluates to
 *     {@code 1} (not {@code NaN}).</li>
 * </ul>
 *
 * @author Stephen Crowley ©2026
 */
public class SharedNodeStaticHoistingTest extends
                                          TestCase
{

  public void testSharedSubtreeWithBuriedStaticNodeEvaluatesWithoutNaN()
  {
    var ceiling     = RealFunction.express("ceil(√(t/(2*π)))");
    var floorOf     = RealFunction.express("floor(√(t/(2*π)))");
    var difference  = RealFunction.express("ceil(√(t/(2*π)))-floor(√(t/(2*π)))");

    double t        = 55.3;
    double cValue   = ceiling.eval(t);
    double fValue   = floorOf.eval(t);
    double dValue   = difference.eval(t);

    assertEquals("ceil(√(t/(2π))) at t=55.3 must be finite", 3.0, cValue, 0.0);
    assertEquals("floor(√(t/(2π))) at t=55.3 must be finite", 2.0, fValue, 0.0);
    assertFalse("ceil-floor must not be NaN when CSE buries the (2*π) StaticNode under a SharedNode",
                Double.isNaN(dValue));
    assertEquals("ceil(x)-floor(x) at non-integer x must be 1", 1.0, dValue, 0.0);
  }

  public void testSharedSubtreeWithBuriedStaticNodeWithoutSquareRoot()
  {
    var difference = RealFunction.express("ceil(t/(2*π))-floor(t/(2*π))");
    double dValue  = difference.eval(55.3);

    assertFalse("ceil(t/(2π))-floor(t/(2π)) must not be NaN", Double.isNaN(dValue));
    assertEquals(1.0, dValue, 0.0);
  }
}
