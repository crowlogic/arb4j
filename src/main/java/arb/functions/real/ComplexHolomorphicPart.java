package arb.functions.real;

import arb.functions.ComplexToRealFunction;
import arb.functions.complex.ComplexFunction;

/**
 * An abstract base class for real functions derived from holomorphic functions
 * (i.e., complex differentiable functions). This class implements the
 * {@link RealFunction} interface and serves as a foundation for subclasses that
 * work with holomorphic functions.
 *
 * @param <F> A generic type that extends {@link ComplexFunction}
 */
public abstract class ComplexHolomorphicPart<F extends ComplexFunction> implements
                                            ComplexToRealFunction
{

  @Override
  public abstract String toString();

  public F f;

  public ComplexHolomorphicPart(F func)
  {
    this.f = func;
  }

}