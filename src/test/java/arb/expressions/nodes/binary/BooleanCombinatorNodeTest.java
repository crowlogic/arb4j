package arb.expressions.nodes.binary;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.binary.ComparisonNode.Operator.*;
import arb.expressions.nodes.unary.BooleanNegationNode;
import arb.functions.Function;
import arb.functions.integer.IntegerSequence;
import junit.framework.TestCase;

/**
 * Unit tests for {@link BooleanCombinatorNode} and {@link BooleanNegationNode}.
 *
 * <p>
 * These exercise the interpretive evaluation path directly because the parser
 * does not yet emit the boolean tokens; end-to-end tests through
 * {@code Function.express} arrive in the follow-up that wires up
 * {@code ∧}/{@code ∨}/{@code ¬} (and their ASCII aliases) into
 * {@link Expression#resolve}. What this test exercises today:
 *
 * <ul>
 * <li>The truth tables for {@code ∧} and {@code ∨} on literal predicates
 * synthesized from {@link ComparisonNode}s.</li>
 * <li>The truth table for {@code ¬} on the same kind of operands.</li>
 * <li>Compositions: nesting combinators and negations to several levels deep.
 * </li>
 * <li>Type validation: a combinator constructed over a non-predicate operand
 * (e.g. an arithmetic literal whose {@code type()} is {@code arb.Integer},
 * not {@code int.class}) throws at construction time.</li>
 * </ul>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BooleanCombinatorNodeTest extends
                                       TestCase
{

  /** Throwaway host expression to parent literal nodes. */
  private static Expression<Integer, Integer, IntegerSequence> hostExpression()
  {
    return new Expression<>("BooleanCombinatorHost",
                            Integer.class,
                            Integer.class,
                            IntegerSequence.class,
                            "0",
                            null);
  }

  /** Build an integer literal node parented to {@code host}. */
  private static <D, R, F extends Function<? extends D, ? extends R>> LiteralConstantNode<D, R, F> lit(Expression<D, R, F> host,
                                                                                                       int v)
  {
    return host.newLiteralConstant(java.lang.Integer.toString(v));
  }

  /** Build a {@code left < right} predicate node. */
  private static <D, R, F extends Function<? extends D, ? extends R>> ComparisonNode<D, R, F> lessThan(Expression<D, R, F> host,
                                                                                                       int left,
                                                                                                       int right)
  {
    return new ComparisonNode<>(host, lit(host, left), ComparisonNode.Operator.LT, lit(host, right));
  }

  /** Build a {@code left = right} predicate node. */
  private static <D, R, F extends Function<? extends D, ? extends R>> ComparisonNode<D, R, F> equalTo(Expression<D, R, F> host,
                                                                                                      int left,
                                                                                                      int right)
  {
    return new ComparisonNode<>(host, lit(host, left), ComparisonNode.Operator.EQ, lit(host, right));
  }

  /** Evaluate a predicate node and return its 0/1 result. */
  private static int eval(Node<?, ?, ?> predicate)
  {
    try ( var result = (Integer) predicate.evaluate(Integer.class, 128, new Integer()))
    {
      return result.getSignedValue();
    }
  }

  // ---------------- AND truth table ----------------

  public static void testAndTrueTrue()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 1, 2); // true
    var rhs  = lessThan(host, 3, 4); // true
    assertEquals("(1<2) ∧ (3<4) → 1", 1, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.AND, rhs)));
  }

  public static void testAndTrueFalse()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 1, 2); // true
    var rhs  = lessThan(host, 4, 3); // false
    assertEquals("(1<2) ∧ (4<3) → 0", 0, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.AND, rhs)));
  }

  public static void testAndFalseTrue()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 2, 1); // false
    var rhs  = lessThan(host, 3, 4); // true
    assertEquals("(2<1) ∧ (3<4) → 0", 0, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.AND, rhs)));
  }

  public static void testAndFalseFalse()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 2, 1); // false
    var rhs  = lessThan(host, 4, 3); // false
    assertEquals("(2<1) ∧ (4<3) → 0", 0, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.AND, rhs)));
  }

  // ---------------- OR truth table ----------------

  public static void testOrTrueTrue()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 1, 2); // true
    var rhs  = lessThan(host, 3, 4); // true
    assertEquals("(1<2) ∨ (3<4) → 1", 1, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.OR, rhs)));
  }

  public static void testOrTrueFalse()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 1, 2); // true
    var rhs  = lessThan(host, 4, 3); // false
    assertEquals("(1<2) ∨ (4<3) → 1", 1, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.OR, rhs)));
  }

  public static void testOrFalseTrue()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 2, 1); // false
    var rhs  = lessThan(host, 3, 4); // true
    assertEquals("(2<1) ∨ (3<4) → 1", 1, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.OR, rhs)));
  }

  public static void testOrFalseFalse()
  {
    var host = hostExpression();
    var lhs  = lessThan(host, 2, 1); // false
    var rhs  = lessThan(host, 4, 3); // false
    assertEquals("(2<1) ∨ (4<3) → 0", 0, eval(new BooleanCombinatorNode<>(host, lhs, BooleanOperator.OR, rhs)));
  }

  // ---------------- NOT truth table ----------------

  public static void testNotTrue()
  {
    var host = hostExpression();
    var inner = lessThan(host, 1, 2); // true
    assertEquals("¬(1<2) → 0", 0, eval(new BooleanNegationNode<>(host, inner)));
  }

  public static void testNotFalse()
  {
    var host = hostExpression();
    var inner = lessThan(host, 2, 1); // false
    assertEquals("¬(2<1) → 1", 1, eval(new BooleanNegationNode<>(host, inner)));
  }

  public static void testDoubleNegation()
  {
    var host  = hostExpression();
    var inner = lessThan(host, 1, 2); // true
    var once  = new BooleanNegationNode<>(host, inner);
    var twice = new BooleanNegationNode<>(host, once);
    assertEquals("¬¬(1<2) → 1", 1, eval(twice));
  }

  // ---------------- Compositions ----------------

  /**
   * De Morgan's law: ¬(p ∧ q) ≡ (¬p) ∨ (¬q).
   * Verifies both sides agree on each of the four assignments to (p,q).
   */
  public static void testDeMorgan()
  {
    var host = hostExpression();
    int[][] truthAssignments = {
        { 1, 2, 3, 4 }, // p = (1<2) = T, q = (3<4) = T
        { 1, 2, 4, 3 }, // p = T, q = F
        { 2, 1, 3, 4 }, // p = F, q = T
        { 2, 1, 4, 3 }, // p = F, q = F
    };
    for (int[] a : truthAssignments)
    {
      var p = lessThan(host, a[0], a[1]);
      var q = lessThan(host, a[2], a[3]);
      var lhs = new BooleanNegationNode<>(host, new BooleanCombinatorNode<>(host, p, BooleanOperator.AND, q));

      var pNeg = new BooleanNegationNode<>(host, lessThan(host, a[0], a[1]));
      var qNeg = new BooleanNegationNode<>(host, lessThan(host, a[2], a[3]));
      var rhs  = new BooleanCombinatorNode<>(host, pNeg, BooleanOperator.OR, qNeg);

      assertEquals("De Morgan disagreement for assignment " + java.util.Arrays.toString(a),
                   eval(rhs),
                   eval(lhs));
    }
  }

  /**
   * Three-way conjunction: (1<2) ∧ (3<4) ∧ (5<6) — exercises right-associative
   * nesting of {@code AND}.
   */
  public static void testThreeWayAnd()
  {
    var host = hostExpression();
    var a = lessThan(host, 1, 2);
    var b = lessThan(host, 3, 4);
    var c = lessThan(host, 5, 6);
    var bAndC = new BooleanCombinatorNode<>(host, b, BooleanOperator.AND, c);
    var all   = new BooleanCombinatorNode<>(host, a, BooleanOperator.AND, bAndC);
    assertEquals("triple AND of all-true → 1", 1, eval(all));
  }

  /**
   * Three-way conjunction with one false branch: (1<2) ∧ (4<3) ∧ (5<6) → 0.
   * Verifies the short-circuit doesn't cause incorrect results when the
   * falsehood is in the middle.
   */
  public static void testThreeWayAndShortCircuits()
  {
    var host = hostExpression();
    var a = lessThan(host, 1, 2); // true
    var b = lessThan(host, 4, 3); // false
    var c = lessThan(host, 5, 6); // true
    var bAndC = new BooleanCombinatorNode<>(host, b, BooleanOperator.AND, c);
    var all   = new BooleanCombinatorNode<>(host, a, BooleanOperator.AND, bAndC);
    assertEquals("triple AND with middle-false → 0", 0, eval(all));
  }

  /**
   * Equality predicate combined with disjunction: (k=0) ∨ (k=1) for k=1.
   * The right operand fires after the left short-circuit fails to settle the
   * answer; verifies the OR's right-evaluation path works.
   */
  public static void testRangePredicateOr()
  {
    var host = hostExpression();
    // Asking: is 1 ∈ {0, 1}?  i.e. (1=0) ∨ (1=1)
    var p = equalTo(host, 1, 0); // false
    var q = equalTo(host, 1, 1); // true
    assertEquals("(1=0) ∨ (1=1) → 1", 1, eval(new BooleanCombinatorNode<>(host, p, BooleanOperator.OR, q)));
  }

  // ---------------- type() invariants ----------------

  public static void testCombinatorTypeIsInt()
  {
    var host = hostExpression();
    var p    = lessThan(host, 1, 2);
    var q    = lessThan(host, 3, 4);
    assertEquals("AND.type() = int.class", int.class, new BooleanCombinatorNode<>(host, p, BooleanOperator.AND, q).type());
    assertEquals("OR.type() = int.class",  int.class, new BooleanCombinatorNode<>(host, p, BooleanOperator.OR,  q).type());
  }

  public static void testNegationTypeIsInt()
  {
    var host = hostExpression();
    var p    = lessThan(host, 1, 2);
    assertEquals("¬.type() = int.class", int.class, new BooleanNegationNode<>(host, p).type());
  }

  // ---------------- Constructor type rejection ----------------

  /**
   * A combinator constructed over a non-predicate operand (here, a raw
   * Integer literal whose {@code type()} is {@code arb.Integer}, not
   * {@code int.class}) must throw at construction time.
   */
  public static void testCombinatorRejectsNonPredicateOperand()
  {
    var host    = hostExpression();
    var literal = lit(host, 5); // type() is arb.Integer, not int.class
    var p       = lessThan(host, 1, 2);
    try
    {
      new BooleanCombinatorNode<>(host, p, BooleanOperator.AND, literal);
      fail("expected CompilerException for non-predicate right operand");
    }
    catch (CompilerException expected)
    {
      assertTrue("rejection message should mention predicate-typed",
                 expected.getMessage().contains("predicate-typed"));
    }
  }

  /**
   * Boolean negation over a non-predicate operand must likewise throw.
   */
  public static void testNegationRejectsNonPredicateOperand()
  {
    var host    = hostExpression();
    var literal = lit(host, 5); // type() is arb.Integer, not int.class
    try
    {
      new BooleanNegationNode<>(host, literal);
      fail("expected CompilerException for non-predicate operand");
    }
    catch (CompilerException expected)
    {
      assertTrue("rejection message should mention predicate-typed",
                 expected.getMessage().contains("predicate-typed"));
    }
  }
}
