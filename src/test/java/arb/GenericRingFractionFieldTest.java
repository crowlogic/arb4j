package arb;

import junit.framework.TestCase;

/**
 * Exercises {@link GenericRing#fractionFieldOf(GenericRing)} on the polynomial
 * ring ℂ[v]. The resulting field is ℂ(v) — rational functions in v with
 * complex ball coefficients.
 *
 * <p>This is the carrier required for any orthogonal polynomial sequence whose
 * recurrence involves division of polynomials in v (e.g. α(n) = σ(n,n+1)/h(n)
 * where σ and h carry their dependence on a parameter v).</p>
 */
public class GenericRingFractionFieldTest extends
                                          TestCase
{

  /** The fraction field of ℂ[v] is constructible and supports polynomial init. */
  public void testFractionFieldIsConstructible()
  {
    GenericRing C    = GenericRing.complexBalls(128);
    GenericRing Cv   = GenericRing.polynomialsOver(C);
    GenericRing CvQ  = GenericRing.fractionFieldOf(Cv);   // ℂ(v)

    // A polynomial in some other indeterminate over ℂ(v):
    // p(x) = 1 + x — coefficients live in ℂ(v) but are concretely small integers.
    GenericRingPolynomial p = GenericRingPolynomial.in(CvQ);
    p.setCoeff(0, 1, CvQ);
    p.setCoeff(1, 1, CvQ);

    assertEquals(1, p.degree());
  }

  /**
   * Polynomials over ℂ(v) support nontrivial multiplication. Verify the
   * degree composition rule.
   */
  public void testPolynomialOverFractionFieldMultiplies()
  {
    GenericRing C   = GenericRing.complexBalls(64);
    GenericRing Cv  = GenericRing.polynomialsOver(C);
    GenericRing CvQ = GenericRing.fractionFieldOf(Cv);

    GenericRingPolynomial a   = GenericRingPolynomial.in(CvQ);
    GenericRingPolynomial b   = GenericRingPolynomial.in(CvQ);
    GenericRingPolynomial res = GenericRingPolynomial.in(CvQ);

    a.setCoeff(0, 1, CvQ);
    a.setCoeff(1, 1, CvQ);
    b.setCoeff(0, 1, CvQ);
    b.setCoeff(1, 1, CvQ);

    a.mul(b, CvQ, res);
    // (1+x)² = 1 + 2x + x² → degree 2
    assertEquals(2, res.degree());
  }
}
