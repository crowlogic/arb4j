package arb.expressions;

import java.util.List;

import arb.Integer;
import arb.Real;
import arb.expressions.nodes.StaticNode;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Regression test for issue
 * <a href="https://github.com/crowlogic/arb4j/issues/957">#957</a> —
 * flat parameter-only hoisting at the top level of a non-nested expression.
 *
 * <p>
 * The expression
 *
 * <pre>
 * ½ · J(k,x) · π^½ · (8j+2)^½ · (-1)^j ·
 *   Γ(½k+j+½) / Γ(½k+½-j) / Γ(j+1-½k) / Γ(½k+j+1)
 * </pre>
 *
 * is bound as a single-argument {@link RealFunction} {@code x➔…} with
 * {@code j} and {@code k} declared on the {@link Context} as
 * {@link Integer}-typed context variables (rather than as upstream-input
 * parameters of enclosing generated functionals as in
 * {@link BesselTargetHoistingTest}).
 *
 * <p>
 * After static hoisting, the entire {@code x}-independent prefactor — every
 * factor other than {@code ½·J(k,x)} — must collapse into a
 * <strong>single</strong> composite {@link StaticNode}. Every
 * {@link VariableNode} inside that composite must be a context variable and
 * therefore be marked {@code fixedInstanceData}.
 */
@SuppressWarnings(
{ "unchecked", "rawtypes" })
public class BesselTargetFlatHoistingTest extends
                                          TestCase
{

  static final String EXPR =
                           "½*J(k,x)*π^½*(8*j+2)^½*(-1)^j*Γ(½*k+j+½)/Γ(½*k+½-j)/Γ(j+1-½*k)/Γ(½*k+j+1)";

  private static Expression<Real, Real, RealFunction> flatExpression()
  {
    Context                              ctx  = new Context(Integer.named("k"), Integer.named("j"));
    Expression<Real, Real, RealFunction> expr = RealFunction.parse(EXPR, ctx);
    expr.generate();
    return expr;
  }

  /**
   * No {@link StaticNode} may reference the evaluation variable {@code x}, and
   * {@code J(k,x)} must not live under any {@link StaticNode}.
   */
  public void testJOfKXIsNotHoisted()
  {
    Expression<?, ?, ?> expr    = flatExpression();
    List<StaticNode>    statics = expr.rootNode.nodeStream()
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
   * Exactly one composite {@link StaticNode} at the top level, and it contains
   * all four {@code Γ(...)} {@link FunctionNode}s plus references to {@code π}
   * and {@code j}.
   */
  public void testExactlyOneCompositeStaticNode()
  {
    Expression<?, ?, ?> expr    = flatExpression();
    List<StaticNode>    statics = expr.rootNode.nodeStream()
                                               .filter(n -> n instanceof StaticNode)
                                               .map(n -> (StaticNode) n)
                                               .toList();

    assertEquals("flat expression must have exactly one composite StaticNode, got: "
                 + statics.stream().map(s -> s.delegate.toString()).toList(),
                 1,
                 statics.size());

    StaticNode composite  = statics.get(0);
    long       gammaCount = composite.delegate.nodeStream()
                                              .filter(n -> n instanceof FunctionNode
                                                           && "Γ".equals(((FunctionNode) n).functionName))
                                              .count();
    assertEquals("composite StaticNode must contain all four Γ(...) subtrees", 4L, gammaCount);

    String compositeText = composite.delegate.toString();
    assertTrue("composite StaticNode must contain π somewhere: " + compositeText,
               compositeText.contains("π"));
    assertTrue("composite StaticNode must contain j somewhere: " + compositeText,
               compositeText.contains("j"));
  }

  /**
   * The single composite {@link StaticNode} must depend solely on context
   * variables {@code j} and {@code k}; every {@link VariableNode} inside it
   * must be marked {@code fixedInstanceData} and be a context variable.
   */
  public void testCompositeDependsOnlyOnContextVariables()
  {
    Expression<?, ?, ?> expr    = flatExpression();
    List<StaticNode>    statics = expr.rootNode.nodeStream()
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
      assertTrue("variable " + name + " inside composite must be a context variable",
                 v.isContextVariable());
      assertTrue("variable " + name + " inside composite must be marked fixedInstanceData",
                 v.isFixedInstanceData());
    });
  }

  /**
   * Running {@link Expression#replaceConstantNodes()} a second time must be a
   * no-op — the hoisting pipeline reached a fixed point during
   * {@link Expression#optimize()}.
   */
  public void testHoistingIsAtFixedPoint()
  {
    Expression<?, ?, ?> expr   = flatExpression();
    String              before = expr.rootNode.toString();
    expr.replaceConstantNodes();
    String              after  = expr.rootNode.toString();
    assertEquals("replaceConstantNodes must be a no-op after optimize() completes", before, after);
  }
}
