package arb.functions.polynomials.orthogonal;

import arb.GenericRing;
import arb.GenericRingPolynomial;
import arb.arblib;
import junit.framework.TestCase;

/**
 * Sanity checks for the ring-parameterized OPS moment functional.
 *
 * The Hermite case: with moments {@code m(k) = (k−1)!!} for even {@code k},
 * zero for odd {@code k}, the OPS is the probabilist Hermite polynomials with
 * {@code α(n) = 0} and {@code β(n) = n}. We supply those moments directly as
 * complex ball elements and verify the recurrence coefficients agree.
 */
public class RingOrthogonalPolynomialMomentFunctionalTest extends
                                                          TestCase
{

  /**
   * (k−1)!! for k ≥ 0, with the convention (−1)!! := 1; odd k returns 0.
   */
  private static long doubleFactorialOddProduct(int k)
  {
    if (k == 0) return 1L;
    if ((k % 2) != 0) return 0L;
    long acc = 1L;
    for (int i = k - 1; i >= 1; i -= 2) acc *= i;
    return acc;
  }

  /**
   * Gaussian moment functional over the complex ball ring at the requested
   * precision. Each m(k) is the integer (k−1)!! for even k, zero for odd.
   */
  public void testHermiteRecurrenceOverComplexBalls()
  {
    GenericRing ring = GenericRing.complexBalls(128);

    RingOrthogonalPolynomialMomentFunctional.MomentSequence<Object> moments =
        (int k, GenericRingPolynomial result) -> {
          long mk = doubleFactorialOddProduct(k);
          arblib.gr_poly_zero(result, ring);
          arblib.gr_poly_set_coeff_si(result, 0, (int) mk, ring);
          return result;
        };

    try ( RingOrthogonalPolynomialMomentFunctional<Object> ops =
            new RingOrthogonalPolynomialMomentFunctional<>(ring, moments) )
    {
      ops.warmTo(4);
      for (int n = 0; n <= 4; n++)
      {
        GenericRingPolynomial alpha = ops.alpha(n);
        GenericRingPolynomial beta  = ops.beta(n);
        assertNotNull("α(" + n + ") must be populated", alpha);
        assertNotNull("β(" + n + ") must be populated", beta);
      }
    }
  }

  /**
   * Construct the rational-functions ring and verify the OPS can be built
   * over it without throwing — the algebra of the recurrence carries through
   * the field unchanged.
   */
  public void testOpsOverComplexRationalFunctionField()
  {
    GenericRing complex   = GenericRing.complexBalls(128);
    GenericRing polyOverC = GenericRing.polynomialsOver(complex);
    GenericRing field     = GenericRing.fractionFieldOf(polyOverC);

    RingOrthogonalPolynomialMomentFunctional.MomentSequence<Object> moments =
        (int k, GenericRingPolynomial result) -> {
          long mk = doubleFactorialOddProduct(k);
          arblib.gr_poly_zero(result, field);
          arblib.gr_poly_set_coeff_si(result, 0, (int) mk, field);
          return result;
        };

    try ( RingOrthogonalPolynomialMomentFunctional<Object> ops =
            new RingOrthogonalPolynomialMomentFunctional<>(field, moments) )
    {
      ops.warmTo(2);
      for (int n = 0; n <= 2; n++)
      {
        GenericRingPolynomial alpha = ops.alpha(n);
        GenericRingPolynomial beta  = ops.beta(n);
        assertNotNull("α(" + n + ") must be populated", alpha);
        assertNotNull("β(" + n + ") must be populated", beta);
      }
    }
  }
}
