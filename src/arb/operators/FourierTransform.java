package arb.operators;

import arb.*;
import arb.functions.complex.ComplexFunction;

public class FourierTransform implements
                              IntegralTransform
{
  public FourierTransform(ComplexFunction f)
  {
    this.f = f;
  }

  ComplexFunction f;

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex w)
  {
    try ( Magnitude absErr = new Magnitude(); Complex c = new Complex())
    {
      ComplexFunction integrand = (x, integrandOrder, integrandPrec, y) ->
      {
        f.evaluate(x, integrandOrder, integrandPrec, y);
        c.getImag().pi(integrandPrec);
        return c.mul(2, integrandPrec, c)
                .neg(c)
                .exp(integrandPrec, c)
                .mul(x, integrandPrec, y)
                .mul(t, integrandPrec, y);
      };
      absErr.set(Math.pow(2, -128));
      return integrand.integrate(Constants.negInf, Constants.posInf, order, absErr, null, prec, w);
    }
  }

}
