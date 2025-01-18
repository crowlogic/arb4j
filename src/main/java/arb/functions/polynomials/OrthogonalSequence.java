package arb.functions.polynomials;

import arb.OrthogonalBasis;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.Sequence;

/**
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalSequence<X, E> extends
                                   OrthogonalBasis<X, E>,
                                   Sequence<E>
{

}
