package arb.operators.integraltransforms;

import arb.Complex;
import arb.IntegrationOptions;
import arb.Magnitude;
import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

public class FourierTransform<F extends RealFunction> implements
                             RealToComplexFunction
{

  public int                relativeAccuracyBitsGoal     = 128;
  public final Magnitude    absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -30));
  public final Real         right                        = new Real("100",
                                                                    128);
  public final Real         left                         = new Real("-100",
                                                                    128);
  public IntegrationOptions integrationOptions           = new IntegrationOptions();

  public FourierTransform(F f)
  {
    this.f = f;
  }

  F f;

  public class Integrand implements
                         RealToComplexFunction
  {

    public Integrand(Real ξ)
    {
      super();
      this.ξ = ξ;
    }

    private Real ξ;

    @Override
    public Complex evaluate(Real x, int integrandOrder, int integrandPrec, Complex result)
    {
      try ( Complex exponent = new Complex(); Real y = new Real(); Real q = new Real();)
      {
        Real expi = exponent.getImag();
        expi.π(integrandPrec).mul(2, integrandPrec, expi);

        expi.negate(expi);

        expi.mul(ξ, integrandPrec, expi).mul(x, integrandPrec, expi);
        q.set(x);
        Real tmp = f.evaluate(q, integrandOrder, integrandPrec, y);
        exponent.exp(integrandPrec, result).mul(tmp, integrandPrec, result);
        return result;
      }
    }

  }

  @Override
  public Complex evaluate(Real ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;

    /**
     * f(x)e^(-i2πξx)
     */
    Integrand integrand = new Integrand(ξ);

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
