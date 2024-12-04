package arb.functions;

import arb.OrthonormalBasis;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthonormalExpansion<D, C, O extends OrthonormalBasis<? extends D, ? extends C>> extends
                                     Expansion<D, C, Function<? extends D, ? extends C>>
{

}
