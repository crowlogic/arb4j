package arb.stochastic.processes.continuoustime;

import arb.stochastic.*;

public interface GaussMarkovProcess<P extends ProbabilityDensityFunction, F extends ProbabilityDistributionFunction, C extends CharacteristicFunction>
                                   extends
                                   GaussianProcess<P, F, C>,
                                   MarkovProcess<P, F, C>
{

}
