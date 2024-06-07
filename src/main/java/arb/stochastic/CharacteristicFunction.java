package arb.stochastic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;

/**
 * A statistical distribution is not uniquely specified by its moments, but is
 * by its characteristic function if all of its moments are finite and the
 * series for its characteristic function converges absolutely near the origin
 * (Papoulis 1991, p. 116)
 * 
 * The characteristic function of any real-valued random variable completely
 * defines its probability distribution. <br>
 * 
 * If a random variable admits a {@link RealProbabilityDensityFunction}
 * function, then the {@link CharacteristicFunction} is its
 * {@link FourierTransform} <br>
 * 
 * If the density function is symmetric about the origin then the corresponding
 * Fourier transform will have only real-values for real arguments otherwise in
 * general it can and will be complex-valued.
 * 
 * The characteristic function of a random variable is equal to the Fourier
 * transform of its probability density function (pdf).
 * 
 * The characteristic function of a random variable X is defined as the expected
 * value of the complex exponential function e^(itX), where t is a real
 * parameter:
 * 
 * φ(t) = E[e^(itX)]
 * 
 * The Fourier transform of the pdf f(x) of X is defined as:
 * 
 * F(ω) = ∫ f(x) e^(-iωx) dx
 * 
 * It can be shown that the characteristic function φ(t) is equal to the Fourier
 * transform F(ω) of the pdf f(x) of X:
 * 
 * φ(t) = E[e^(itX)] = ∫ e^(itx) f(x) dx = ∫ [cos(tx) + i sin(tx)] f(x) dx
 * 
 * Taking the real and imaginary parts separately and using the definition of
 * the Fourier transform, we get:
 * 
 * Re[φ(t)] = F(t) Im[φ(t)] = - F'(t)
 * 
 * where F'(t) denotes the derivative of F(t) with respect to t.
 * 
 * Therefore, the characteristic function of a random variable is indeed equal
 * to the Fourier transform of its pdf.
 * 
 * @param <Pfunc> the type of {@link RealProbabilityDensityFunction} this
 *                characteristic function corresponds to
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CharacteristicFunction extends
                                        ComplexFunction
{

}
