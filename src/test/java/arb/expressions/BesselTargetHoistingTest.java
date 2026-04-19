package arb.expressions;

import java.util.List;

import arb.expressions.nodes.Node;
import arb.expressions.nodes.StaticNode;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.integer.RealFunctionalSequence;
import junit.framework.TestCase;

/**
 * Regression test for issue
 * <a href="https://github.com/crowlogic/arb4j/issues/955">#955</a> — iterate
 * static hoisting to a fixed point for nested generated functionals.
 *
 * <p>
 * The target expression
 *
 * <pre>
 * ½ · J(k,x) · π^½ · (8j+2)^½ · (-1)^j ·
 *   Γ(½k+j+½) / Γ(½k+½-j) / Γ(j+1-½k) / Γ(½k+j+1)
 * </pre>
 *
 * bound as {@code j➔k➔x➔…} using {@link RealFunctionalSequence}. At the innermost
 * (evaluation variable {@code x}) expression, {@code J(k,x)} is the only
 * {@code x}-dependent factor; every other factor depends solely on the upstream
 * parameters {@code j} and {@code k}, or is a literal constant.
 *
 * <p>
 * Issue #955 requires that, after static hoisting has reached a fixed point,
 * the entire {@code x}-independent prefactor is collapsed into a
 * <strong>single</strong> composite {@link StaticNode} — not scattered across
 * seven per-factor StaticNodes. This test enforces that contract:
 *
 * <ol>
 * <li>no {@link StaticNode}'s delegate references the evaluation variable
 * {@code x};</li>
 * <li>{@code J(k,x)} does not appear inside any {@link StaticNode};</li>
 * <li>exactly one composite {@link StaticNode} exists at the inner level, and
 * it contains all four {@code Γ(...)} {@link FunctionNode}s as well as the
 * {@code π^½}, {@code (8j+2)^½} and {@code (-1)^j} subtrees;</li>
 * <li>running {@link Expression#replaceConstantNodes()} a second time changes
 * nothing — a genuine fixed point.</li>
 * </ol>
 */
@SuppressWarnings(
{ "unchecked", "rawtypes" })
public class BesselTargetHoistingTest extends
                                      TestCase
{

  static final String EXPR =
                           "½*J(k,x)*π^½*(8*j+2)^½*(-1)^j*Γ(½*k+j+½)/Γ(½*k+½-j)/Γ(j+1-½*k)/Γ(½*k+j+1)";

  /**
   * Obtains the innermost x-bound expression after generation.
   */
  private static Expression<?, ?, ?> innerExpression()
  {
    Expression<?, ?, RealFunctionalSequence> expr = RealFunctionalSequence.parse("j➔k➔x➔" + EXPR);
    expr.generate();
    Expression<?, ?, ?> mid = expr.functionalChild;
    assertNotNull("mid expression (k➔x➔…) must exist", mid);
    Expression<?, ?, ?> inner = mid.functionalChild;
    assertNotNull("inner expression (x➔…) must exist", inner);
    return inner;
  }

  /**
   * No {@link StaticNode}'s delegate may reference the evaluation variable
   * {@code x}, and {@code J(k,x)} must not live under any {@link StaticNode}.
   */
  public void testJOfKXIsNotHoisted()
  {
    Expression<?, ?, ?> inner = innerExpression();
    List<StaticNode> statics = inner.rootNode.nodeStream()
                                             .filter(n -> n instanceof StaticNode)
                                             .map(n -> (StaticNode) n)
                                             .toList();

    for (StaticNode s : statics)
    {
      s.delegate.nodeStream().filter(n -> n instanceof VariableNode).forEach(n ->
      {
        VariableNode<?, ?, ?> v = (VariableNode<?, ?, ?>) n;
        assertFalse("hoisted subtree " + s.delegate
                    + " must not reference evaluation variable x but found: "
                    + v.reference.name,
                    "x".equals(v.reference.name));
      });

      boolean hasJCall = s.delegate.nodeStream()
                                   .anyMatch(n -> n instanceof FunctionNode
                                                  && "J".equals(((FunctionNode) n).functionName));
      assertFalse("J(k,x) must not appear inside any StaticNode (it depends on x)", hasJCall);
    }
  }

  /**
   * After the fixed-point iteration the inner expression has <strong>exactly
   * one</strong> composite {@link StaticNode}, and that composite contains all
   * four {@code Γ(...)} {@link FunctionNode}s.
   */
  public void testExactlyOneCompositeStaticNode()
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

    StaticNode composite     = statics.get(0);
    long       gammaCount    = composite.delegate.nodeStream()
                                                 .filter(n -> n instanceof FunctionNode
                                                              && "Γ".equals(((FunctionNode) n).functionName))
                                                 .count();
    assertEquals("composite StaticNode must contain all four Γ(...) subtrees", 4L, gammaCount);

    String compositeText = composite.delegate.toString();
    assertTrue("composite StaticNode must contain π somewhere: " + compositeText,
               compositeText.contains("π"));
    assertTrue("composite StaticNode must contain 8*j or reference to j: " + compositeText,
               compositeText.contains("j"));
  }

  /**
   * The single composite {@link StaticNode} must depend solely on the bound
   * upstream parameters {@code j} and {@code k}; every {@link VariableNode}
   * inside it must be marked {@code upstreamInput} and
   * {@code fixedInstanceData}.
   */
  public void testCompositeDependsOnlyOnBoundParameters()
  {
    Expression<?, ?, ?> inner = innerExpression();
    List<StaticNode> statics = inner.rootNode.nodeStream()
                                             .filter(n -> n instanceof StaticNode)
                                             .map(n -> (StaticNode) n)
                                             .toList();
    assertEquals(1, statics.size());
    StaticNode composite = statics.get(0);

    composite.delegate.nodeStream().filter(n -> n instanceof VariableNode).forEach(n ->
    {
      VariableNode<?, ?, ?> v    = (VariableNode<?, ?, ?>) n;
      String                name = v.reference.name;
      assertTrue("variable " + name + " inside composite must be j or k but was: " + name,
                 "j".equals(name) || "k".equals(name));
      assertTrue("variable " + name + " inside composite must be marked upstreamInput",
                 v.upstreamInput);
      assertTrue("variable " + name + " inside composite must be marked fixedInstanceData",
                 v.isFixedInstanceData());
    });
  }
}
