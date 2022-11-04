package arb.topology.transformations;

import arb.annotations.Homeomorphic;
import arb.geometry.curves.Circle;
import arb.geometry.surfaces.Sphere;
import arb.geometry.surfaces.Torus;

/**
 * A homeomorphism, topological isomorphism, or bicontinuous function is a
 * continuous function between topological spaces that has a continuous inverse
 * function.
 * 
 * Homeomorphisms are the isomorphisms in the category of topological
 * spaces—that is, they are the mappings that preserve all the topological
 * properties of a given space. Two spaces with a homeomorphism between them are
 * called homeomorphic, and from a topological viewpoint they are the same. The
 * word homeomorphism comes from the Greek words ὅμοιος (homoios) = similar or
 * same and μορφή (morphē) = shape or form, introduced to mathematics by Henri
 * Poincaré in 1895.
 * 
 * Very roughly speaking, a topological space is a geometric object, and the
 * homeomorphism is a continuous {@link Stretching} and {@link Bending} of the
 * object into a new shape. Thus, a square and a {@link Circle} are homeomorphic
 * to each other, but a {@link Sphere} and a {@link Torus} are not.
 * 
 * However, this description can be misleading because Some continuous
 * deformations are not homeomorphisms, such as the deformation of a line into a
 * point and other homeomorphisms are not continuous deformations, such as the
 * homeomorphism between a trefoil knot and a {@link Circle}.
 * 
 * An often-repeated mathematical joke is that a topologists cannot tell the
 * difference between a coffee cup and a donut since a sufficiently flexible
 * donut could be reshaped to the form of a coffee cup by creating a dimple and
 * progressively enlarging it without affecting the the donut hole in the cup's
 * handle.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Homeomorphism">Homeomorphism@Wikipedia</a>
 */
@Homeomorphic
public interface Homeomorphism extends
                               Transformation,
                               Isomorphism
{

}
