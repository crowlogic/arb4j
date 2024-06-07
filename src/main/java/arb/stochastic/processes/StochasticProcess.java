package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.ProbabilityDensityFunction;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.processes.integrators.State;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface StochasticProcess<S extends State>

{
  public ProbabilityDensityFunction getDensityFunction();

  public ProbabilityDistributionFunction getDistributionFunction();

  /**
   * 
   * @return the dimension of this process
   */
  public default int dim()
  {
    return 1;
  }

}
