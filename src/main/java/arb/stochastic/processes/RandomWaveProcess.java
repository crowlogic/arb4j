package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.stochastic.StationaryGaussianProcesses;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.stochastic.processes.operators.RandomWaveOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RandomWaveProcess extends
                                   StationaryGaussianProcesses<RealBesselFunctionOfTheFirstKind, RandomWaveOperator>
{

}
