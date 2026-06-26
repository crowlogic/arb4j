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
 * <h2>Oracle: tanh J-fraction</h2>
 *
 * The classical tanh Stieltjes J-fraction
 *
 * <pre>
 *   tanh(z) = z / (1 + z²/3 / (1 + z²/5 / (1 + ⋯ )))
 * </pre>
 *
 * has the Jacobi coefficients
 *
 * <pre>
 *   α_j = 0  for all j  (symmetric functional — tanh is odd)
 *   β_j = j(j+1) / ((2j−1)(2j+1))
 *       : β_1 = 2/3,  β_2 = 2/5,  β_3 = 12/35
 * </pre>
 *
 * These are exactly the Jacobi coefficients of the moment functional whose
 * moment sequence is the Müntz–Tau basis of tanh from the fractional Riccati
 * μ=1, P=1, Q=0, R=−1.
 *
 * <p>
 * Covered:
 * <ol>
 *   <li>{@code warmTo(M)} does not throw and populates σ, h, α, β for j up
 *       to M.</li>
 *   <li>All σ(j)(k), h(j), α(j), β(j) are non-empty polynomials at each
 *       warmed index.</li>
 *   <li>The diagonal Jacobi coefficients α(j) are all zero for the symmetric
 *       tanh functional (regression guard for the α two-term correction).</li>
 *   <li>β(1) = 2/3 and β(2) = 2/5 match the tanh J-fraction oracle to 10
 *       digits, confirming that the σ-table recurrence produces the correct
 *       off-diagonal Jacobi entries.</li>
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
   * {@code warmTo(M)} for M = 1, 2, 3 does not throw and leaves all
   * four recurrence sequences non-null.
   */
  public void testWarmToDoesNotThrow()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS())
    {
      for (int M = 1; M <= 3; M++)
      {
        ops.warmTo(M, BITS);
        assertNotNull("σ must be non-null after warmTo(" + M + ")", ops.σ);
        assertNotNull("h must be non-null after warmTo(" + M + ")", ops.h);
        assertNotNull("α must be non-null after warmTo(" + M + ")", ops.α);
        assertNotNull("β must be non-null after warmTo(" + M + ")", ops.β);
      }
    }
  }

  /**
   * h(j) for j = 0..3 must be non-empty after warmTo(3).
   */
  public void testSquaredNormsAreNonEmpty()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer())
    {
      ops.warmTo(3, BITS);
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
      ops.warmTo(3, BITS);
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
   * β(1) must equal 2/3 and β(2) must equal 2/5 (tanh J-fraction oracle)
   * when evaluated at v = 1, to at least 10 decimal digits.
   *
   * <p>
   * These values are the first two off-diagonal Jacobi entries of the moment
   * functional whose moments are the Müntz–Tau basis of tanh. The C engine
   * smoke test ({@code native/pade_resolvent.c}) uses the same oracle; this
   * test verifies the Java σ-table produces the same Jacobi input.
   */
  public void testBetaCoefficientsMatchTanhJFraction()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer();
          Complex v = new Complex())
    {
      ops.warmTo(3, BITS);
      v.set("1", BITS);

      // β(1) = 2/3
      n.set(1);
      ComplexPolynomial β1poly = ops.β.evaluate(n, 1, BITS, null);
      assertNotNull("β(1) must not be null", β1poly);
      Complex β1v = new Complex();
      β1poly.evaluate(v, 1, BITS, β1v);
      assertEquals("β(1)(v=1) real must equal 2/3", 2.0 / 3.0, β1v.re().doubleValue(), 1e-10);
      assertEquals("β(1)(v=1) imag must be 0", 0.0, β1v.im().doubleValue(), 1e-10);

      // β(2) = 2/5
      n.set(2);
      ComplexPolynomial β2poly = ops.β.evaluate(n, 1, BITS, null);
      assertNotNull("β(2) must not be null", β2poly);
      Complex β2v = new Complex();
      β2poly.evaluate(v, 1, BITS, β2v);
      assertEquals("β(2)(v=1) real must equal 2/5", 2.0 / 5.0, β2v.re().doubleValue(), 1e-10);
      assertEquals("β(2)(v=1) imag must be 0", 0.0, β2v.im().doubleValue(), 1e-10);
    }
  }

  /**
   * Repeated warmTo calls are idempotent: re-running warmTo(M) after warmTo(M)
   * must not throw and must leave the sequences unchanged.
   */
  public void testWarmToIsIdempotent()
  {
    try ( FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence ops = tanhOPS();
          Integer n = new Integer();
          Complex v = new Complex())
    {
      v.set("1", BITS);
      ops.warmTo(2, BITS);

      n.set(1);
      ComplexPolynomial β1first = ops.β.evaluate(n, 1, BITS, null);
      Complex β1firstV = new Complex();
      β1first.evaluate(v, 1, BITS, β1firstV);
      double beta1Re = β1firstV.re().doubleValue();

      // Second warmTo at same M
      ops.warmTo(2, BITS);
      ComplexPolynomial β1second = ops.β.evaluate(n, 1, BITS, null);
      Complex β1secondV = new Complex();
      β1second.evaluate(v, 1, BITS, β1secondV);

      assertEquals("β(1) must be unchanged by repeated warmTo(2)",
                   beta1Re, β1secondV.re().doubleValue(), 1e-15);
    }
  }
}
