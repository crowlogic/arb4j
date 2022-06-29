package arb.probability;

import arb.functions.complex.ComplexFunction;

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
                                       ComplexFunction
{

}
