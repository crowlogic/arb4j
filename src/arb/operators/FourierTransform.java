package arb.operators;

import arb.*;
import arb.functions.*;
import arb.functions.real.*;
import arb.stochastic.*;

public class FourierTransform<F extends Function<Real, Real>> implements
                             IntegralTransform
{

  public int                relativeAccuracyBitsGoal     = 128;
  public final Magnitude    absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -30));
  public final Real         right                        = new Real("100",
                                                                    128);
  public final Real         left                         = new Real("-100",
                                                                    128);
  public IntegrationOptions integrationOptions           = new IntegrationOptions();
  private boolean           inverse;

  public FourierTransform(F f, boolean inverse)
  {
    this.f       = f;
    this.inverse = inverse;
  }

  F f;

  @Override
  public Complex evaluate(Complex ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;
    assert ξ.getImag().isZero();
    
    /**
     * f(x)*e^(-i*2*π*ξ*x) or if inverse then f(x)*e^(i*2*π*ξ*x)
     */
    RealToComplexFunction integrand = (x, integrandOrder, integrandPrec, result) ->
    {
      try ( Complex exponent = new Complex(); Real y = new Real(); Real q = new Real(); )
      {
        Real expi = exponent.getImag();
        expi.π(integrandPrec).mul(2, integrandPrec, expi);
        if (!inverse)
        {
          expi.negate(expi);
        }
        expi.mul(ξ.getReal(), integrandPrec, expi).mul(x, integrandPrec, expi);
        q.set(x);
        Real tmp = f.evaluate(q, integrandOrder, integrandPrec, y);
        exponent.exp(integrandPrec, result)
                .mul(tmp, integrandPrec, result);
        return result;
      }
    };

    integrationOptions.verbose = RealFunction.verbose;

    return integrand.integrate(left,
                               right,
                               relativeAccuracyBitsGoal,
                               absoluteUncertaintyTolerance,
                               integrationOptions,
                               prec,
                               res);
  }

}
