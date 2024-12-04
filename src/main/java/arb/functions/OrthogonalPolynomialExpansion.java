package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * @param <O> the type of {@link OrthogonalPolynomialSequence} that will be used
 *            to
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalPolynomialExpansion<D, C, F extends Function<? extends D, ? extends C>,
              O extends OrthogonalPolynomialSequence<? extends D, ? extends C>>
{

}
