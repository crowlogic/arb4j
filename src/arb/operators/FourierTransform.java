package arb.operators;

import arb.*;
import arb.functions.*;
import arb.functions.complex.*;

/**
 * Compute the Fourier transform of a real-valued function (over a truncated
 * domain if the limits of integration include positive or negative infinity).
 * If the domain needs to be truncated then the remainder should be properly
 * accounted for in the result with a call to
 * {@link Real#addUncertainty(Magnitude)}
 * 
 * @see also {@link FastDFTScheme} for classes related to the Fast Fourier
 *      Transform
 * 
 * @param <F> the function from the reals to either the real or complex numbers
 *            ( or possibly more generally any number field, such as quaternions
 *            if/when they are implemented: see
 *            https://vixra.org/pdf/1511.0302v1.pdf )
 */
public class FourierTransform<F extends Function<Real, ?>> implements
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
