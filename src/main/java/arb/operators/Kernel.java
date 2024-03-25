package arb.operators;

import arb.Field;
import arb.functions.Function;

/**
 * The kernel function is a function of two variables used in the integral
 * transform. In the context of integral operators, a kernel is indeed a
 * function that defines the nature of the operator.
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
 *
 * @param <X>
 */
public interface Kernel<X extends Field<? extends X>> extends
                       Function<X, X>
{

}
