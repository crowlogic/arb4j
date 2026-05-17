package arb.expressions.nodes.nary;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 * Regression test: inside a {@link SumNode} operand sub-expression whose
 * enclosing sequence has codomain {@link ComplexPolynomial}, calling
 * {@code a(j,v)} must accumulate {@link ComplexPolynomial} values (pass-through
 * of the placeholder {@code v}), NOT evaluate each {@code a(j)} as a scalar
 * {@link Complex} at {@code v}.
 *
 * <p>
 * The bug manifests because the operand {@link arb.expressions.Expression} is
 * constructed fresh and its {@code coDomainType} is downgraded to
 * {@link Complex} by
 * {@link NAryOperationNode#scalarCoDomain}, causing each summand to be
 * accumulated as a {@link Complex} scalar rather than as a
 * {@link ComplexPolynomial}. Consequently {@code a(2)} comes out as a degree-0
 * polynomial instead of the expected degree-1 polynomial.
 */
public class SumNodePlaceholderPassthroughTest extends
                                               TestCase
{
  /**
   * Minimal recurrence that exercises the bug.
   *
   * <pre>
   *   a(k;v) = when(k=1, p(v)/Γ(1+σ),
   *                else, (Γ(k)/Γ(k+1)) * (q(v)*a(k-1,v) + r(v)*Σj➔a(j,v)*a(k-1-j,v){j=1..k-2}))
   * </pre>
   *
   * With p(v)=v (degree-1 polynomial), q=1, r=1 and σ=1:
   * <ul>
   *   <li>a(1) = v/Γ(2) = v &nbsp;&nbsp;(degree 1)</li>
   *   <li>a(2) = (1/2)*a(1,v) = v/2 &nbsp;&nbsp;(degree 1; the Σ is empty)</li>
   * </ul>
   * Before the fix a(2).degree()==0 because the sum operand accumulated
   * {@link Complex} scalars and the outer multiply lost the polynomial type.
   */
  public void testPolynomialSumOperandPreservesPolynomialType()
  {
    try (Context         ctx   = new Context();
         ComplexPolynomial p   = new ComplexPolynomial();
         ComplexPolynomial q   = new ComplexPolynomial();
         ComplexPolynomial r   = new ComplexPolynomial();
         Real              sigma = new Real())
    {
      // p(v) = v  :  [0, 1]  via identity()
      p.identity();

      // q(v) = 1, r(v) = 1  (constant polynomials)
      q.one();
      r.one();

      sigma.set(1, 128);

      ctx.registerVariable("p", p);
      ctx.registerVariable("q", q);
      ctx.registerVariable("r", r);
      ctx.registerVariable("σ", sigma);

      var a = ComplexPolynomialSequence.express(
                "k,v->when(k=1,p(v)/Γ(1+σ),else,(Γ(k)/Γ(k+1))*(q(v)*a(k-1,v)+r(v)*Σj➔a(j,v)*a(k-1-j,v){j=1..k-2}))",
                "a",
                ctx);

      assertNotNull("sequence compiled to null", a);

      try (ComplexPolynomial a1 = new ComplexPolynomial();
           ComplexPolynomial a2 = new ComplexPolynomial();
           Integer            k1 = new Integer();
           Integer            k2 = new Integer())
      {
        k1.set(1);
        a.evaluate(k1, 128, a1);
        assertEquals("a(1) should be degree 1", 1, a1.degree());

        k2.set(2);
        a.evaluate(k2, 128, a2);
        // Before fix: degree==0 (sum accumulated Complex scalars, polynomial lost).
        // After  fix: degree==1.
        assertEquals("a(2) should be degree 1 — sum operand must stay polynomial",
                     1,
                     a2.degree());
      }
    }
  }
}
