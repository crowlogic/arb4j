package arb.operators;

import arb.*;
import arb.functions.*;
import arb.functions.complex.*;
import arb.functions.real.*;

public class FourierTransform<F extends RealFunction> implements
                             IntegralTransform
{

  public int                relativeAccuracyBitsGoal     = 128;
  public final Magnitude    absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -30));
  public final Real         right                        = new Real().set("100", 128);
  public final Real         left                         = new Real().set("-100", 128);
  public IntegrationOptions integrationOptions           = new IntegrationOptions();

  public FourierTransform(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Real ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;

    /**
     * f(x)e^(-i2πξx)
     */
    RealToComplexFunction integrand = (x, integrandOrder, integrandPrec, result) ->
    {
      try ( Complex exponent = new Complex(); Real y = new Real())
      {
        Real expi = exponent.getImag();
        expi.pi(integrandPrec)
            .mul(2, integrandPrec, expi)
            .negate(expi)
            .mul(ξ, integrandPrec, expi)
            .mul(x, integrandPrec, expi);
        exponent.exp(integrandPrec, result)
                .mul(f.evaluate(x, integrandOrder, integrandPrec, y), integrandPrec, result);
        return result;
      }
    };

    return integrand.integrate(left,
                               right,
                               relativeAccuracyBitsGoal,
                               absoluteUncertaintyTolerance,
                               integrationOptions,
                               prec,
                               res);
  }


}
