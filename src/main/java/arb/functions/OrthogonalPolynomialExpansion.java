package arb.functions;

import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalPolynomialExpansion<D, C, F extends Function<? extends D, ? extends C>,
              O extends OrthogonalPolynomialSequence<? extends D, ? extends C>> extends
                                              Expansion<D, C, F>
{

}
