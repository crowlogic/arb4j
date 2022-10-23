package arb.topological.spaces;

import arb.Field;

/**
 * a {@link SesquilinearForm} is a generalization of a {@link BilinearForm}
 * that, in turn, is a generalization of the concept of the dot product of
 * {@link EuclideanSpace}.
 * 
 * A bilinear form is linear in each of its arguments, but a sesquilinear form
 * allows one of the arguments to be "twisted" in a semilinear manner, thus the
 * name; which originates from the Latin numerical prefix sesqui- meaning
 * <b>"one and a half"</b>
 * 
 * The basic concept of the dot product – producing a scalar from a pair of
 * vectors – can be generalized by allowing a broader range of scalar values
 * and, perhaps simultaneously, by widening the definition of a vector.
 * 
 * A motivating special case is a sesquilinear form on a
 * {@link ComplexVectorSpace}, V.
 * 
 * This is a map V × V → C that is linear in one argument and "twists" the
 * linearity of the other argument by complex conjugation (referred to as being
 * antilinear in the other argument).
 * 
 * This case arises naturally in mathematical physics applications.
 * 
 * Another important case allows the scalars to come from any field and the
 * twist is provided by a field automorphism.
 * 
 * @author crow
 *
 * @param <V>
 * @param <K>
 */
public interface SesquilinearForm<V extends VectorSpace<K>, K extends Field<?>> extends
                                 BilinearForm<V, K>
{

}
