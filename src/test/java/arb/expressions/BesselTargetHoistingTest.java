package arb.expressions;

import java.util.List;

import arb.expressions.nodes.Node;
import arb.expressions.nodes.StaticNode;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.integer.RealFunctionalSequence;
import junit.framework.TestCase;

/**
 * Regression test for the missed-hoisting bug on the target Bessel-ratio
 * expression
 *
 * <pre>
 * ½ · J(k,x) · π^½ · (8j+2)^½ · (-1)^j ·
 *   Γ(½k+j+½) / Γ(½k+½-j) / Γ(j+1-½k) / Γ(½k+j+1)
 * </pre>
 *
 * bound as {@code j➔k➔x➔…} using {@link RealFunctionalSequence}. The only
 * x-dependent factor is {@code J(k,x)}; every other factor depends solely on
 * the bound parameters {@code j} and {@code k} (or is a literal constant).
 *
 * Prior to the fix, only {@code π^½} and {@code (8j+2)^½} were hoisted into
 * {@link StaticNode} wrappers at the innermost expression. After the fix, every
 * x-independent subtree (including the four Γ(...) FunctionNodes and
 * {@code (-1)^j}) must be hoisted.
 */
@SuppressWarnings(
{ "unchecked", "rawtypes" })
public class BesselTargetHoistingTest extends
                                      TestCase
{

  static final String EXPR =
                           "½*J(k,x)*π^½*(8*j+2)^½*(-1)^j*Γ(½*k+j+½)/Γ(½*k+½-j)/Γ(j+1-½*k)/Γ(½*k+j+1)";

  /**
   * Innermost expression (the one with evaluation variable {@code x}) must
   * hoist every x-independent factor. We assert, specifically:
   * <ul>
   * <li>J(k,x) is NOT inside a StaticNode (depends on x);</li>
   * <li>each of the four Γ(...) calls IS inside a StaticNode;</li>
   * <li>(-1)^j IS inside a StaticNode;</li>
   * <li>π^½ IS inside a StaticNode;</li>
   * <li>(8j+2)^½ IS inside a StaticNode;</li>
   * <li>all variable references inside any StaticNode are bound parameters
   * (upstreamInput=true and fixedInstanceData=true), never the evaluation
   * variable x.</li>
   * </ul>
   */
  public void testInnerPrefactorIsFullyHoisted()
  {
    Expression<?, ?, RealFunctionalSequence> expr = RealFunctionalSequence.parse("j➔k➔x➔" + EXPR);
    expr.generate();
    Expression<?, ?, ?> mid = expr.functionalChild;
    assertNotNull("mid expression (k➔x➔…) must exist", mid);
    Expression<?, ?, ?> inner = mid.functionalChild;
    assertNotNull("inner expression (x➔…) must exist", inner);

    Node<?, ?, ?> root = inner.rootNode;
    assertNotNull("inner rootNode", root);

    List<StaticNode> statics = root.nodeStream()
                                   .filter(n -> n instanceof StaticNode)
                                   .map(n -> (StaticNode) n)
                                   .toList();

    // --- J(k,x) must NOT be inside any StaticNode (it depends on x) ---
    boolean jOfKXHoisted = statics.stream()
                                  .flatMap(s -> s.delegate.nodeStream())
                                  .anyMatch(n -> n instanceof FunctionNode && "J".equals(((FunctionNode) n).functionName));
    assertFalse("J(k,x) must not be hoisted — it depends on x", jOfKXHoisted);

    // --- No StaticNode's subtree may reference the evaluation variable x ---
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
    }

    // --- All four Γ(...) must each be inside a StaticNode ---
    long gammaStaticCount = statics.stream()
                                   .filter(s -> s.delegate instanceof FunctionNode
                                                && "Γ".equals(((FunctionNode) s.delegate).functionName))
                                   .count();
    assertEquals("all four Γ(...) subtrees must be hoisted into StaticNodes", 4L, gammaStaticCount);

    // --- (-1)^j must be inside a StaticNode ---
    boolean negOnePowJHoisted = statics.stream().anyMatch(s ->
    {
      if (!(s.delegate instanceof ExponentiationNode))
      {
        return false;
      }
      String txt = s.delegate.toString();
      return txt.contains("-1") && txt.contains("^j");
    });
    assertTrue("(-1)^j must be hoisted into a StaticNode", negOnePowJHoisted);

    // --- π^½ must be inside a StaticNode ---
    boolean piHalfHoisted = statics.stream()
                                   .anyMatch(s -> s.delegate instanceof ExponentiationNode
                                                  && s.delegate.toString().startsWith("π^"));
    assertTrue("π^½ must be hoisted into a StaticNode", piHalfHoisted);

    // --- (8j+2)^½ must be inside a StaticNode ---
    boolean eightJPlusTwoHoisted = statics.stream()
                                          .anyMatch(s -> s.delegate instanceof ExponentiationNode
                                                         && s.delegate.toString().contains("8*j")
                                                         && s.delegate.toString().contains("+2"));
    assertTrue("(8j+2)^½ must be hoisted into a StaticNode", eightJPlusTwoHoisted);

    // --- Every variable reference inside any StaticNode must be a bound
    //     upstream parameter (j or k), with fixedInstanceData=true. ---
    for (StaticNode s : statics)
    {
      s.delegate.nodeStream().filter(n -> n instanceof VariableNode).forEach(n ->
      {
        VariableNode<?, ?, ?> v = (VariableNode<?, ?, ?>) n;
        String name = v.reference.name;
        if ("j".equals(name) || "k".equals(name))
        {
          assertTrue("variable " + name + " inside hoisted subtree " + s.delegate
                     + " must be marked upstreamInput",
                     v.upstreamInput);
          assertTrue("variable " + name + " inside hoisted subtree " + s.delegate
                     + " must be fixedInstanceData",
                     v.isFixedInstanceData());
        }
      });
    }
  }

  /**
   * Count sanity check — after the fix the inner expression has exactly seven
   * hoisted subtrees:
   *
   * <pre>
   * π^½, (8j+2)^½, (-1)^j, Γ(½k+j+½), Γ(½k+½-j), Γ(j+1-½k), Γ(½k+j+1)
   * </pre>
   *
   * If a future refactor merges factors into a single cached prefactor this
   * number will drop; that is a stronger form of the same guarantee, so this
   * test asserts the lower bound instead of strict equality.
   */
  public void testInnerHasAtLeastSevenStaticNodes()
  {
    Expression<?, ?, RealFunctionalSequence> expr = RealFunctionalSequence.parse("j➔k➔x➔" + EXPR);
    expr.generate();
    Expression<?, ?, ?> inner = expr.functionalChild.functionalChild;
    long staticCount = inner.rootNode.nodeStream().filter(n -> n instanceof StaticNode).count();
    assertTrue("inner expression must hoist at least 7 x-independent subtrees, got " + staticCount,
               staticCount >= 7);
  }
}
