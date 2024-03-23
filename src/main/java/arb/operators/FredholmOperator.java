package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * A Fredholm operator is a certain kind of integral operator from a complex
 * function space into itself, which has an associated Fredholm determinant
 * defined in terms of its spectrum.
 *
 * @param <F>   Field over which the vector spaces are defined.
 * @param <IN>  Type of input vector space.
 * @param <OUT> Type of output vector space.
 * @param <K>   Type of {@link SquareIntegrableKernel}
 */
public interface FredholmOperator<F extends Field<F>,
              IN extends VectorSpace<? extends F>,
              OUT extends VectorSpace<? extends F>,
              K extends SquareIntegrableKernel<F>> extends
                                 CompactOperator<F, IN, OUT>,
                                 IntegralOperator<F, IN, OUT, K>
{

}
