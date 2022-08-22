package arb.mechanics.relativistic.special;

import arb.domains.Interval;
import arb.geometry.Manifold;
import arb.topological.Space;

/**
 * In mathematical physics, Minkowski space (or Minkowski spacetime)
 * (/mɪŋˈkɔːfski, -ˈkɒf-/[1]) is a combination of three-dimensional Euclidean
 * space and time into a four-dimensional {@link Manifold} where the spacetime
 * {@link Interval} between any two events is independent of the inertial frame
 * of reference in which they are recorded. Although initially developed by
 * mathematician Hermann Minkowski for Maxwell's equations of electromagnetism,
 * the mathematical structure of Minkowski spacetime was shown to be implied by
 * the postulates of special relativity.
 * 
 * Minkowski space is closely associated with Einstein's theories of special
 * relativity and general relativity and is the most common mathematical
 * structure on which special relativity is formulated. While the individual
 * components in Euclidean space and time may differ due to length contraction
 * and time dilation, in Minkowski spacetime, all frames of reference will agree
 * on the total distance in spacetime between events. Because it treats time
 * differently than it treats the 3 spatial dimensions, Minkowski space differs
 * from four-dimensional Euclidean space.
 * 
 * @author crow
 *
 * @param <X>
 */
public interface MinkowskiSpace<X> extends
                               Space<X>
{

}
