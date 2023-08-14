package arb.operators.integraltransforms;

import arb.Complex;
import arb.Real;
import arb.functions.RealToComplexFunction;
import junit.framework.TestCase;

/**
 * <pre>
 * these tests should work to validate the implementation of the Mellin
 * transform on the two functions. Just keep in mind that testing mathematical
 * transformations like this can be tricky due to floating-point precision and
 * the numerical methods used to compute the transforms, so you may need to
 * adjust your TOLERANCE accordingly.
 * 
 * For further testing, you could add additional known Mellin transform pairs.
 * For example, the Mellin transform of 1/x^s is Gamma(s), the Mellin transform
 * of x^s is Gamma(-s), and so on.
 * 
 * Also, make sure to test edge cases and error cases, for example, providing
 * null or incorrect type parameters to the transform, to ensure your program
 * behaves correctly in those situations.
 * </pre>
 */
public class MellinTransformTest extends
                                 TestCase
{
  // Add more test methods for other known Mellin transform pairs

  private static final double TOLERANCE = 0.001; // tolerance for floating point comparisons

  public void testExponentialFunction()
  {
    RealToComplexFunction                  exponentialFunction = (t, order, prec, result) ->
                                                               {
                                                                 result.im().zero();
                                                                 t.neg().exp(prec, result.re());
                                                                 return result;
                                                               };

    MellinTransform<RealToComplexFunction> mellinTransform     = new MellinTransform<>(exponentialFunction);
    Complex                                result              = new Complex();
    Complex                                returnedResult      = mellinTransform.evaluate(new Real(2),
                                                                                          0,
                                                                                          128,
                                                                                          result);

    double                                 expected            = Math.exp(-2);
    assertEquals(expected, returnedResult.re().doubleValue(), TOLERANCE);
  }

  public void testPowerFunction()
  {
    int                                    n               = 3;

    RealToComplexFunction                  powerFunction   = (t, order, prec, result) ->
                                                           {
                                                             result.re().set(t.pow(n, prec));
                                                             result.im().zero();
                                                             return result;
                                                           };

    MellinTransform<RealToComplexFunction> mellinTransform = new MellinTransform<>(powerFunction);
    Complex                                result          = new Complex();
    Complex                                returnedResult  = mellinTransform.evaluate(new Real(2), 0, 128, result);

    double                                 expected        = Math.pow(2, -n - 1) * Math.exp(2);
    assertEquals(expected, returnedResult.re().doubleValue(), TOLERANCE);
  }

}
