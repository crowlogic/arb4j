package arb.functions;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

public interface ComplexFunctional extends
                                   Functional<Complex, Complex, ComplexFunction>
{
  public static ComplexFunctional express(String expression)
  {
    return Functional.express(Complex.class,
                              ComplexFunction.class,
                              ComplexFunctional.class,
                              expression);
  }
}
