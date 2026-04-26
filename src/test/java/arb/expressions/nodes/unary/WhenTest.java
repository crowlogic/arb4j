package arb.expressions.nodes.unary;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.functions.Function;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.real.RealFunction;
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

  /**
   * Curried-arrow case: the {@code when} discriminator is the independent
   * variable of the OUTER arrow, not the inner one. With the expression
   *
   * <pre>
   *     f : k ➔ x ➔ when(k=1, x, else, x²)
   * </pre>
   *
   * the inner expression's independent variable is {@code x}; the
   * discriminator {@code k} is bound on the outer arrow and is reachable only
   * through the {@code superExpression} chain. This exercises the second tier
   * of {@code WhenNode.isIndependentVariableOfThisOrAncestorExpression} which
   * delegates to {@code Expression.thisOrAnySuperIndependentVariableIsNamed}.
   * Prior to that fix, this expression failed to compile with a
   * {@link CompilerException} reading "condition of when statement must be the
   * equality of an independent variable...".
   */
  public static void testWhenWithCurriedArrow()
  {
    RealFunctionSequence f = RealFunctionSequence.express("f:k➔x➔when(k=1,x,else,x^2)");

    RealFunction f1 = f.evaluate(1, 128);
    assertEquals("k=1 branch: f(1)(2) = 2", 2.0, f1.eval(2.0, new Real()).doubleValue(), 1e-30);
    assertEquals("k=1 branch: f(1)(3) = 3", 3.0, f1.eval(3.0, new Real()).doubleValue(), 1e-30);

    RealFunction f2 = f.evaluate(2, 128);
    assertEquals("else branch: f(2)(2) = 4", 4.0, f2.eval(2.0, new Real()).doubleValue(), 1e-30);
    assertEquals("else branch: f(3)(3) = 9", 9.0, f2.eval(3.0, new Real()).doubleValue(), 1e-30);
  }

  /**
   * Curried-arrow case with multiple integer cases on the outer index. Asserts
   * that the discriminator does not have to be the immediate independent
   * variable and that several explicit cases plus an {@code else} clause all
   * resolve through the superExpression chain.
   */
  public static void testWhenWithCurriedArrowMultipleCases()
  {
    RealFunctionSequence g = RealFunctionSequence.express("g:n➔x➔when(n=0,1,n=1,x,n=2,x^2,else,x^3)");

    assertEquals(1.0, g.evaluate(0, 128).eval(5.0, new Real()).doubleValue(), 1e-30);
    assertEquals(5.0, g.evaluate(1, 128).eval(5.0, new Real()).doubleValue(), 1e-30);
    assertEquals(25.0, g.evaluate(2, 128).eval(5.0, new Real()).doubleValue(), 1e-30);
    assertEquals(125.0, g.evaluate(3, 128).eval(5.0, new Real()).doubleValue(), 1e-30);
  }

  /**
   * Negative test: a free symbol that is the independent variable of neither
   * the inner nor any enclosing expression must still be rejected. This
   * guards against the predicate becoming permissive enough to admit anything
   * with a name. Inside {@code k➔x➔when(z=1,...)} the symbol
   * {@code z} is unbound on every level of the superExpression chain.
   */
  public static void testWhenRejectsUnboundDiscriminator()
  {
    try
    {
      RealFunctionSequence.express("h:k➔x➔when(z=1,x,else,x^2)");
      fail("expected CompilerException for unbound when-discriminator 'z'");
    }
    catch (CompilerException expected)
    {
      // ok
    }
  }

  // ============================================================
  // Comparison-predicate path tests (general path, if-chain bytecode)
  //
  // Each of the six relational operators in turn, plus the ASCII aliases
  // {@code <=}, {@code >=}, {@code !=}. For these, the legacy lookupswitch
  // detector returns false (any non-EQ predicate disables the fast path),
  // so the if-chain general path is what's exercised here. End-to-end
  // through {@code Function.express} so the parser-side and bytecode-side
  // changes are tested together.
  // ============================================================

  public static void testWhenLessThan()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n<3,5,else,10)");
    assertEquals(5.0,  seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(1), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(2), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(7), 128, new Real()).doubleValue());
  }

  public static void testWhenLessThanOrEqualUnicode()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n≤3,5,else,10)");
    assertEquals(5.0,  seq.evaluate(new Integer(2), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(4), 128, new Real()).doubleValue());
  }

  public static void testWhenLessThanOrEqualAscii()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n<=3,5,else,10)");
    assertEquals(5.0,  seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(4), 128, new Real()).doubleValue());
  }

  public static void testWhenGreaterThan()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n>3,5,else,10)");
    assertEquals(10.0, seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(10.0, seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(4), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(99), 128, new Real()).doubleValue());
  }

  public static void testWhenGreaterThanOrEqualUnicode()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n≥3,5,else,10)");
    assertEquals(10.0, seq.evaluate(new Integer(2), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(4), 128, new Real()).doubleValue());
  }

  public static void testWhenGreaterThanOrEqualAscii()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n>=3,5,else,10)");
    assertEquals(10.0, seq.evaluate(new Integer(2), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(3), 128, new Real()).doubleValue());
  }

  public static void testWhenNotEqualUnicode()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n≠0,5,else,10)");
    assertEquals(10.0, seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(1), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(-3), 128, new Real()).doubleValue());
  }

  public static void testWhenNotEqualAscii()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n!=0,5,else,10)");
    assertEquals(10.0, seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(5.0,  seq.evaluate(new Integer(1), 128, new Real()).doubleValue());
  }

  /**
   * Multiple comparison predicates in one {@code when}. Order-of-match
   * semantics: the first predicate to evaluate true selects the branch.
   */
  public static void testWhenMultipleComparisonsOrderOfMatch()
  {
    // n<0 → 1, n<10 → 2, else → 3 — the second predicate fires only when the
    // first failed, exactly like a chain of if/else if/else.
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n<0,1,n<10,2,else,3)");
    assertEquals(1.0, seq.evaluate(new Integer(-5), 128, new Real()).doubleValue());
    assertEquals(2.0, seq.evaluate(new Integer(0),  128, new Real()).doubleValue());
    assertEquals(2.0, seq.evaluate(new Integer(9),  128, new Real()).doubleValue());
    assertEquals(3.0, seq.evaluate(new Integer(10), 128, new Real()).doubleValue());
    assertEquals(3.0, seq.evaluate(new Integer(99), 128, new Real()).doubleValue());
  }

  /**
   * Mixed equality and inequality predicates. The presence of any non-EQ
   * predicate forces the if-chain general path even though the EQ entries
   * could in isolation be dispatched by lookupswitch.
   */
  public static void testWhenMixedEqualityAndInequality()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n=0,100,n<5,5,else,10)");
    assertEquals(100.0, seq.evaluate(new Integer(0), 128, new Real()).doubleValue());
    assertEquals(5.0,   seq.evaluate(new Integer(1), 128, new Real()).doubleValue());
    assertEquals(5.0,   seq.evaluate(new Integer(4), 128, new Real()).doubleValue());
    assertEquals(10.0,  seq.evaluate(new Integer(5), 128, new Real()).doubleValue());
  }

  /**
   * Curried-arrow form with a comparison predicate on the outer index. This
   * exercises both the curried-arrow visibility fix and the new general-path
   * generator simultaneously.
   */
  public static void testWhenCurriedArrowWithComparison()
  {
    RealFunctionSequence f = RealFunctionSequence.express("f:k➔x➔when(k<3,x,else,x^2)");
    // k=0,1,2 → x branch
    assertEquals(2.0, f.evaluate(0, 128).eval(2.0, new Real()).doubleValue(), 1e-30);
    assertEquals(2.0, f.evaluate(1, 128).eval(2.0, new Real()).doubleValue(), 1e-30);
    assertEquals(2.0, f.evaluate(2, 128).eval(2.0, new Real()).doubleValue(), 1e-30);
    // k=3+ → x^2 branch
    assertEquals(4.0, f.evaluate(3, 128).eval(2.0, new Real()).doubleValue(), 1e-30);
    assertEquals(4.0, f.evaluate(4, 128).eval(2.0, new Real()).doubleValue(), 1e-30);
  }

}
