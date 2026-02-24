package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("hiding")
public interface BivariateFunction<D, R, G extends Function<? extends D, ? extends R>> extends
                                  Function<D, G>
{

}
