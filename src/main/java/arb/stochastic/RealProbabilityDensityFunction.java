package arb.stochastic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * The {@link RealProbabilityDensityFunction} interface represents a probability
 * density function (PDF) for real-valued random variables. The PDF is a
 * function that describes the likelihood of a real-valued random variable
 * taking on a particular value or range of values within the domain. This
 * interface extends both the {@link ProbabilityDensityFunction}, with a domain
 * type of Real, and the {@link RealFunction} interfaces, which define
 * real-valued functions.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealProbabilityDensityFunction extends
                                                ProbabilityDensityFunction,
                                                RealFunction
{

}
