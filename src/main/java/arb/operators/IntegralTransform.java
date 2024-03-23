package arb.operators;

import arb.Field;
import arb.functions.Function;

/**
 * The IntegralTransform interface represents an integral transform, which is a
 * function that maps one function space to another through integration against
 * a kernel function.
 *
 * @param <F> the type of the field elements
 * @param <VE> the type of the vector elements
 */
public interface IntegralTransform<F extends Field<F>> extends
                                  Function<F, F>,
                                  LinearOperator<F>
{
  /**
   * Gets the kernel function for this integral transform. The kernel function
   * characterizes the integral transform and is a function of two variables.
   *
   * @return the kernel function
   */
  Function<F,F> getKernel();

}
