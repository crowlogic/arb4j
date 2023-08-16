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
   * Draw a (pseudo) random sample from this density via the inverse sampling
   * method, that is, drawing from a uniform distribution with Ra
   * 
   * @return
   */
  public default Real sample(RandomVectorGenerator generator, int prec, Real result)
  {
    RealFunction inverse  = inverse();
    Real         u        = result.random(generator.getRandomState(), prec);
    Real         evaluate = inverse.evaluate(u, 1, prec, result);
    return evaluate;
  }
}
