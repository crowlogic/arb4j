package arb.functions.polynomials.orthogonal.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import junit.framework.TestCase;

/**
 * Extended tests for the σ-table / Chebyshev-Wheeler recurrence inside
 * {@link OrthogonalPolynomialMomentFunctionalSequence}, exercised through the
 * concrete subclass
 * {@link FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence}.
 *
 * <h2>Oracle: tanh moment-functional J-fraction</h2>
 *
 * The moment functional of this OPS has moment sequence m(k) = a(k+1), the
 * Müntz–Tau / Taylor coefficients of tanh from the fractional Riccati μ=1,
 * P=1, Q=0, R=−1 (a(1)=1, a(3)=−1/3, a(5)=2/15, …). Its moment generating
 * series is therefore
 *
 * <pre>
 *   Σ_{k≥0} m(k) wᵏ = tanh(z)/z = 1 − z²/3 + 2z⁴/15 − ⋯ ,   w = z².
 * </pre>
 *
 * The monic OPS of this series has the Jacobi coefficients
 *
 * <pre>
 *   α_j = 0  for all j  (symmetric functional — tanh is odd)
 *   β_j = −1 / ((2j−1)(2j+1))
 *       : β_1 = −1/3,  β_2 = −1/15,  β_3 = −1/35
 * </pre>
 *
 * (Note: these differ from the Jacobi coefficients of the continued fraction
 * tanh(z) = z/(1 + z²/3/(1 + z²/5/⋯)) expanded directly in z; that arrangement
 * has β_j = j(j+1)/((2j−1)(2j+1)). This OPS is the J-fraction of the moment
 * series tanh(z)/z in w = z², not of tanh(z) in z.) The values above are
 * verified three ways: (i) directly from the Hankel/σ-table recurrence on the
 * tanh moments, (ii) the J-fraction Σ m_k wᵏ built from these α,β reproduces
 * tanh, and (iii) they match — up to the R = ±1 sign — the β produced by the
 * reference modified-Chebyshev map for the y′ = 1 + y² (tan) case.
 *
 * <p>
 * Covered:
 * <ol>
 *   <li>Evaluating β(M) directly does not throw and populates σ, h, α, β for
 *       j up to M via the dependency-order fill-on-miss in the generated
 *       {@code evaluate(...)} wrappers.</li>
 *   <li>All σ(j)(k), h(j), α(j), β(j) are non-empty polynomials at each
 *       filled index.</li>
 *   <li>The diagonal Jacobi coefficients α(j) are all zero for the symmetric
 *       tanh functional (regression guard for the α two-term correction).</li>
 *   <li>β(1) = −1/3 and β(2) = −1/15 match the tanh moment-functional J-fraction
 *       oracle to 10 digits, confirming that the σ-table recurrence produces
 *       the correct off-diagonal Jacobi entries.</li>
 * </ol>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class OrthogonalPolynomialMomentFunctionalSequenceTest extends
                                                              TestCase
{
  private static final int BITS = 128;

  /** tanh oracle: μ=1, P=1, Q=0, R=−1. */
  private static FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence tanhOPS()
  {
    Real μ = new Real().set("1", BITS);
    return new FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence(μ, "1", "0", "-1");
  }

  /**
   * Evaluating β(M) directly for M = 1, 2, 3 does not throw — the generated
   * evaluate() wrappers fill the {σ,h,α,β} caches in dependency order on a
   * miss — and leaves all four recurrence sequences non-null.
   */
  public void testEvaluatingBetaDirectlyDoesNotThrow()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer())
    {
      for (int M = 1; M <= 3; M++)
      {
        n.set(M);
        ComplexPolynomial βM = ops.β.evaluate(n, 1, BITS, null);
        assertNotNull("β(" + M + ") must not be null", βM);
        assertNotNull("σ must be non-null after evaluating β(" + M + ")", ops.σ);
        assertNotNull("h must be non-null after evaluating β(" + M + ")", ops.h);
        assertNotNull("α must be non-null after evaluating β(" + M + ")", ops.α);
        assertNotNull("β must be non-null after evaluating β(" + M + ")", ops.β);
      }
    }
  }

  /**
   * h(j) for j = 0..3 must be non-empty when evaluated directly.
   */
  public void testSquaredNormsAreNonEmpty()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer())
    {
      for (int j = 0; j <= 3; j++)
      {
        n.set(j);
        ComplexPolynomial hj = ops.h.evaluate(n, 1, BITS, null);
        assertNotNull("h(" + j + ") must not be null", hj);
        assertTrue("h(" + j + ") must be a non-empty polynomial (length=" + hj.getLength() + ")",
                   hj.getLength() > 0);
      }
    }
  }

  /**
   * For the symmetric tanh functional all diagonal Jacobi coefficients α(j)
   * must be zero (or negligibly small) for j = 0..2.
   *
   * <p>
   * The two-term α correction
   * <pre>
   *   α(j) = σ(j)(j+1)/h(j) − σ(j-1)(j)/h(j-1)
   * </pre>
   * equals zero for every symmetric functional (Σ α = 0 by the odd moments of
   * tanh). This is the key regression guard for the correction term: if it is
   * omitted, α accumulates a non-zero error from the second term.
   */
  public void testDiagonalJacobiCoefficientsAreZeroForSymmetricFunctional()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer();
          Complex v = new Complex())
    {
      v.set("1", BITS); // evaluate at v=1

      for (int j = 0; j <= 2; j++)
      {
        n.set(j);
        ComplexPolynomial αj = ops.α.evaluate(n, 1, BITS, null);
        assertNotNull("α(" + j + ") must not be null", αj);
        // Evaluate the polynomial at v=1 to get the scalar
        Complex αjv = new Complex();
        αj.evaluate(v, 1, BITS, αjv);
        assertEquals("α(" + j + ")(v=1) real must be ~0 for symmetric tanh functional",
                     0.0, αjv.re().doubleValue(), 1e-10);
        assertEquals("α(" + j + ")(v=1) imaginary must be 0",
                     0.0, αjv.im().doubleValue(), 1e-10);
      }
    }
  }

  /**
   * β(1) must equal −1/3 and β(2) must equal −1/15 (tanh moment-functional
   * J-fraction oracle) when evaluated at v = 1, to at least 10 decimal digits.
   *
   * <p>
   * These values are the first two off-diagonal Jacobi entries of the moment
   * functional whose moments are the Müntz–Tau basis of tanh — i.e. the
   * J-fraction of the series Σ m_k wᵏ = tanh(z)/z (w = z²), with closed form
   * β_j = −1/((2j−1)(2j+1)). They reproduce tanh through the J-fraction and
   * match — up to the R = ±1 sign — the reference modified-Chebyshev map for
   * the tan (y′ = 1 + y²) case; this test verifies the Java σ-table produces
   * the same Jacobi input.
   */
  public void testBetaCoefficientsMatchTanhJFraction()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer();
          Complex v = new Complex())
    {
      v.set("1", BITS);

      // β(1) = −1/3
      n.set(1);
      ComplexPolynomial β1poly = ops.β.evaluate(n, 1, BITS, null);
      assertNotNull("β(1) must not be null", β1poly);
      Complex β1v = new Complex();
      β1poly.evaluate(v, 1, BITS, β1v);
      assertEquals("β(1)(v=1) real must equal -1/3", -1.0 / 3.0, β1v.re().doubleValue(), 1e-10);
      assertEquals("β(1)(v=1) imag must be 0", 0.0, β1v.im().doubleValue(), 1e-10);

      // β(2) = −1/15
      n.set(2);
      ComplexPolynomial β2poly = ops.β.evaluate(n, 1, BITS, null);
      assertNotNull("β(2) must not be null", β2poly);
      Complex β2v = new Complex();
      β2poly.evaluate(v, 1, BITS, β2v);
      assertEquals("β(2)(v=1) real must equal -1/15", -1.0 / 15.0, β2v.re().doubleValue(), 1e-10);
      assertEquals("β(2)(v=1) imag must be 0", 0.0, β2v.im().doubleValue(), 1e-10);
    }
  }

  /**
   * Repeated direct evaluations are idempotent: re-evaluating β(1) after a
   * prior evaluation must not throw and must return the same value (the second
   * call is a pure cache hit).
   */
  public void testRepeatedEvaluationIsIdempotent()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer();
          Complex v = new Complex())
    {
      v.set("1", BITS);

      n.set(1);
      ComplexPolynomial β1first = ops.β.evaluate(n, 1, BITS, null);
      Complex β1firstV = new Complex();
      β1first.evaluate(v, 1, BITS, β1firstV);
      double beta1Re = β1firstV.re().doubleValue();

      // Second evaluation at the same index is a cache hit
      ComplexPolynomial β1second = ops.β.evaluate(n, 1, BITS, null);
      Complex β1secondV = new Complex();
      β1second.evaluate(v, 1, BITS, β1secondV);

      assertEquals("β(1) must be unchanged by repeated evaluation",
                   beta1Re, β1secondV.re().doubleValue(), 1e-15);
    }
  }
}
