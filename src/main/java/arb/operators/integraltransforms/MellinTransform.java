package arb.operators.integraltransforms;

import static arb.RealConstants.prec;

import arb.*;
import arb.functions.RealToComplexFunction;

public class MellinTransform<F extends RealToComplexFunction> extends
                            AbstractIntegralTransform<F, Real>
{
  final static int bits = 128;
  

  public MellinTransform(F f)
  {
    super(f);
  }

  final RealToComplexFunction kernel = (s, order, prec, result) ->
                                     {
                                       result.re().set(s);
                                       result.sub(1, prec);
                                       return result;
                                     };

  @Override
  public Complex evaluate(Real s, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;

    RealToComplexFunction integrand = (t, integrandOrder, integrandPrec, result) ->
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

    IntegrationOptions    opts      = new IntegrationOptions();
    return integrand.integrate(left, right, relativeAccuracyBitsGoal, absoluteUncertaintyTolerance, opts, prec, res);
  }

  @Override
  public RealToComplexFunction getKernel()
  {
    return kernel;
  }


}
