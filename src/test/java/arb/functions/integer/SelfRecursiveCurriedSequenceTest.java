package arb.functions.integer;

import arb.Complex;
import arb.Integer;
import arb.Real;
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

  /**
   * Minimal mutually-recursive curried pair plus a Real Context variable
   * {@code μ} used multiplicatively in {@code a}'s recursive case. With
   * {@code μ = 1} the arithmetic is identical to
   * {@link #testMinimalMutuallyRecursiveCurriedPair}, so {@code a(2)(2) = 4}.
   */
  public static void testMinimalMutuallyRecursiveCurriedPairWithMu()
  {
    Context ctx = new Context();
    Real μ      = new Real();
    μ.set("1", 128);
    μ.setName("μ");
    ctx.registerVariable(μ);

    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, μ·S(k)(v))";
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

  /**
   * Mutually-recursive curried pair with arithmetic combining the bound
   * integer index {@code k} and a Real Context variable {@code μ}. With
   * {@code μ = 1}: {@code S(2)(v) = v·v = 4}, and
   * {@code a(2)(v) = (2·1)·S(2)(v) = 8}. So {@code a(2)(2) = 8}.
   */
  public static void testMinimalMutuallyRecursiveCurriedPairWithKTimesMu()
  {
    Context ctx = new Context();
    Real μ      = new Real();
    μ.set("1", 128);
    μ.setName("μ");
    ctx.registerVariable(μ);

    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, (k·μ)·S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(8.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Mutually-recursive curried pair with {@code Γ} applied to {@code k·μ+1}
   * in {@code a}'s recursive case — the exact arithmetic shape of the
   * rough-Heston Riccati Müntz recurrence factor. With {@code μ = 1, k = 2}:
   * {@code Γ(k·μ+1) = Γ(3) = 2}, {@code S(2)(v) = v·v = 4}, and
   * {@code a(2)(v) = 2·S(2)(v) = 8}. So {@code a(2)(2) = 8}.
   */
  public static void testMinimalMutuallyRecursiveCurriedPairWithGammaOfKMu()
  {
    Context ctx = new Context();
    Real μ      = new Real();
    μ.set("1", 128);
    μ.setName("μ");
    ctx.registerVariable(μ);

    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, Γ(k·μ+1)·S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(8.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Mutually-recursive curried pair where {@code a}'s recursive case
   * multiplies an external referenced function {@code p(v)} by the recursive
   * self-call {@code a(k-1)(v)} and adds the peer mutual call {@code S(k)(v)}.
   * This is the structural shape of bonanzai's
   * {@code a(k)(v) = (Γ((k-1)·μ+1)/Γ(k·μ+1))·(q(v)·a(k-1)(v)+r(v)·S(k)(v))}
   * with the prefactor and {@code r} dropped. With {@code p(v)=v}: {@code a(1)(v) = v = 2},
   * {@code S(2)(v) = a(1)(v)·a(1)(v) = 4}, {@code a(2)(v) = p(v)·a(1)(v) + S(2)(v) = 2·2 + 4 = 8}.
   */
  public static void testMutuallyRecursiveCurriedPairWithExternalFunctionMultiplyingRecursiveSelfCall()
  {
    Context ctx = new Context();
    ComplexFunction.express("p", "v➔v", ctx);
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, p(v)·a(k-1)(v)+S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(8.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Mutually-recursive curried pair where {@code a}'s recursive case multiplies
   * an external referenced function {@code p(v)} by the peer mutual call
   * {@code S(k)(v)}. With {@code p(v) = v}, {@code k = 2, v = 2}:
   * {@code a(1)(v) = v = 2}, {@code S(2)(v) = 4}, {@code a(2)(v) = p(v)·S(2)(v) = 2·4 = 8}.
   */
  public static void testMutuallyRecursiveCurriedPairWithExternalFunctionMultiplyingPeerCall()
  {
    Context ctx = new Context();
    ComplexFunction.express("p", "v➔v", ctx);
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔a(k-1)(v)·a(k-1)(v)";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, v, else, p(v)·S(k)(v))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(8.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Bonanzai rough-Heston Riccati shape, arb4j-only: three external referenced
   * functions {@code p, q, r}, the Real Context variable {@code μ}, gamma
   * function {@code Γ} applied to {@code k·μ+1} and {@code (k-1)·μ+1}, and
   * the recurrence {@code a:k➔v➔when(k=1, p(v)/Γ(μ+1), else,
   * (Γ((k-1)·μ+1)/Γ(k·μ+1))·(q(v)·a(k-1)(v)+r(v)·S(k)(v)))} with
   * {@code S:k➔v➔sum(j➔a(j)(v)·a(k-1-j)(v){j=1..k-2})}.
   * <p>
   * With {@code p(v)=q(v)=r(v)=v} and {@code μ=1}: Γ(μ+1)=1, Γ((k-1)+1)=Γ(k),
   * Γ(k+1)=k!, ratio = (k-1)!/k! = 1/k. So a(1)(v)=v, a(2)(v)=(1/2)·(v·v+v·S(2)(v)),
   * S(2)(v)=sum(j=1..0,...) = 0 (empty sum), thus a(2)(v)=v·v/2. With v=2, a(2)(2)=2.
   */
  public static void testBonanzaiShapeWithExternalFunctionsAndGammaAndMu()
  {
    Context ctx = new Context();
    Real μ      = new Real();
    μ.set("1", 128);
    μ.setName("μ");
    ctx.registerVariable(μ);

    ComplexFunction.express("p", "v➔v", ctx);
    ComplexFunction.express("q", "v➔v", ctx);
    ComplexFunction.express("r", "v➔v", ctx);

    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, p(v)/Γ(μ+1),"
                                  + " else, (Γ((k-1)·μ+1)/Γ(k·μ+1))·(q(v)·a(k-1)(v)+r(v)·S(k)(v)))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(2);
    Complex         v   = new Complex();
    v.set(2, 0);
    Complex         out = new Complex();

    ComplexFunction a2  = a.evaluate(k, 1, 128, null);
    a2.evaluate(v, 1, 128, out);

    assertEquals(2.0, out.re().doubleValue(), 1e-30);
    assertTrue(out.im().isZero());
  }

  /**
   * Early object-graph regression for the generated QRH recurrence shape.  This
   * test intentionally inspects the generated classes before any high-order
   * Müntz/Padé evaluation can hide the bug as a timeout or OOM.
   *
   * <p>
   * Required generated graph:
   * <pre>
   * a.evaluate(k)  -> afunc with field a
   * afunc.S        -> S
   * S.evaluate(k)  -> Sfunc with field a
   * Sfunc.operandF0001 -> operand with field a
   * </pre>
   */
  public static void testBonanzaiShapeGeneratedObjectGraphCarriesRecursiveA() throws Exception
  {
    Context ctx = new Context();
    Real μ      = new Real();
    μ.set("1", 128);
    μ.setName("μ");
    ctx.registerVariable(μ);

    ComplexFunction.express("p", "v➔v", ctx);
    ComplexFunction.express("q", "v➔v", ctx);
    ComplexFunction.express("r", "v➔v", ctx);

    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔sum(j➔a(j)(v)*a(k-1-j)(v){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", ComplexFunction.class, sExpr, ComplexFunctionSequence.class, ctx);

    String                  aExpr = "a:k➔v➔when(k=1, p(v)/Γ(μ+1),"
                                  + " else, (Γ((k-1)·μ+1)/Γ(k·μ+1))·(q(v)·a(k-1)(v)+r(v)·S(k)(v)))";
    ComplexFunctionSequence a     = ComplexFunctionSequence.express(aExpr, ctx);

    Integer                 k     = new Integer();
    k.set(3);
    ComplexFunction         a3    = a.evaluate(k, 1, 128, null);

    Object afuncA = a3.getClass().getField("a").get(a3);
    assertNotNull("afunc must declare and receive recursive a", afuncA);

    Object S = a3.getClass().getField("S").get(a3);
    assertNotNull("afunc must declare and receive peer S", S);

    ComplexFunction S3 = ((ComplexFunctionSequence) S).evaluate(k, 1, 128, null);
    Object          sfuncA = S3.getClass().getField("a").get(S3);
    assertNotNull("Sfunc must declare and receive recursive a through the functional path", sfuncA);
    assertSame("Sfunc must receive the same recursive a carried by afunc", afuncA, sfuncA);

    Object operand = S3.getClass().getField("operandF0001").get(S3);
    assertNotNull("Sfunc must create generated summation operand", operand);

    Object operandA = operand.getClass().getField("a").get(operand);
    assertNotNull("generated summation operand must receive recursive a", operandA);
    assertSame("Sfunc and its operand must share the same recursive a reference", sfuncA, operandA);
    assertSame("operand must not allocate a fresh recursive a", afuncA, operandA);
  }

  /**
   * Mutually-recursive curried pair where {@code S} itself uses {@code when}
   * to terminate — both peers piecewise. {@code S(k=2)(v) = a(1)(v)·a(1)(v) = v·v},
   * {@code S(k>2)(v) = 0}; {@code a(k=1)(v) = v}, {@code a(k>1)(v) = S(k)(v)}.
   * With {@code k=2, v=2}: {@code a(2)(2) = 4}.
   */
  public static void testMutuallyRecursiveCurriedPairWithWhenInPeer()
  {
    Context ctx = new Context();
    ctx.registerFunctionMapping("a", Integer.class, ComplexFunction.class, ComplexFunctionSequence.class);
    String sExpr = "S:k➔v➔when(k=2, a(1)(v)·a(1)(v), else, 0)";
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
