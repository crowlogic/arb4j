package arb.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.TangentSpace;

/**
 * <pre>
 *  {@link SymplecticManifold}s are studied in the field of differential geometry, and
 * have important applications in classical mechanics and mathematical
 * physics, particularly in Hamiltonian mechanics and the study of phase spaces.
 * 
 * A symplectic manifold is a smooth manifold M equipped with a closed,
 * non-degenerate 2-form ω, called the symplectic form. Here's a quick overview
 * of the terms involved:
 * 
 * <b>Smooth manifold</b>: A smooth manifold is a topological space that locally looks
 * like Euclidean space (in the sense that it is homeomorphic to an open subset
 * of Euclidean space) and has a smooth structure, which is a maximal atlas of
 * smooth coordinate charts. These charts are compatible with each other in the
 * sense that the transition maps between charts are smooth functions.
 * 
 * <b>2-form</b>: A 2-form is a differential 2-form, which is a smooth, alternating,
 * and multilinear map that takes two tangent vectors and returns a scalar. It's
 * a generalization of the notion of a surface element in Euclidean space.
 * 
 * <b>Closed</b>: A 2-form ω is closed if its exterior derivative, dω, is zero. The
 * exterior derivative is an operation that generalizes the concept of a
 * differential in calculus.
 * 
 * <b>Non-degenerate</b>: A 2-form ω is non-degenerate if, for every non-zero tangent
 * vector v at a point in the manifold, there exists another tangent vector w
 * such that ω(v, w) ≠ 0.
 * 
 * A symplectic manifold has an even dimension, as the non-degeneracy condition
 * requires it. In the context of classical mechanics, a symplectic manifold
 * represents the {@link PhaseSpace} of a mechanical system, where the symplectic form
 * corresponds to the Poisson bracket, a fundamental structure that encodes the
 * dynamics of the system.
 * 
 * A symplectic manifold is necessarily a {@link DifferentiableManifold}. A
 * symplectic manifold is defined as a smooth manifold equipped with a closed,
 * non-degenerate 2-form called a symplectic form. The requirement that it be a
 * smooth manifold implies that it is differentiable. This means that the
 * manifold has a well-defined {@link TangentSpace} at each point and can be covered by
 * coordinate charts where the transition functions are differentiable. The
 * symplectic form, being a smooth differential form, further ensures that it
 * varies smoothly from point to point across the manifold.
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface SymplecticManifold<X extends Field<? extends X>> extends
                                   DifferentiableManifold<X>
{

}
