package arb.operators;

import arb.Field;
import arb.functions.Function;
import arb.space.topological.VectorSpace;

/**
 * Integral operators are a specific type of operator, which transform a
 * function into another function via integration against a fixed function
 * (kernel). The kernel function defines the integral operator's properties.
 *
 * @param <F>   Field over which the vector spaces are defined.
 * @param <IN>  Type of input vector space.
 * @param <OUT> Type of output vector space.
 * @param <K>   Type of kernel {@link Function}
 */
public interface IntegralOperator<F extends Field<F>,
              IN extends VectorSpace<? extends F>,
              OUT extends VectorSpace<? extends F>,
              K extends Kernel<F>> extends
                                 LinearOperator<F>
{
  /**
   * Access the kernel function to be used by this operator. The kernel function
   * is a function of two variables used in the integral transform. In the context
   * of integral operators, a kernel is indeed a function that defines the nature
   * of the operator.
   * 
   * This is a mathematical concept used across multiple fields, including
   * functional analysis and operator theory. The kernel function often represent
   * something akin to an inner product or a covariance in the space you're
   * operating in.
   * 
   * In the context of Gaussian processes , the term "kernel" is also used to
   * refer to what's technically called a "covariance function". This is a
   * function that defines the covariance or "similarity" between different points
   * in your space. This is a somewhat different context than the one of integral
   * operators, though there are connections between these fields.
   *
   * @return the kernel
   */
  K kernel();
}
