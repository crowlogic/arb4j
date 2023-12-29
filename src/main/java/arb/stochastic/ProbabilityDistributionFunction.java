package arb.stochastic;

import arb.Real;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RandomVectorGenerator;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface ProbabilityDistributionFunction extends
                                                 RealFunction
{

  /**
   * Draws a sample using the inverse sampling method
   * 
   * @param generator
   * @param resolution
   * @param result
   * @return
   */
  public default Real sample(RandomVectorGenerator generator, int resolution, Real result)
  {
    RealFunction inverse  = inverse();
    Real         u        = result.random(generator.getRandomState(), resolution);
    Real         evaluate = inverse.evaluate(u, 1, resolution, result);
    return evaluate;
  }
}
