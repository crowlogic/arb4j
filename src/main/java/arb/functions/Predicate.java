package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Represents a logical condition or predicate over a domain D, where the
 * function evaluates to a Boolean value.
 * 
 * TODO; methods for all the logical operations.. maybe extend
 * java.util.function.Predicate ?
 * 
 * @param <D> The domain type of the predicate.
 * @param <F> The function type extending Function with domain D and returning a
 *            {@link Boolean}.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Predicate<D, F extends Function<D, Boolean>> extends
                          Function<D, Boolean>
{
}
