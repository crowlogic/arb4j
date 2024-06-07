package arb.stochastic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * The {@link ProbabilityDensityFunction} interface represents a probability
 * density function (PDF) for a given domain type D. The PDF is a function that
 * describes the likelihood of a random variable taking on a particular value or
 * range of values within the domain. This interface extends the Function
 * interface, with the domain type D and the codomain type Real.
 * </pre>
 * 
 * @param <D> The domain type for the probability density function.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ProbabilityDensityFunction extends
                                           RealFunction 
{

}
