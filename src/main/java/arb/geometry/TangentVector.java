package arb.geometry;

import arb.Field;
import arb.differential.geometry.Surface;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TangentVector<F extends Field<? extends F>, VE> extends
                              Vector<F, VE>
{

}
