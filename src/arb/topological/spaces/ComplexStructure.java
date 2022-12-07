package arb.topological.spaces;

import arb.geometry.Manifold;
import arb.groups.AutomorphismGroup;
import arb.topology.transformations.Automorphism;

/**
 * a complex structure on a {@link RealVectorSpace} V is an {@link Automorphism}
 * of V that squares to the minus identity, −I. Such a structure on V allows one
 * to define multiplication by complex scalars in a canonical fashion so as to
 * regard V as a {@link ComplexVectorSpace}.
 * 
 * Every complex vector space can be equipped with a compatible complex
 * structure, however, there is in general no canonical such structure.
 * 
 * Complex structures have applications in representation theory as well as in
 * complex geometry where they play an essential role in the definition of
 * almost complex manifolds, by contrast to complex manifolds.
 * 
 * The term "complex structure" often refers to this structure on
 * {@link Manifold}s
 * 
 * The more specific term "linear complex structure" refers instead to a
 * structure on {@link VectorSpace}, it may be called a linear complex
 * structure.
 *
 * 
 * @param <V>
 */
public interface ComplexStructure<V extends RealVectorSpace> extends
                                 Automorphism<V>
{

}
