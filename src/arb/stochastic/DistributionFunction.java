package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.functions.real.RealFunction;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface DistributionFunction<P extends DensityFunction> extends
                                     RealFunction
{
  /**
   * Draw a (pseudo) random sample from this density via the inverse sampling
   * method
   * 
   * @return
   */
  public default Real sample(int prec, RandomState randomState, Real u, Real result)
  {
    RealFunction inverse = inverse();
    return inverse.evaluate(u.random(randomState, prec), 1, prec, result);
  }
}
