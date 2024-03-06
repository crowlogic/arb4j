package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Generate recurrence coefficients.
 * 
 * @param k highest degree of the polynomials used in the recurrence
 * @return an array of three coefficients such that \( P_{k+1}(x) = (a[0] + a[1]
 *         x) P_k(x) - a[2] P_{k-1}(x) \)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public interface RecurrenceCoefficientsGenerator
{
  Real generate(int k);
}