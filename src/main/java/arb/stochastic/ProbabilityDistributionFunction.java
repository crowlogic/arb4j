package arb.stochastic;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RandomVectorGenerator;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
    Function<Real, Real> inverse  = inverse();
    assert false : "redo, if you really *must* use this technique";

 //   Real         u        = result.random(generator.getRandomState(), resolution);
   // Real         evaluate = inverse.evaluate(u, 1, resolution, result);
    //return evaluate;
    return null;
  }
}
