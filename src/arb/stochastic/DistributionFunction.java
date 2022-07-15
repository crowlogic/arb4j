package arb.stochastic;

import arb.*;
import arb.functions.Function;
import arb.functions.real.*;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface DistributionFunction<P extends DensityFunction> extends
                                     RealFunction
{
  /**
   * Draw a (pseudo) random sample from this density
   * 
   * @return
   */
  public default Real sample(int prec, RandomState randomState, Real u, Real result)
  {
    RealFunction inverse = inverse();
    return inverse.evaluate(u.random(randomState, prec), 1, prec, result);
  }
}
