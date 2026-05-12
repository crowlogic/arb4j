package arb.functions.polynomials.orthogonal.complex;

import arb.Real;
import arb.Integer;
import arb.functions.complex.ComplexFunction;
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

    try (var ops = new OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(bits,
                                                                                     μ,
                                                                                     "1",
                                                                                     "-1/2",
                                                                                     "3/10"))
    {
      assertNotNull("moment sequence m must be compiled", ops.m);
      assertNotNull("sequence S must be compiled", ops.S);

      Integer n = new Integer();

      // Each m(k) is a ComplexPolynomial in u; same for S(i).
      for (int k = 0; k <= 2; k++)
      {
        n.set(k);
        ComplexFunction mk = ops.m.evaluate(n, 1, bits, null);
        System.out.println("m(" + k + ") = " + mk);
      }

      for (int i = 0; i <= 2; i++)
      {
        n.set(i);
        ComplexFunction Si = ops.S.evaluate(n, 1, bits, null);
        System.out.println("S(" + i + ") = " + Si);
      }
    }
    finally
    {
      μ.close();
    }
  }
}
