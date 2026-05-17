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
      assertNotNull("sequence S must be compiled", ops.S);

      Integer n = new Integer();

      // Evaluate m(0..2) and S(0..2) at the chosen μ/P/Q/R and assert that
      // every result is a non-empty ComplexPolynomial — i.e. the Wheeler
      // recurrence's upstream Muntz moments are actually populated.
      // Empty (length 0) polynomials would indicate the previous
      // ComplexPolynomial.set(Fraction) stub bug or another silent zero
      // propagation path.
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
        ComplexPolynomial Si = ops.S.evaluate(n, 1, bits, null);
        assertNotNull("S(" + i + ") must not be null", Si);
        assertTrue("S(" + i + ") must be a non-empty polynomial (got length " + Si.getLength() + ")", Si.getLength() > 0);
      }
    }
    finally
    {
      μ.close();
    }
  }
}
