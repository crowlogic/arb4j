package arb;

import junit.framework.TestCase;

/**
 * Exercises the {@link GenericRing#complexBalls(int)} factory and the
 * polynomial operations carrying coefficients in ℂ (acb).
 *
 * Verifies that the SWIG-generated wrapper methods correctly route to the
 * underlying FLINT gr_* functions and that the polynomial degrees behave as
 * expected for a non-trivial example.
 */
public class GenericRingComplexBallsTest extends
                                         TestCase
{

  /** Polynomial (x+1)·(x−1) = x²−1 must have degree 2 after multiplication. */
  public void testMultiplyTwoLinearFactorsOverComplexBalls()
  {
    GenericRing            C   = GenericRing.complexBalls(128);
    GenericRingPolynomial  a   = GenericRingPolynomial.in(C);
    GenericRingPolynomial  b   = GenericRingPolynomial.in(C);
    GenericRingPolynomial  res = GenericRingPolynomial.in(C);

    // a := x + 1
    a.setCoeff(0, 1, C);
    a.setCoeff(1, 1, C);
    // b := x − 1
    b.setCoeff(0, -1, C);
    b.setCoeff(1, 1, C);

    a.mul(b, C, res);

    assertEquals("(x+1)(x-1) has degree 2", 2, res.degree());
  }

  /** Derivative of x³ − x² + 1 is 3x² − 2x. Verify degree drops by one. */
  public void testDerivativeReducesDegreeByOne()
  {
    GenericRing            C   = GenericRing.complexBalls(128);
    GenericRingPolynomial  p   = GenericRingPolynomial.in(C);
    GenericRingPolynomial  dp  = GenericRingPolynomial.in(C);

    p.setCoeff(0, 1, C);
    p.setCoeff(2, -1, C);
    p.setCoeff(3, 1, C);

    p.derivative(C, dp);

    assertEquals("d/dx(x³−x²+1) is degree 2", 2, dp.degree());
  }

  /** Zero polynomial has degree 0 in the FLINT convention used here. */
  public void testZeroPolynomial()
  {
    GenericRing            C = GenericRing.complexBalls(64);
    GenericRingPolynomial  z = GenericRingPolynomial.in(C);
    z.zero(C);
    assertEquals(0, z.degree());
  }
}
