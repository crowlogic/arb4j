package arb.operators;

import arb.*;
import arb.functions.*;

public class InverseFourierTransform<F extends RealToComplexFunction> implements
                                    ComplexToRealFunction
{
  private static final int       relativeAccuracyBitsGoal     = 128;
  private static final Magnitude absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -30));
  private static final Real      right                        = new Real().set("-100",128);
  private static final Real      left                         = new Real().set("100",128);

  public InverseFourierTransform(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Real evaluate(Complex ξ, int order, int prec, Real res)
  {
    order = Math.max(1, order);
    assert order < 2;

    /**
     * f(x)e^(i2πξx)
     */
    RealToComplexFunction integrand = new InverseFourierKernel<F>(f,
                                                                  ξ);
    try ( Complex q = new Complex())
    {
      return res.set(integrand.integrate(left,
                                         right,
                                         relativeAccuracyBitsGoal,
                                         absoluteUncertaintyTolerance,
                                         null,
                                         prec,
                                         q)
                              .getReal());
    }

  }

}
