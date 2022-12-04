package arb.stochastic;

import static arb.ComplexConstants.prec;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

public class StandardGaussianDensityFunction implements
                                             RealProbabilityDensityFunction
{
  public static class ComplexVariable implements
                                    RealToComplexFunction
  {

    @Override
    public Complex evaluate(Real z, int order, int prec, Complex res)
    {
      order = Math.max(order, 1);
      assert order < 2;
      z.pow(2, prec, res.getReal()).negate().exp(prec);
      res.getImag().zero();
      return res;
    }

   
  }

  public static final RealFunction inv = (t, order, prec, res) -> RealConstants.one.div(t, prec, res)
                                                                                   .log(prec)
                                                                                   .sqrt(prec);

  @Override
  public RealFunction inverse(int branch)
  {
    assert branch == 0 : "the inverse of this function is single-valued";
    return inv;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    order = Math.max(order, 1);
    assert order < 2;
    return z.pow(2, prec, res).negate().exp(prec);
  }

  public Real evaluate(Complex point, int order, int prec, Real real)
  {
    return evaluate(point.getReal(), order, prec, real);

  }

}
