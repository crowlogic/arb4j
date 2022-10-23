package arb.topological.spaces;

import arb.Complex;
import arb.Field;
import arb.algebraic.topology.Homomorphism;
import arb.functions.Function;

/**
 * A {@link BilinearForm} is a bilinear map V × V → K on a {@link VectorSpace} V
 * (the elements of which are called vectors) over a {@link Field} K (the
 * elements of which are called scalars). In other words, a bilinear form is a
 * {@link Function} B : V × V → K that is linear in each argument separately:
 * 
 * B(u + v, w) = B(u, w) + B(v, w) <br>
 * B(λu, v) = λB(u, v) B(u, v + w) = B(u, v) + B(u, w) <br>
 * B(u, λv) = λB(u, v) <br>
 * 
 * The dot product on R^n is an example of a bilinear form.
 * 
 * The definition of a bilinear form can be extended to include modules over a
 * ring, with linear maps replaced by module {@link Homomorphism}.
 * 
 * When K is the {@link Field} of {@link Complex} numbers C, one is often more
 * interested in sesquilinear forms, which are similar to bilinear forms but are
 * conjugate linear in one argument.
 * 
 *
 */
public interface BilinearForm<V extends VectorSpace<K>, K extends Field<?>> extends
                             Function<CartesianProduct<V, V>, K>
{

}
