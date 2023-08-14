package arb.functions;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * This interface models the mathematical concept of a FunctionSpace.
 * 
 * A FunctionSpace is a set of functions between two fixed sets (X and Y). When
 * the codomain set (Y) is a VectorSpace, the FunctionSpace can itself inherit
 * the structure of a VectorSpace. The operations of the VectorSpace are defined
 * pointwise:
 *
 * 1. Vector addition in the FunctionSpace is the pointwise addition of
 * functions. If f and g are functions in the FunctionSpace and x is an element
 * of the domain set X, the vector addition is defined as (f + g)(x) = f(x) +
 * g(x), where the "+" operation on the right-hand side is the vector addition
 * operation in the codomain VectorSpace Y.
 *
 * 2. Scalar multiplication in the FunctionSpace is pointwise scalar
 * multiplication. If c is a scalar, f is a function in the FunctionSpace, and x
 * is an element of the domain set X, the scalar multiplication is defined as
 * (cf)(x) = c * f(x), where "*" is the scalar multiplication operation in the
 * codomain VectorSpace Y.
 *
 * In this way, a FunctionSpace, which is a set of functions from X to Y, can
 * inherit the structure of a VectorSpace when Y is a VectorSpace.
 *
 * @param <X>  The type representing the domain set.
 * @param <Y>  The type representing the codomain set. This extends
 *             VectorSpace<F, VE>.
 * @param <F>  The type of the field over which the VectorSpace is defined. This
 *             should extend Field<F>.
 * @param <VE> The type of the elements in the VectorSpace.
 */
public interface FunctionSpace<X, Y extends VectorSpace<F, VE>, F extends Field<F>, VE> extends
                              VectorSpace<F, Function<X, Y>>
{
  /**
   * Adds two functions in the FunctionSpace.
   *
   * @param f1        The first function.
   * @param f2        The second function.
   * @param precision The number of bits of precision to use in the addition.
   * @param result    The resulting function.
   * @return The resulting FunctionSpace after the addition operation.
   */
  @Override
  public VectorSpace<F, Function<X, Y>>
         add(Function<X, Y> f1, Function<X, Y> f2, int precision, Function<X, Y> result);

  /**
   * Scales a function in the FunctionSpace by a scalar.
   *
   * @param f         The function to be scaled.
   * @param scalar    The scalar to multiply the function by.
   * @param precision The number of bits of precision to use in the scaling.
   * @param result    The resulting function.
   * @return The resulting FunctionSpace after the scaling operation.
   */
  @Override
  public VectorSpace<F, Function<X, Y>> scale(Function<X, Y> f, F scalar, int precision, Function<X, Y> result);

}
