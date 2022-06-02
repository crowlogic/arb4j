package arb.operators;

import arb.*;
import arb.functions.complex.ComplexFunction;

/**
 * TODO: check out the FastDFT scheme instead of this
 * 
 * @author crow
 *
 * @param <F>
 */
public class FourierTransform<F extends ComplexFunction> implements
                             IntegralTransform
{
  private FloatInterval domain;
  private Complex       a;
  private Complex       b;

  public FourierTransform(F f, Complex a, Complex b)
  {
    this.f = f;
    this.a = a;
    this.b = b;
  }

  F f;

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex w)
  {
    assert prec > 0;
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
      return integrand.integrate(a, b, prec, absErr, null, prec, w);
    }
  }

}
