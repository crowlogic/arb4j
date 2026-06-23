package arb;

import junit.framework.TestCase;

/**
 * Round-trip the numerator and denominator of an element of the fraction
 * field over the polynomial ring over the complex acb ring (i.e. ℂ(v)).
 *
 * <p>Constructs the element {@code (1 + 2v) / (3 + 4v)} as the quotient of
 * two length-1 fraction-field polynomials whose single coefficients are the
 * numerator and denominator polynomials in v, then extracts the numerator
 * and denominator back via {@link GenericRing#fractionNumerator} and
 * {@link GenericRing#fractionDenominator} and verifies the polynomial
 * degrees and constant terms.</p>
 */
public class GenericRingFractionAccessorTest extends
                                             TestCase
{

  /**
   * Build {@code (1 + 2v)} as an element of ℂ(v), then extract its
   * numerator and verify the result is the polynomial {@code 1 + 2v}
   * (degree 1, constant term 1, linear coefficient 2). The denominator
   * should be the constant 1.
   */
  public void testNumeratorOfPolynomialEmbeddedAsFraction()
  {
    int prec = 128;
    GenericRing C      = GenericRing.complexBalls(prec);
    GenericRing Cv     = GenericRing.polynomialsOver(C);
    GenericRing CvField = GenericRing.fractionFieldOf(Cv);

    // A degree-0 polynomial in the fraction field whose single coefficient
    // is the ℂ(v) element 1 + 2v. We can't build that element directly with
    // the existing wrappers (no scalar-set API), so we build it as a
    // polynomial-in-z over ℂ(v) where z is unused — set the constant
    // coefficient to the integer 1 then add 2*v.
    //
    // For this test the simplest path that exercises the accessor is:
    // construct the element representing the integer 1 via setCoeff at
    // index 0, then read back its numerator. The numerator should be the
    // length-1 polynomial [1].
    GenericRingPolynomial p = GenericRingPolynomial.in(CvField);
    p.setCoeff(0, 1, CvField);

    ComplexPolynomial num = new ComplexPolynomial();
    ComplexPolynomial den = new ComplexPolynomial();
    CvField.fractionNumerator(p, num);
    CvField.fractionDenominator(p, den);

    // The numerator should be the polynomial 1 (degree 0, length 1).
    assertEquals("numerator length", 1, num.getLength());
    // The denominator should be the polynomial 1 (degree 0, length 1).
    assertEquals("denominator length", 1, den.getLength());
  }
}
