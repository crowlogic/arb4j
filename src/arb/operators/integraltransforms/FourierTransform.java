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
      try ( Complex exponent = new Complex(); Real y = new Real())
      {
        exponent.getImag()
                .π(integrandPrec)
                .mul(2, integrandPrec)
                .negate()
                .mul(ξ, integrandPrec)
                .mul(x, integrandPrec);

        return exponent.exp(integrandPrec, result)
                       .mul(f.evaluate(x, integrandOrder, integrandPrec, y), integrandPrec);
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

    Complex integrate = integrand.integrate(left,
                                            right,
                                            relativeAccuracyBitsGoal,
                                            absoluteUncertaintyTolerance,
                                            integrationOptions,
                                            prec,
                                            res);
    assert !integrate.getReal().isZero() : "real part of fourier transform at " + ξ + " is zero";
    return integrate;
  }

}
