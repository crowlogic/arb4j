package arb.operators;

import arb.Field;

/**
 * A Fredholm operator is a certain kind of integral operator from a complex
 * function space into itself, which has an associated Fredholm determinant
 * defined in terms of its spectrum.
 *
 * @param <F> Field over which the vector spaces are defined.
 * 
 * @param <K> Type of {@link SquareIntegrableKernel}
 */
public interface FredholmOperator<F extends Field<F>, K extends SquareIntegrableKernel<F>> extends
                                 CompactOperator<F>,
                                 IntegralOperator<F, K>
{

}
