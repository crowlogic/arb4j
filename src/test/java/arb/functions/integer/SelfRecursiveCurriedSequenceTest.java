package arb.functions.integer;

import arb.Complex;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Regression test for inner-curry preservation across self-recursive splice.
 *
 * <p>
 * A {@link ComplexFunctionSequence} whose codomain is a curried
 * {@link ComplexFunction} (so the source has the form {@code k➔v➔body}) must
 * preserve the inner {@code v➔} arrow when {@code body} contains a
 * self-reference such as {@code a(k-1)(v)}. Prior to the fix, the inner
 * functional arrow was dropped during dependency-assignment splice, producing
 * {@code afunc:k➔body} (one arrow short) and crashing with
 * {@code UndefinedReferenceException 'v'}.
 *
 * <p>
 * Concretely, with the recurrence {@code a(1)(v)=v} and
 * {@code a(k)(v)=a(k-1)(v)+v}, evaluating {@code a(3)(2)=2+2+2=6} fully
 * exercises the splice path: parsing, recursion through the integer-domain
 * cache, and codomain-function evaluation.
 */
public class SelfRecursiveCurriedSequenceTest extends
                                              TestCase
{
  public static void testSelfRecursiveInnerCurryIsPreserved()
  {
    Context                 ctx    = new Context();
    String                  source = "a:k➔v➔when(k=1, v, else, a(k-1)(v)+v)";
    ComplexFunctionSequence a      = ComplexFunctionSequence.express(source, ctx);

    Integer                 k      = new Integer();
    k.set(3);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a3  = a.evaluate(k, 1, 128, null);
    a3.evaluate(v, 1, 128, out);

    assertEquals(6.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Mutually-recursive curried functional sequences: peers a and S each have
   * codomain {@link ComplexFunction} and reference each other. Equivalent to
   * the inner cluster of the Müntz–Padé recurrence with all numerical content
   * stripped:
   * <ul>
   * <li>{@code S(k)(v) = sum(j ➔ a(j)(v)*a(k-1-j)(v) {j=1..k-2})}</li>
   * <li>{@code a(1)(v) = v}; {@code a(k)(v) = a(k-1)(v) + S(k)(v)}</li>
   * </ul>
   * For {@code k=3}, {@code S(3)(v) = a(1)(v)·a(1)(v) = v²}, so
   * {@code a(2)(v) = a(1)(v) + S(2)(v) = v + 0 = v}, and
   * {@code a(3)(v) = a(2)(v) + S(3)(v) = v + v²}. With {@code v=2},
   * {@code a(3)(2) = 2 + 4 = 6}.
   */
  public static void testMutuallyRecursiveCurriedSequencesPreserveInnerCurry()
  {
    Context ctx = new Context();
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, a(k-1)(v)+S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(3);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a3  = a.evaluate(k, 1, 128, null);
    a3.evaluate(v, 1, 128, out);

    assertEquals(6.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Same {@code a ↔ S} mutual recursion as the green case above, but with one
   * change: an external referenced function {@code p(v) = v} is registered in
   * the Context first, and {@code a}'s base case calls {@code p(v)} instead of
   * referring to {@code v} directly. With {@code p(v) = v} the arithmetic is
   * identical, so {@code a(3)(2) = 6} remains exact.
   */
  public static void testMutuallyRecursiveCurriedSequencesWithExternalReferencedFunction()
  {
    Context ctx = new Context();
    ComplexFunction.express("p", "v➔v", ctx);
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, p(v), else, a(k-1)(v)+S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(3);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a3  = a.evaluate(k, 1, 128, null);
    a3.evaluate(v, 1, 128, out);

    assertEquals(6.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Minimal mutually-recursive curried pair: {@code a} references {@code S},
   * {@code S} references {@code a}, both curried {@code k➔v➔...}, no sum,
   * no external referenced functions, no Context variables besides the bound
   * arguments. Recurrence: {@code S(k)(v) = a(k-1)(v)·a(k-1)(v)} and
   * {@code a(k)(v) = when(k=1, v, else, S(k)(v))}. With {@code k=2, v=2}:
   * {@code a(1)(v) = v = 2}, {@code S(2)(v) = 4}, {@code a(2)(v) = 4}.
   */
  public static void testMinimalMutuallyRecursiveCurriedPair()
  {
    Context ctx = new Context();
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(4.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }
}
