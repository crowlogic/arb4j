package arb.geometry;

import arb.Field;
import arb.geometry.curves.Curve;
import arb.geometry.surfaces.Surface;
import arb.space.topological.EuclideanSpace;
import arb.space.topological.TangentSpace;

/**
 * A {@link TangentVector} is a {@link Vector} that is tangent to a
 * {@link Curve} or {@link Surface} at a given point. Tangent vectors are
 * described in the differential geometry of curves in {@link EuclideanSpace}.
 * More generally, tangent vectors are elements of a {@link TangentSpace} of a
 * {@link DifferentiableManifold}.
 * 
 * This interface is parameterized over a field F that extends Field (the field
 * of scalars), and a type VE representing vector elements.
 *
 * @param <F>  The type of the field over which the vector space is defined.
 *             This should extend the {@link Field} interface.
 * @param <VE> The type of the elements in the vector.
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Tangent_vector">TangentVector@Wikipedia</a>
 */
public interface TangentVector<F extends Field<F>, VE> extends
                              Vector<F, VE>
{

}
