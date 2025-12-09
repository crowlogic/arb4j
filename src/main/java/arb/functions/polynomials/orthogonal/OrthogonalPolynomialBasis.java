package arb.functions.polynomials.orthogonal;

import arb.OrthogonalBasis;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.PolynomialBasis;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalPolynomialBasis<X , E> extends
                                          OrthogonalBasis<X, E>,
                                          PolynomialBasis<X, E>
{

}
