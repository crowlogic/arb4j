package arb.expressions;

import java.util.List;

import arb.expressions.nodes.Node;
import arb.expressions.nodes.StaticNode;
import arb.expressions.nodes.VariableNode;
import arb.functions.integer.RealFunctionalSequence;
import junit.framework.TestCase;

/**
 * Second regression test for issue
 * <a href="https://github.com/crowlogic/arb4j/issues/955">#955</a> —
 * fixed-point static hoisting in nested generated functionals.
 *
 * <p>
 * This covers a distinct nested functional whose inner expression contains
 * three factors that depend only on the two upstream bound parameters
 * {@code i} and {@code j}:
 *
 * <pre>
 * i ➔ j ➔ x ➔ (i + j) · x · (i · j) · (i - j)
 * </pre>
 *
 * At the innermost (evaluation variable {@code x}) level, {@code (i+j)},
 * {@code (i·j)}, and {@code (i-j)} are each x-independent. After the
 * fixed-point hoisting pass all three must be collapsed into a <strong>single
 * composite</strong> {@link StaticNode} whose delegate depends only on
 * {@code i} and {@code j}. {@code x} must not appear inside any
 * {@link StaticNode}.
 *
 * <p>
 * Together with {@link BesselTargetHoistingTest} this covers both a
 * division-heavy target (Bessel) and a pure multiplication target with
 * multiple bound parameters.
 */
@SuppressWarnings(
{ "unchecked", "rawtypes" })
public class NestedFunctionalFixedPointTest extends
                                            TestCase
{

  private static Expression<?, ?, ?> innerExpression()
  {
    Expression<?, ?, RealFunctionalSequence> expr =
                                                  RealFunctionalSequence.parse("i➔j➔x➔(i+j)*x*(i*j)*(i-j)");
    expr.generate();
    Expression<?, ?, ?> mid = expr.functionalChild;
    assertNotNull("mid (j➔x➔…) expression must exist", mid);
    Expression<?, ?, ?> inner = mid.functionalChild;
    assertNotNull("inner (x➔…) expression must exist", inner);
    return inner;
  }

  /**
   * After hoisting, the inner expression contains exactly one
   * {@link StaticNode}, and that composite covers all three i,j-only
   * subexpressions {@code (i+j)}, {@code (i·j)}, and {@code (i-j)}.
   */
  public void testThreeIJFactorsCollapseIntoOneComposite()
  {
    Expression<?, ?, ?> inner = innerExpression();
    List<StaticNode> statics = inner.rootNode.nodeStream()
                                             .filter(n -> n instanceof StaticNode)
                                             .map(n -> (StaticNode) n)
                                             .toList();

    assertEquals("inner expression must have exactly one composite StaticNode, got: "
                 + statics.stream().map(s -> s.delegate.toString()).toList(),
                 1,
                 statics.size());

    StaticNode composite = statics.get(0);
    String     text      = composite.delegate.toString();
    assertTrue("composite must contain the (i+j) factor: " + text,
               text.contains("i+j") || text.contains("i + j"));
    assertTrue("composite must contain the (i-j) factor: " + text,
               text.contains("i-j") || text.contains("i - j"));
    assertTrue("composite must contain the (i*j) factor: " + text,
               text.contains("i*j") || text.contains("i * j"));
  }

  /**
   * The evaluation variable {@code x} must never appear inside any
   * {@link StaticNode}; the composite must depend solely on the upstream
   * parameters {@code i} and {@code j}.
   */
  public void testXNeverInsideStaticNode()
  {
    Expression<?, ?, ?> inner = innerExpression();
    inner.rootNode.nodeStream().filter(n -> n instanceof StaticNode).forEach(s ->
    {
      StaticNode<?, ?, ?> sn = (StaticNode<?, ?, ?>) s;
      sn.delegate.nodeStream().filter(n -> n instanceof VariableNode).forEach(n ->
      {
        VariableNode<?, ?, ?> v = (VariableNode<?, ?, ?>) n;
        assertFalse("hoisted subtree " + sn.delegate
                    + " must not reference evaluation variable x but found: "
                    + v.reference.name,
                    "x".equals(v.reference.name));
        assertTrue("variable " + v.reference.name + " inside hoisted subtree must be i or j",
                   "i".equals(v.reference.name) || "j".equals(v.reference.name));
      });
    });
  }

  /**
   * The hoisting pass must be idempotent: running it once reaches a genuine
   * fixed point. We exercise this indirectly by asserting that the post-fix
   * static count is deterministic across two independently-generated copies
   * of the same expression.
   */
  public void testFixedPointIsIdempotent()
  {
    long firstCount  = countStaticNodes();
    long secondCount = countStaticNodes();
    assertEquals("independently generated copies must reach the same static-node count "
                 + "(fixed point must be deterministic)",
                 firstCount,
                 secondCount);
    assertEquals("fixed-point must produce exactly one composite at inner level", 1L, firstCount);
  }

  private static long countStaticNodes()
  {
    Node<?, ?, ?> root = innerExpression().rootNode;
    return root.nodeStream().filter(n -> n instanceof StaticNode).count();
  }
}
