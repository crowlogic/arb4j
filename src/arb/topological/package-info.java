/**
 * Topology (from the Greek words τόπος, 'place, location', and λόγος, 'study')
 * is concerned with the properties of geometric {@link java.lang.Object}s that
 * are preserved under continuous
 * {@link arb.topology.transformations.Transformation}s, such as
 * {@link arb.topology.transformations.Stretching},
 * {@link arb.topology.transformations.Twisting},
 * {@link arb.topology.transformations.Crumpling}, and
 * {@link arb.topology.transformations.Bending}; that is, without closing holes,
 * opening holes, tearing, gluing, or passing through itself.
 * 
 * A {@link arb.spaces.TopologicalSpace} is a set endowed with a structure, called a
 * {@link arb.topological.Topology}, which allows defining continuous
 * {@link arb.topology.transformations.Transformation} of subspaces, and, more
 * generally, all kinds of continuity. Euclidean space, and, more generally,
 * {@link arb.topological.spaces.MetricSpace} are examples of a
 * {@link arb.spaces.TopologicalSpace}, as any distance or metric defines a
 * {@link arb.topological.Topology}. The transformations that are considered in
 * topology are {@link arb.topology.transformations.Homeomorphism} and
 * {@link arb.differential.homotopy.Homotopy}s. A property that is invariant
 * under such transformations is a topological property. Basic examples of
 * topological properties are: the {@link arb.measure.Dimension}, which allows
 * distinguishing between a {@link arb.geometry.Line} and a
 * {@link arb.geometry.surfaces.Surface}; compactness, which allows
 * distinguishing between a {@link arb.geometry.Line} and a
 * {@link arb.curves.Circle}; connectedness, which allows distinguishing a
 * circle from two non-intersecting circles.
 */
package arb.topological;