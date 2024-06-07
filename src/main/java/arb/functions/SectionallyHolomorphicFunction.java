package arb.functions;

import java.util.List;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.complex.MeromorphicFunction;

/**
 * Represents a sectionally holomorphic function in the complex k-plane.
 * <p>
 * A sectionally holomorphic {@link Function} is a function that is a HolomorphicFunction  holomorphic on each
 * sector of its domain in the complex k-plane, but may exhibit different
 * behaviors or have different expressions across the boundaries separating the
 * sectors. It is a type of meromorphic function, as it is holomorphic on its
 * domain except at a set of isolated singularities (the boundaries between the
 * sectors).
 * <p>
 * If the boundaries between the sectors are smooth (infinitely differentiable)
 * curves and the function and its derivatives match up smoothly across these
 * boundaries, then the sectionally holomorphic function can be holomorphic on
 * its entire domain.
 * <p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface SectionallyHolomorphicFunction extends
                                                MeromorphicFunction
{
  public List<HolomorphicFunction> sections();
}