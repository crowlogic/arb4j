package arb.functions.real;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.Function;

/**
 * A {@link Functional} represents a higher-order {@link Function} that maps
 * elements from a {@link Domain} K to functions F. The returned
 * {@link Function}s F themselves map from {@link Domain} D to codomain C.
 * 
 * <pre>
 * This can be expressed as:
 * 
 * K → F(D,C) where F(D,C) is the set of all functions D → C
 * </pre>
 * 
 * @param <K> The domain of this functional
 * @param <D> The domain of the function F that this functional returns
 * @param <C> The codomain of the function F that this functional returns
 * @param <F> The specific type of function that this functional returns, where
 *            F extends Function<? extends D, ? extends C>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public interface Functional<K, D, C, F extends Function<? extends D, ? extends C>> extends
                           Function<K, F>
{

}