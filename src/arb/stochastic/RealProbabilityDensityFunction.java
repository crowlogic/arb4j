package arb.stochastic;

import arb.Real;
import arb.functions.real.RealFunction;

/**
 * The probability density function (PDF) of a continuous distribution is
 * defined as the derivative of the corresponding (cumulative) distribution
 * function
 * 
 *
 */
public interface RealProbabilityDensityFunction extends
                                                ProbabiltiyDensityFunction<Real>,
                                                RealFunction
{

}
