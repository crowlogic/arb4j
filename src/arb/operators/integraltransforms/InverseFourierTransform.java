package arb.operators.integraltransforms;

import arb.Complex;
import arb.IntegrationOptions;
import arb.Magnitude;
import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

public class InverseFourierTransform<F extends RealToComplexFunction> implements
                                    RealFunction
{

  public int                relativeAccuracyBitsGoal     = 128;
  public final Magnitude    absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -30));
  public final Real         right                        = new Real("100",
                                                                    128);
  public final Real         left                         = new Real("-100",
                                                                    128);
  public IntegrationOptions integrationOptions           = new IntegrationOptions();

  public InverseFourierTransform(F f)
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
      try ( Complex y = new Complex(); Complex exponent = new Complex();)
      {
        exponent.getImag().π(integrandPrec);
        exponent.mul(2, integrandPrec);

        exponent.mul(ξ, integrandPrec).mul(x, integrandPrec);
        f.evaluate(x, integrandOrder, integrandPrec, y);
        exponent.exp(integrandPrec).mul(y, integrandPrec, result);

        return result;
      }
    }

  }

  @Override
  public Real evaluate(Real ξ, int order, int prec, Real res)
  {
    order = Math.max(1, order);
    assert order < 2;

    /**
     * f(x)e^(-i2πξx)
     */
    Integrand integrand = new Integrand(ξ);

    integrationOptions.verbose = RealFunction.verbose;

    try ( Complex complexResult = new Complex())
    {
      integrand.integrate(left,
                          right,
                          relativeAccuracyBitsGoal,
                          absoluteUncertaintyTolerance,
                          integrationOptions,
                          prec,
                          complexResult);
      assert Math.abs(complexResult.getImag()
                                   .doubleValue()) < Math.pow(10,
                                                              -30) : "imaginary part of inverse fourier transform should be 0. inv="
                                                                            + complexResult;
      return complexResult.getReal();
    }
  }

}
