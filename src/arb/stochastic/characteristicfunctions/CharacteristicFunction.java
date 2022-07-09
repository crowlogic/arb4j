package arb.stochastic.characteristicfunctions;

import arb.functions.real.*;
import arb.stochastic.probabilitydensities.ProbabilityDensity;

/**
 * The characteristic function of any real-valued random variable completely
 * defines its probability distribution. If a random variable admits a
 * probability density function, then the characteristic function is the Fourier
 * transform of the probability density function.
 * 
 * @author crow
 *
 * @param <P>
 */
public interface CharacteristicFunction<P extends ProbabilityDensity> extends
                                       RealFunction
{

}
