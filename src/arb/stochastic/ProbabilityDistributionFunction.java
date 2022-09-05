package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.CorrelatedRandomVectorGenerator;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface ProbabilityDistributionFunction<P extends RealProbabilityDensityFunction> extends
                                                RealFunction
{

  /**
   * Calls {@link Real#random(RandomState, int)} on each element of this
   * 
   * @param elements
   * @param generator
   * @param prec
   */
  default void sample(Real elements, CorrelatedRandomVectorGenerator generator, int prec)
  {
    elements.forEach(element -> sample(generator, prec, element));
  }

  /**
   * Draw a (pseudo) random sample from this density via the inverse sampling
   * method, that is, drawing from a uniform distribution with Ra
   * 
   * @return
   */
  public default Real sample(CorrelatedRandomVectorGenerator generator, int prec, Real result)
  {
    RealFunction inverse = inverse();
    return inverse.evaluate(result.random(generator.getRandomState(), prec), 1, prec, result);
  }
}
