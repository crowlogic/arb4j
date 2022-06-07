package arb.operators;

import arb.*;
import arb.functions.*;

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
public class FourierTransform<F extends Function<Real, ? extends Real>> implements
                             IntegralTransform
{
  private FloatInterval domain;
  private Real          a;
  private Real          b;

  public FourierTransform(F f, Real a, Real b)
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
    try ( Magnitude absErr = new Magnitude(); Complex tmp0 = new Complex(); Real tmp1 = new Real();
          Complex tmp2 = new Complex())
    {
      Function<Real, Complex> integrand = (x, integrandOrder, integrandPrec, y) ->
      {
        throw new UnsupportedOperationException("TODO: finish this after resting properly");
        // f.evaluate(x, integrandOrder, integrandPrec, y);
      //  tmp2.getImag().pi(integrandPrec);
//        return tmp2.mul(2, integrandPrec, tmp2)
//                   .neg(tmp2)
//                   .exp(integrandPrec, tmp2)
//                   .mul(x, integrandPrec, tmp0)
//                   .mul(t, integrandPrec, y);
      };
      absErr.set(Math.pow(2, -128));
      return integrand.integrate(a, b, prec, absErr, null, prec, w);
    }
  }

}
