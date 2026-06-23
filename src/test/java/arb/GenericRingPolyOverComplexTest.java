package arb;

import junit.framework.TestCase;

/**
 * Exercises the nested ring ℂ[v][x] — univariate polynomials whose
 * coefficients are themselves polynomials in v over ℂ.
 *
 * <p>This is the structural prerequisite for orthogonal polynomial sequences
 * over a polynomial ring of parameters: a single GenericRingPolynomial whose
 * coefficients live in the parameter ring.</p>
 */
public class GenericRingPolyOverComplexTest extends
                                            TestCase
{

  /**
   * Build the nested ring ℂ[v][x] and verify a polynomial in x of degree 2
   * actually reports degree 2 (its coefficients are arbitrary elements of
   * ℂ[v] — we just leave them at the default 0 for this structural check).
   */
  public void testNestedPolynomialRingStructure()
  {
    GenericRing C    = GenericRing.complexBalls(128);
    GenericRing Cv   = GenericRing.polynomialsOver(C);    // ℂ[v]
    GenericRing Cvx  = GenericRing.polynomialsOver(Cv);   // ℂ[v][x]

    GenericRingPolynomial p = GenericRingPolynomial.in(Cvx);
    // p(x) := 1 + x² with constant coefficients (small integers, lifted to ℂ[v])
    p.setCoeff(0, 1, Cvx);
    p.setCoeff(2, 1, Cvx);

    assertEquals(2, p.degree());
  }

  /** Multiplication in the nested ring composes correctly. */
  public void testNestedMultiplicationDegreeAdds()
  {
    GenericRing C   = GenericRing.complexBalls(64);
    GenericRing Cv  = GenericRing.polynomialsOver(C);
    GenericRing Cvx = GenericRing.polynomialsOver(Cv);

    GenericRingPolynomial a   = GenericRingPolynomial.in(Cvx);
    GenericRingPolynomial b   = GenericRingPolynomial.in(Cvx);
    GenericRingPolynomial res = GenericRingPolynomial.in(Cvx);

    a.setCoeff(0, 1, Cvx);
    a.setCoeff(1, 1, Cvx);  // x + 1
    b.setCoeff(0, 1, Cvx);
    b.setCoeff(2, 1, Cvx);  // x² + 1

    a.mul(b, Cvx, res);
    // (x+1)(x²+1) = x³ + x² + x + 1 → degree 3
    assertEquals(3, res.degree());
  }
}
