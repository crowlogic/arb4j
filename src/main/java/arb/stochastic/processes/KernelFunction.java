package arb.stochastic.processes;

import arb.Field;
import arb.Pair;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface KernelFunction<K extends Field<? extends K>> extends
                               Function<Pair<K, K>, K>
{

}
