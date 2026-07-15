package arb.functions;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

public interface ComplexFunctional extends
                                   Functional<Complex, Complex, ComplexFunction>
{
  @SuppressWarnings("unchecked")
  public static <F extends ComplexFunction> ComplexFunctional express(Class<F> functionClass, String expression)
  {
    return Functional.express(Complex.class, ComplexFunction.class, ComplexFunctional.class, expression);
  }
}
