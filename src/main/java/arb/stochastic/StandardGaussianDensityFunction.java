package arb.stochastic;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * This is the 'same' function as the
 * {@link StandardGaussianCharacteristicFunction} but the density is a function
 * of a real variable (a {@link RealFunction} whereas the characteristic
 * function is a {@link ComplexFunction} 
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class StandardGaussianDensityFunction implements
                                             RealProbabilityDensityFunction
{
  @Override
  public String toString()
  {
    return "StandardGaussianDensity";
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
    return z.pow(2, prec, res).div(2, prec).neg().exp(prec).div(RealConstants.sqrt2π, 128);
  }

}
