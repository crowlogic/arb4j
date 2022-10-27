package arb.operators;

import arb.Complex;
import arb.IntegrationOptions;
import arb.Magnitude;
import arb.Real;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

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

  public class Integrand implements
                         RealToComplexFunction
  {

    public Integrand(Complex ξ)
    {
      super();
      this.ξ = ξ;
    }

    private Complex ξ;

    @Override
    public Complex evaluate(Real x, int integrandOrder, int integrandPrec, Complex result)
    {
      try ( Complex exponent = new Complex(); Real y = new Real(); Real q = new Real();)
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
        exponent.exp(integrandPrec, result).mul(tmp, integrandPrec, result);
        return result;
      }
    }

  }

  @Override
  public Complex evaluate(Complex ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;
    assert ξ.getImag().isZero();

    /**
     * f(x)e^(-i2πξx) or if inverse then f(x)e^(i2πξx)
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
