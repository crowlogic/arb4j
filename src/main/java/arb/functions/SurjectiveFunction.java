package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.annotations.Surjective;

/**
 * A function f : A -> B is surjective or onto or a surjection if f A = B. I.e.
 * f can return any value in B. This means that its {image} is its {codomain}
 * 
 * @param <D> domain
 * @param <C> codomain
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Surjective
public interface SurjectiveFunction<D, C> extends
                                   Function<D, C>
{

}
