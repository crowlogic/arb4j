package arb.functions.polynomials.orthogonal;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.PolynomialSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalPolynomialSequence<R, E> extends
                                             OrthogonalPolynomialBasis<R, E>,
                                             PolynomialSequence<R, E>
{

}