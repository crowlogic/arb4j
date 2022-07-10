package arb.probability;

import arb.functions.real.*;
import arb.operators.*;

/**
 * The characteristic function of any real-valued random variable completely
 * defines its probability distribution. <br>
 * 
 * If a random variable admits a {@link ProbabilityDensity} function, then the
 * {@link CharacteristicFunction} is its {@link FourierTransform} <br>
 * 
 * If the density function is symmetric about the origin then the corresponding
 * Fourier transform will have only real-values for real arguments otherwise in
 * general it can and will be complex-valued
 * 
 * @param <P> the type of {@link ProbabilityDensity} this characteristic
 *            function corresponds to
 */
public interface CharacteristicFunction<P extends ProbabilityDensity> extends
                                       RealFunction
{

}
