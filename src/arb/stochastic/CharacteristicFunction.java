package arb.stochastic;

import arb.functions.real.RealFunction;
import arb.operators.FourierTransform;

/**
 * The characteristic function of any real-valued random variable completely
 * defines its probability distribution. <br>
 * 
 * If a random variable admits a {@link RealProbabilityDensityFunction}
 * function, then the {@link CharacteristicFunction} is its
 * {@link FourierTransform} <br>
 * 
 * If the density function is symmetric about the origin then the corresponding
 * Fourier transform will have only real-values for real arguments otherwise in
 * general it can and will be complex-valued
 * 
 * @param <P> the type of {@link RealProbabilityDensityFunction} this
 *            characteristic function corresponds to
 */
public interface CharacteristicFunction<P extends RealProbabilityDensityFunction> extends
                                       RealFunction
{

}
