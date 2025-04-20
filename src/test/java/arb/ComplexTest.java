package arb;

import static java.lang.Math.pow;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings(
{ "unused" })
public class ComplexTest extends
                         TestCase
{
  static double    ε    = pow(10, -8);

  static final int prec = 256;


  public void testLogGamma()
  {
    Complex x      = new Complex("8.7",
                           128);
    Complex result = x.logΓ(128, new Complex());
    assertEquals(9.967761685128642593213111179011761191, result.re().doubleValue());
    assertTrue( result.im().isZero() );
  }
  
  public static void testNormalize()
  {
    try ( Complex r = new Complex(); Complex s = new Complex())
    {
      r.set(-0.8790040702, 4.0771861722);
      r.normalize(s, prec);
      assertEquals(4.170862649, r.norm(prec, new Real()).doubleValue(), ε);
      assertEquals(0.9775402634, s.getImag().doubleValue(), ε);
      assertEquals(-0.2107487454, s.getReal().doubleValue(), ε);
    }

  }

  public static void testNewtonInterpolation()
  {
    Complex    x       = Complex.newVector(5);
    Complex    y       = Complex.newVector(5);
    List<Real> xValues = x.realStream().collect(Collectors.toList());
    List<Real> yValues = x.imaginaryStream().collect(Collectors.toList());
    IntStream.range(0, 5).forEach(i ->
    {
      double xval = (double) i;
      x.get(i).getReal().set(xval);
      double yval = Math.cos(xval / 10.0);
      y.get(i).getReal().set(yval);
    });

    ComplexPolynomial interpolator = x.interpolateNewton(y, 3, 256, new ComplexPolynomial());
    Complex           coeffs       = interpolator.getCoeffs();

   
    // TODO: make the Real class so that it can be constructed with a Stream<Real>
  }


}
