package arb.differential.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.geometry.DifferentiableManifold;
import arb.space.topological.EuclideanSpace;

/**
 * Given a differentiable manifold M M, a vector field on M M is an assignment
 * of a tangent vector to each point in M M.[2] More precisely, a vector field F
 * F is a mapping from M M into the tangent bundle T M TM so that p ∘ F p\circ F
 * is the identity mapping where p p denotes the projection from T M TM to M M.
 * In other words, a vector field is a section of the tangent bundle.
 * 
 * An alternative definition: A smooth vector field X X on a manifold M M is a
 * linear map X : C^∞( M ) → C^∞ ( M ) such that X is a derivation: X ( f g ) =
 * f X ( g ) + X ( f ) g for all f , g ∈ C ∞ ( M ) .[3]
 * 
 * If the manifold M M is smooth or analytic—that is, the change of coordinates
 * is smooth (analytic)—then one can make sense of the notion of smooth
 * (analytic) vector fields. The collection of all smooth vector fields on a
 * smooth manifold M is often denoted by Γ ( T M ) or C ∞ ( M , T M )
 * (especially when thinking of vector fields as sections); the collection of
 * all smooth vector fields is also denoted by X ( M ) (a fraktur "X").
 * 
 * @param <M>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface VectorField<X extends Field<X>, M extends DifferentiableManifold<X>> extends
                            Function<M, EuclideanSpace<X>>
{

}
