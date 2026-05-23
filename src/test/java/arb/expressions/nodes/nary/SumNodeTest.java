package arb.expressions.nodes.nary;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class SumNodeTest extends
                         TestCase
{
  public static void testFunctionFormOfSum()
  {
    var f = RealFunction.express("x->sin(sum(x^k{k=0..4}))");
    assertNotNull(f);
  }

  /**
   * Regression: a Σ whose operand body evaluates to a wider type than the
   * outer codomain must be typed at the wider type, so downstream operators
   * like {@code re}/{@code im} (Complex → Real) can be applied to it.
   *
   * <p>Specifically: a RealSequence with body {@code re(Σk➔a(k)[m]{k=1..N})}
   * — the Σ summands are Complex (polynomial coefficients of a ComplexPolynomial
   * via {@code a(k)[m]}), and {@code re(...)} must accept the Complex Σ result.
   * Before the fix, {@code generatedType} of Σ was {@code expression.coDomainType}
   * (Real, from the outer RealSequence), causing typecheck to reject
   * {@code re} with: "no such function named re from class arb.Real to class
   * arb.Real".
   */
  public static void testSumOfComplexBodyInsideRealSequenceAllowsReExtraction()
  {
    Context ctx = new Context();
    Integer N   = new Integer(3).setName("N");
    ctx.registerVariable(N);
    // a:k ➔ v ➔ v^k is a ComplexPolynomialSequence (polynomial in v, indexed by k).
    var a = ComplexPolynomialSequence.express("a", "k➔v➔v^k", ctx);
    ctx.registerFunction("a", a);

    // κ:m ➔ re(Σk➔a(k)[m]{k=1..N}) — sum-of-complex-coefficients inside a RealSequence.
    // a(k)[m] is the m-th coefficient of v^k, which is Complex (1 if k==m, 0 otherwise).
    // The Σ over Complex must typecheck as Complex so the outer re() accepts it.
    RealSequence.express("κ", "m➔re(Σk➔a(k)[m]{k=1..N})", ctx);
  }
}
