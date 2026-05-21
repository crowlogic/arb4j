package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.Real;
import arb.Integer;
import junit.framework.TestCase;

/**
 * Smoke + correctness tests for
 * {@link OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence}.
 *
 * <p>
 * Reference: Theorem 5.1 of
 * {@code docs/SolutionMethodologyForConstantCoefficientFractionalRiccatiEquations.md}.
 *
 * @author Stephen Crowley ©2024–2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequenceTest extends
                                                                              TestCase
{

  /**
   * Smoke test: the polynomial Chebyshev/Wheeler recurrence compiles and the
   * sequence S, β, α, P can be queried at small n without throwing.
   *
   * <p>
   * Trivial Riccati: μ = 0.6, P(v) = 1, Q(v) = −1/2, R(v) = 3/10.
   */
  public void testConstructionAndFirstFewTerms()
  {
    int  bits = 128;
    Real μ    = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    try (var ops = new OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(μ,
                                                                                     "1",
                                                                                     "-1/2",
                                                                                     "3/10"))
    {
      assertNotNull("moment sequence m must be compiled", ops.m);
      assertNotNull("σ-table must be compiled", ops.σ);
      assertNotNull("h (squared norms) must be compiled", ops.h);
      assertNotNull("α (Jacobi diagonal) must be compiled", ops.α);
      assertNotNull("β (Jacobi off-diagonal²) must be compiled", ops.β);

      Integer n = new Integer();

      // Evaluate m(0..2) and h(0..2) at the chosen μ/P/Q/R and assert that
      // every result is a non-empty ComplexPolynomial — i.e. the σ-table
      // recurrence's upstream Müntz moments are actually populated. Empty
      // (length 0) polynomials would indicate a silent zero-propagation
      // path through Complex→ComplexPolynomial promotions.
      for (int k = 0; k <= 2; k++)
      {
        n.set(k);
        ComplexPolynomial mk = ops.m.evaluate(n, 1, bits, null);
        assertNotNull("m(" + k + ") must not be null", mk);
        assertTrue("m(" + k + ") must be a non-empty polynomial (got length " + mk.getLength() + ")", mk.getLength() > 0);
      }

      for (int i = 0; i <= 2; i++)
      {
        n.set(i);
        ComplexPolynomial hi = ops.h.evaluate(n, 1, bits, null);
        assertNotNull("h(" + i + ") must not be null", hi);
        assertTrue("h(" + i + ") must be a non-empty polynomial (got length " + hi.getLength() + ")", hi.getLength() > 0);
      }
    }
    finally
    {
      μ.close();
    }
  }
}
