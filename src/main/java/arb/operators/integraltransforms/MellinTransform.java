package arb.operators.integraltransforms;

import arb.Complex;
import arb.IntegrationOptions;
import arb.Real;
import arb.functions.RealToComplexFunction;

public class MellinTransform<F extends RealToComplexFunction> extends
                            AbstractIntegralTransform<F, Real>
{
  final static int bits = 128;

  public MellinTransform(F f)
  {
    super(f);
  }

  final RealToComplexFunction kernel = new RealToComplexFunction()
  {
    @Override
    public Complex evaluate(Real s, int order, int bits, Complex result)
    {
      result.re().set(s);
      result.sub(1, bits);
      return result;
    }
  };

  @Override
  public Complex evaluate(Real s, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;

    RealToComplexFunction integrand = new RealToComplexFunction()
                                    {
                                      @Override
                                      public Complex
                                             evaluate(Real t, int integrandOrder, int integrandPrec, Complex result)
                                      {
                                        try ( Complex a = new Complex())
                                        {
                                          kernel.evaluate(t, integrandOrder, integrandPrec, a);
                                          a.exp(integrandPrec);
                                          a.mul(f.evaluate(t, integrandOrder, integrandPrec, result),
                                                integrandPrec,
                                                result);
                                          return result;
                                        }
                                      };
                                    };

    IntegrationOptions    opts      = new IntegrationOptions();
    return integrand.integrate(left, right, relativeAccuracyBitsGoal, absoluteUncertaintyTolerance, opts, prec, res);
  }

  @Override
  public RealToComplexFunction getKernel()
  {
    return kernel;
  }

}
