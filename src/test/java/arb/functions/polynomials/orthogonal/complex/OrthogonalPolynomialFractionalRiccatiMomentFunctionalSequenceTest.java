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

    try (var ops = new OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(bits,
                                                                                     μ,
                                                                                     "1",
                                                                                     "-1/2",
                                                                                     "3/10"))
    {
      assertNotNull("moment sequence m must be compiled", ops.m);
      assertNotNull("generating polynomial sequence S must be compiled", ops.S);
      assertNotNull("β must be compiled", ops.β);
      assertNotNull("α must be compiled", ops.α);

      Integer n = new Integer();

      // m(0), m(1): basic Müntz coefficients
      ComplexPolynomial m0 = new ComplexPolynomial();
      ComplexPolynomial m1 = new ComplexPolynomial();
      n.set(0);
      ops.m.evaluate(n, 1, bits, m0);
      n.set(1);
      ops.m.evaluate(n, 1, bits, m1);
      System.out.println("m(0) = " + m0);
      System.out.println("m(1) = " + m1);

      // S(-1, z), S(0, z), S(1, z)
      for (int i = -1; i <= 2; i++)
      {
        ComplexPolynomial Si = new ComplexPolynomial();
        n.set(i);
        ops.S.evaluate(n, 1, bits, Si);
        System.out.println("S(" + i + ", z) = " + Si);
      }
    }
    finally
    {
      μ.close();
    }
  }
}
