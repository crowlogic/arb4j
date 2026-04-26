package arb.expressions.nodes.binary;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.binary.ComparisonNode.Operator;
import arb.functions.Function;
import arb.functions.integer.IntegerSequence;
import junit.framework.TestCase;

/**
 * Unit tests for {@link ComparisonNode}.
 *
 * <p>
 * The parser does not yet emit {@link ComparisonNode}s, so end-to-end
 * {@code Function.express("when(k<3,…,else,…)")} tests cannot run yet — those
 * arrive in the follow-up that adds the comparison and boolean tokens to
 * {@link Expression#resolve}. What this test exercises today:
 *
 * <ul>
 * <li>The constructor's type-validation: an Integer×Integer node constructs
 * cleanly; mixing in a Real operand throws {@link CompilerException} at
 * construction time, which is the user-mandated point for the check.</li>
 * <li>The interpretive {@link ComparisonNode#evaluate} path covering all six
 * operators against constant-literal operands, returning an {@link arb.Integer}
 * holding 0 or 1.</li>
 * <li>The reported {@link ComparisonNode#type()} is {@code int.class}, which
 * is what the upcoming {@code WhenNode} general-path generator will rely on to
 * recognize predicate sub-trees.</li>
 * </ul>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComparisonNodeTest extends
                                TestCase
{
  /**
   * Build a throwaway {@link Expression} of {@code Integer → Integer} type
   * just to host literal-constant operands. The expression body is irrelevant;
   * it only serves as the {@code expression} parameter for child nodes.
   */
  private static Expression<Integer, Integer, IntegerSequence> hostExpression()
  {
    return new Expression<>("ComparisonHost",
                            Integer.class,
                            Integer.class,
                            IntegerSequence.class,
                            "0",
                            null);
  }

  /**
   * Construct a literal-constant node carrying the integer {@code v}, parented
   * to the supplied host expression.
   */
  private static <D, R, F extends Function<? extends D, ? extends R>> LiteralConstantNode<D, R, F> lit(Expression<D, R, F> host,
                                                                                                       int v)
  {
    return host.newLiteralConstant(java.lang.Integer.toString(v));
  }

  /**
   * Evaluate {@code left op right} through {@link ComparisonNode#evaluate}
   * returning the JVM int 0 or 1 stored in the resulting {@link Integer}.
   */
  private static int eval(int left, Operator op, int right)
  {
    var host = hostExpression();
    var node = new ComparisonNode<>(host, lit(host, left), op, lit(host, right));
    try ( var result = (Integer) node.evaluate(Integer.class, 128, new Integer()))
    {
      return result.getSignedValue();
    }
  }

  public static void testLessThan()
  {
    assertEquals("1 < 2 → 1", 1, eval(1, Operator.LT, 2));
    assertEquals("2 < 2 → 0", 0, eval(2, Operator.LT, 2));
    assertEquals("3 < 2 → 0", 0, eval(3, Operator.LT, 2));
  }

  public static void testLessThanOrEqual()
  {
    assertEquals("1 ≤ 2 → 1", 1, eval(1, Operator.LE, 2));
    assertEquals("2 ≤ 2 → 1", 1, eval(2, Operator.LE, 2));
    assertEquals("3 ≤ 2 → 0", 0, eval(3, Operator.LE, 2));
  }

  public static void testGreaterThan()
  {
    assertEquals("3 > 2 → 1", 1, eval(3, Operator.GT, 2));
    assertEquals("2 > 2 → 0", 0, eval(2, Operator.GT, 2));
    assertEquals("1 > 2 → 0", 0, eval(1, Operator.GT, 2));
  }

  public static void testGreaterThanOrEqual()
  {
    assertEquals("3 ≥ 2 → 1", 1, eval(3, Operator.GE, 2));
    assertEquals("2 ≥ 2 → 1", 1, eval(2, Operator.GE, 2));
    assertEquals("1 ≥ 2 → 0", 0, eval(1, Operator.GE, 2));
  }

  public static void testEqual()
  {
    assertEquals("2 = 2 → 1", 1, eval(2, Operator.EQ, 2));
    assertEquals("1 = 2 → 0", 0, eval(1, Operator.EQ, 2));
    assertEquals("0 = 0 → 1", 1, eval(0, Operator.EQ, 0));
    assertEquals("-3 = -3 → 1", 1, eval(-3, Operator.EQ, -3));
  }

  public static void testNotEqual()
  {
    assertEquals("2 ≠ 2 → 0", 0, eval(2, Operator.NE, 2));
    assertEquals("1 ≠ 2 → 1", 1, eval(1, Operator.NE, 2));
    assertEquals("-3 ≠ 3 → 1", 1, eval(-3, Operator.NE, 3));
  }

  public static void testTypeIsPrimitiveInt()
  {
    var host = hostExpression();
    var node = new ComparisonNode<>(host, lit(host, 1), Operator.LT, lit(host, 2));
    assertEquals("ComparisonNode.type() must be int.class", int.class, node.type());
  }

  public static void testCommutativityFlags()
  {
    assertTrue("= is commutative", Operator.EQ.isCommutative());
    assertTrue("≠ is commutative", Operator.NE.isCommutative());
    assertFalse("< is not commutative", Operator.LT.isCommutative());
    assertFalse("≤ is not commutative", Operator.LE.isCommutative());
    assertFalse("> is not commutative", Operator.GT.isCommutative());
    assertFalse("≥ is not commutative", Operator.GE.isCommutative());
  }

  /**
   * Constructor must reject non-Integer operands. The current implementation
   * is integer-only by design — Real, Complex, Fraction, and Polynomial
   * comparisons are deferred until a future commit wires up dispatch tables
   * for those primitives. The earliest place to detect a misuse is the
   * constructor itself, per the user's directive.
   */
  public static void testRejectsNonIntegerOperands()
  {
    Expression<Real, Real, arb.functions.real.RealFunction> host =
        new Expression<>("ComparisonHostReal",
                         Real.class,
                         Real.class,
                         arb.functions.real.RealFunction.class,
                         "0",
                         null);
    var realLeft  = host.newLiteralConstant("1");
    var realRight = host.newLiteralConstant("2");
    // Force the literal type to Real so the comparison constructor sees a
    // non-Integer operand. Literal constants in a Real-domain expression
    // typeset as Integer literals when they're whole; we want the type()
    // to disagree with Integer.class to trigger the rejection. Using a
    // literal with a decimal point is the cleanest way:
    var realDecimal = host.newLiteralConstant("1.5");
    try
    {
      new ComparisonNode<>(host, realDecimal, Operator.LT, realRight);
      fail("expected CompilerException for Real-typed comparison operand");
    }
    catch (CompilerException expected)
    {
      assertTrue("rejection message should mention Integer×Integer",
                 expected.getMessage().contains("Integer×Integer"));
    }
  }
}
