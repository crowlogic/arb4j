package arb.space.topological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * TODO: implement
 * 
 * a bundle is a generalization of a {@link FiberBundle} dropping the condition
 * of a local product structure. The requirement of a local product structure
 * rests on the bundle having a {@link Topology}. Without this requirement, more
 * general objects can be considered bundles. For example, one can consider a
 * bundle π: E→ B with E and B sets. It is no longer true that the preimages π −
 * 1 ( x ) {\displaystyle \pi ^{-1}(x)} {\displaystyle \pi ^{-1}(x)} must all
 * look alike, unlike {@link FiberBundle} where the fibers must all be
 * {@link Isomorphic} (in the case of vector bundles) and homeomorphic.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Bundle_(mathematics)">Bundle@Wikipedia</a>
 * 
 * @param <E>     total space
 * @param <B>     base space
 * @param <Pfunc> projection map (function)
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Bundle<X, E extends TopologicalSpace<? extends X>, B extends TopologicalSpace<? extends X>, P extends Function<? extends E, ? extends B>>
{

}
