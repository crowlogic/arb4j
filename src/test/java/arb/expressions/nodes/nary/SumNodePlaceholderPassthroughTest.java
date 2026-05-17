package arb.expressions.nodes.nary;

import arb.ComplexPolynomial;
import arb.Real;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 * Regression test: inside a {@link arb.expressions.nodes.nary.SumNode} operand
 * sub-expression whose enclosing sequence has codomain
 * {@link arb.ComplexPolynomial}, calling {@code a(j)(v)} must return the
 * polynomial {@code a(j)} itself (pass-through), NOT evaluate it as a scalar
 * at {@code v}.
 *
 * The bug manifests because the operand {@link arb.expressions.Expression} is
 * constructed fresh and its {@code coDomainType} is downgraded to
 * {@link arb.Complex} by
 * {@link arb.expressions.nodes.nary.NAryOperationNode#scalarCoDomain}, which
 * causes each summand to be accumulated as a {@link arb.Complex} scalar rather
 * than as a {@link arb.ComplexPolynomial}. Consequently {@code a(2)} comes out
 * as a degree-0 polynomial instead of the expected degree-1 polynomial.
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/">placeholder
 *      passthrough in sum operand</a>
 */
public class SumNodePlaceholderPassthroughTest extends
                                               TestCase
{
  /**
   * Minimal recurrence that exercises the bug:
   * <pre>
   *   a(k;v) = when(k=1, p(v)/Γ(1+σ),
   *                else, Γ(k-1+1)/Γ(k+1) * (q(v)*a(k-1;v) + r(v)*Σⱼ₌₁ᵏ⁻² a(j;v)*a(k-1-j;v)))
   * </pre>
   * With p=v, q=1, r=1 and σ=1 the first few values are:
   * <ul>
   *   <li>a(1) = v  (degree 1)</li>
   *   <li>a(2) = v  (degree 1, since the sum is empty for k=2)</li>
   * </ul>
   * Before the fix a(2) was returned as a degree-0 polynomial because the
   * sum operand accumulated Complex scalars.
   */
  public void testPolynomialSumOperandPreservesPolynomialType()
  {
    try (var context = new Context();
         var p       = new ComplexPolynomial();
         var q       = new ComplexPolynomial();
         var r       = new ComplexPolynomial();
         var sigma   = new Real())
    {
      // p(v)=v, q(v)=1, r(v)=1, σ=1
      p.set("v");     // p = v  (degree-1 polynomial, coefficient of v is 1)
      q.identity();   // q = 1  (constant polynomial)
      r.identity();   // r = 1  (constant polynomial)
      sigma.set(1, 128);

      context.registerVariable("p", p);
      context.registerVariable("q", q);
      context.registerVariable("r", r);
      context.registerVariable("σ", sigma);

      // The full recurrence from the fractional Riccati Müntz-spectral solver.
      // Arrow syntax used so the placeholder v is explicit.
      var a = ComplexPolynomialSequence.express(
                "k,v->when(k=1,p(v)/Γ(1+σ),else,(Γ(k-1+1)/Γ(k+1))*(q(v)*a(k-1,v)+r(v)*Σj➔a(j,v)*a(k-1-j,v){j=1..k-2}))",
                "a",
                context);

      assertNotNull("sequence compiled to null", a);

      try (var a1 = new ComplexPolynomial();
           var a2 = new ComplexPolynomial())
      {
        a.evaluate(arb.Integer.ONE, 128, a1);
        assertEquals("a(1) should be degree 1", 1, a1.degree());

        try (var two = new arb.Integer())
        {
          two.set(2);
          a.evaluate(two, 128, a2);
        }
        // Before fix: a2.degree()==0 because sum accumulated Complex scalars.
        // After  fix: a2.degree()==1 (the empty sum k=2 adds nothing, but the
        //             q(v)*a(1,v) term must itself stay polynomial).
        assertEquals("a(2) should be degree 1 (sum operand must stay polynomial)",
                     1,
                     a2.degree());
      }
    }
  }
}
