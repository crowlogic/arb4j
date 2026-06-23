package arb;

import junit.framework.TestCase;

/**
 * Round-trip the numerator and denominator of an element of the fraction
 * field over the polynomial ring over the complex acb ring (i.e. ℂ(v)).
 */
public class GenericRingFractionAccessorTest extends
                                             TestCase
{
  public void testNumeratorOfIntegerEmbeddedAsFraction()
  {
    int prec = 128;
    GenericRing C       = GenericRing.complexBalls(prec);
    GenericRing Cv      = GenericRing.polynomialsOver(C);
    GenericRing CvField = GenericRing.fractionFieldOf(Cv);

    GenericRingPolynomial p = GenericRingPolynomial.in(CvField);
    p.setCoeff(0, 1, CvField);

    ComplexPolynomial num = new ComplexPolynomial();
    ComplexPolynomial den = new ComplexPolynomial();
    CvField.fractionNumerator(p, num);
    CvField.fractionDenominator(p, den);

    assertEquals("numerator length", 1, num.getLength());
    assertEquals("denominator length", 1, den.getLength());
  }
}
