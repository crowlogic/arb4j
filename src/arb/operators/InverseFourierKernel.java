package arb.operators;

import arb.*;
import arb.functions.*;

public final class InverseFourierKernel<F extends RealToComplexFunction> implements
                                       RealToComplexFunction
{
  /**
   * 
   */
  private final F       fourierTransform;
  private final Complex ξ;

  public InverseFourierKernel(F fourierTransform, Complex ξ)
  {
    this.fourierTransform = fourierTransform;
    this.ξ                = ξ;
  }

  @Override
  public Complex evaluate(Real x, int order, int prec, Complex res)
  {

    try ( Complex exponent = new Complex(); Complex y = new Complex();)
    {
      Real expi = exponent.getImag();
      expi.pi(prec).mul(2, prec, expi);
      exponent.mul(ξ, prec, exponent).mul(x, prec, exponent);
      exponent.exp(prec, res).mul(fourierTransform.evaluate(x, order, prec, y), prec, res);
      return res;
    }

  }
}