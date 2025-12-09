package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.geometry.Line;
import arb.space.topological.EuclideanSpace;
import arb.space.topological.MetricSpace;

/**
 * <pre>
 * {@link OpenSet}s are generalizations of open {@link FloatInterval}s of the
 * {@link Real} {@link Line}.
 * 
 * In a {@link MetricSpace} (a set along with a distance defined between any two
 * points), open sets are the sets that, with every point Pfunc, contain all
 * points that are sufficiently near to Pfunc (that is, all points whose
 * distance to Pfunc is less than some value depending on Pfunc).
 * 
 * More generally, one defines open sets as the members of a given collection of
 * subsets of a given set, a collection that has the property of containing
 * every union of its members, every finite intersection of its members, the
 * empty set, and the whole set itself. A set in which such a collection is
 * given is called a topological space, and the collection is called a topology.
 * These conditions are very loose, and allow enormous flexibility in the choice
 * of open sets. For example, every subset can be open (the discrete topology),
 * or no set can be open except the space itself and the empty set (the
 * indiscrete topology).
 * 
 * In practice, however, open sets are usually chosen to provide a notion of
 * nearness that is similar to that of metric spaces, without having a notion of
 * distance defined. In particular, a topology allows defining properties such
 * as continuity, connectedness, and compactness, which were originally defined
 * by means of a distance.
 * 
 * The most common case of a topology without any distance is given by
 * manifolds, which are topological spaces that, near each point, resemble an
 * open set of a {@link EuclideanSpace}, but on which no distance is defined in
 * general. Less intuitive topologies are used in other branches of mathematics;
 * for example, the Zariski topology, which is fundamental in algebraic geometry
 * and scheme theory.
 * </pre>
 * 
 * @param <X>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OpenSet<X>
{

}
