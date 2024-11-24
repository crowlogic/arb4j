package arb.functions.real;

import arb.functions.Function;

/*
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

/**
 * 
 * @param <K> domain
 * @param <F> the co-domain which is a subclass of {@link RealFunction}
 */
public interface RealFunctional<K, F extends RealFunction> extends
                               Function<K, F>
{

}