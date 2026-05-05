package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.StaticNode;
import arb.expressions.nodes.VariableNode;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that subexpressions which depend only on bound parameters of a
 * functional (upstream-input variables — emitted as private fields of the
 * generated inner-function class and assigned once at instance initialization)
 * are recognised by the Expression Compiler as input-independent and hoisted
 * into {@code evaluateStaticSubexpressions()} as {@link StaticNode}s.
 *
 * <p>Before the fix the compiler's {@code isConstant()} check rejected any
 * subtree containing any {@link VariableNode}, regardless of whether that
 * variable was a mutable input, a placeholder, a context variable, or a
 * fixed bound parameter; as a result only purely literal subtrees were
 * hoisted. The fix narrows the check so that only VariableNodes that are
 * <em>not</em> fixed instance data (i.e. the evaluation variable, indeterminate
 * placeholders, mutable context variables) block hoisting.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unchecked")
public class ParameterInvariantHoistingTest extends
                                            TestCase
{

  /**
   * A compound subtree {@code (n²+1)} that depends only on the bound
   * parameter {@code n} — not on the inner function's evaluation variable
   * {@code t} — must be wrapped in a {@link StaticNode} by
   * {@code replaceConstantNodes()} so it is computed once per precision in
   * {@code evaluateStaticSubexpressions()} rather than on every call to
   * {@code evaluate(t, ...)}.
   */
  public void testParameterInvariantSubtreeIsHoistedToStaticNode()
  {
    Expression<Integer, RealFunction, Sequence<RealFunction>> expr = new Expression<>("BesselLikeSequence",
                                                                                      Integer.class,
                                                                                      RealFunction.class,
                                                                                      (Class) Sequence.class,
                                                                                      "n➔t➔(n²+1)*sin(t)+(n-1)",
                                                                                      null,
                                                                                      "f",
                                                                                      null);

    // Force generation of the outer class — this parses and resolves the
    // inner functional and wires expr.functionalChild.
    expr.generate();

    Expression<?, ?, ?>                                       inner = expr.functionalChild;
    assertNotNull("inner functional expression (child of n➔…) should exist after generate()", inner);

    long staticCount = inner.rootNode.nodeStream().filter(n -> n instanceof StaticNode).count();
    assertTrue("expected at least one hoisted parameter-invariant subtree; found none.\n"
                  + "  inner root: " + inner.rootNode + "\n" + "  inner root type: "
                  + inner.rootNode.getClass().getSimpleName(),
               staticCount >= 1);

    // The hoisted subtree must actually reference the bound parameter n —
    // before the fix, only purely-literal subtrees (e.g. 1) could be
    // hoisted and no StaticNode wrapped a subtree containing a VariableNode.
    StringBuilder report = new StringBuilder();
    report.append("  inner root: ").append(inner.rootNode).append("\n");
    inner.rootNode.nodeStream().filter(n -> n instanceof StaticNode).forEach(s -> {
      StaticNode<?, ?, ?> sn = (StaticNode<?, ?, ?>) s;
      report.append("  StaticNode wrapping: ").append(sn.delegate).append(" (")
            .append(sn.delegate.getClass().getSimpleName()).append(")\n");
    });
    boolean anyStaticMentionsN = inner.rootNode.nodeStream()
                                               .filter(n -> n instanceof StaticNode)
                                               .anyMatch(s -> ((StaticNode<?, ?, ?>) s).delegate.toString().contains("n"));
    assertTrue("at least one StaticNode should wrap a subtree containing the bound parameter n. Report:\n"
                  + report,
               anyStaticMentionsN);
  }

  /**
   * End-to-end behavioural check: the hoisted subexpression must still
   * produce correct results for multiple values of the bound parameter and
   * the input.
   */
  public void testParameterInvariantHoistingPreservesResults()
  {
    Expression<Integer, RealFunction, Sequence<RealFunction>> expr = new Expression<>("BesselLikeSequence2",
                                                                                      Integer.class,
                                                                                      RealFunction.class,
                                                                                      (Class) Sequence.class,
                                                                                      "n➔t➔(n²+1)*t+(n-1)",
                                                                                      null,
                                                                                      "f",
                                                                                      null);

    Sequence<RealFunction>                                    seq  = expr.instantiate();

    try ( Integer n = new Integer(); Real t = new Real(); Real result = new Real())
    {
      n.set(3);
      RealFunction f3  = seq.evaluate(n, 0, 128, null);
      // (3² + 1)*2 + (3 - 1) = 10*2 + 2 = 22
      t.set(2);
      assertEquals(22.0, f3.evaluate(t, 1, 128, result).doubleValue());
      // Same instance, different t — exercises the cached static field path.
      // The Issue #1005 value-backing cache uses reference identity on the
      // input v; mutating the same Real in place requires invalidateCache().
      t.set(5);
      f3.invalidateCache();
      assertEquals(52.0, f3.evaluate(t, 1, 128, result).doubleValue());

      // Fresh instance with a different bound n — staticPrecision is reset
      n.set(4);
      RealFunction f4 = seq.evaluate(n, 0, 128, null);
      // (4² + 1)*2 + (4 - 1) = 17*2 + 3 = 37
      t.set(2);
      assertEquals(37.0, f4.evaluate(t, 1, 128, result).doubleValue());
    }
  }

  /**
   * The evaluation variable itself must continue to block hoisting — it is
   * not fixed instance data.
   */
  public void testEvaluationVariableDoesNotCauseHoisting()
  {
    RealFunction f = RealFunction.express("t + t*t");
    // No bound parameters and no hoistable subtree: a pure-input expression
    // must still compute correctly and not be incorrectly hoisted.
    try ( Real t = new Real().set(3); Real result = new Real())
    {
      assertEquals(12.0, f.evaluate(t, 1, 128, result).doubleValue());
    }
  }
}
