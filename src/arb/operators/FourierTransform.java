package arb.operators;

import arb.Complex;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

public class FourierTransform<R extends RealFunction,C extends ComplexFunction> implements
                              IntegralTransform
{
  public FourierTransform(ComplexFunction f)
  {
    this.f = f;
  }

  ComplexFunction f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    throw new UnsupportedOperationException("TODO: do the integration");
  }

}
