package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.functions.real.RealFunction;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface ProbabilityDistributionFunction<P extends ProbabilityDensityFunction> extends
                                                RealFunction
{
  /**
   * Draw a (pseudo) random sample from this density via the inverse sampling
   * method, that is, drawing from a uniform distribution with Ra
   * 
   * @return
   */
  public default Real sample(int prec, RandomState randomState, Real result)
  {
    RealFunction inverse = inverse();
    return inverse.evaluate(result.random(randomState, prec), 1, prec, result);
  }
}
