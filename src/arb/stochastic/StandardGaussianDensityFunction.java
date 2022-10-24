package arb.stochastic;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealFunction;

public class StandardGaussianDensityFunction implements
                                             RealProbabilityDensityFunction
{

  public static RealFunction inv = new RealFunction()
  {
    @Override
    public Real evaluate(Real t, int order, int prec, Real res)
    {
      return RealConstants.one.div(t, prec, res).log(prec, res).sqrt(prec, res);
    }
  };


  @Override
  public RealFunction inverse(int branch)
  {
    return inv;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).negate(res).exp(prec, res);
  }

  public Real evaluate(Complex point, int order, int prec, Real real)
  {
    return evaluate(point.getReal(),order,prec,real);
    
  }

}
