package arb.topological.spaces;

import arb.functions.Function;
import arb.topological.Space;

/**
 * TODO: implement
 * 
 * a bundle is a generalization of a fiber bundle dropping the condition of a
 * local product structure. The requirement of a local product structure rests
 * on the bundle having a topology. Without this requirement, more general
 * objects can be considered bundles. For example, one can consider a bundle π:
 * E→ B with E and B sets. It is no longer true that the preimages π − 1 ( x )
 * {\displaystyle \pi ^{-1}(x)} {\displaystyle \pi ^{-1}(x)} must all look
 * alike, unlike fiber bundles where the fibers must all be isomorphic (in the
 * case of vector bundles) and homeomorphic.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Bundle_(mathematics)">Bundle@Wikipedia</a>
 * 
 * @param <E> total space
 * @param <B> base space
 * @param <P> projection map (function)
 */
public interface Bundle<E extends Space, B extends Space, P extends Function>
{

}
