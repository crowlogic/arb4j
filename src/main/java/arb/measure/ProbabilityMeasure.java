package arb.measure;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;

/**
 * Consider a {@link ProbabilitySpace} specified by the triple (Ω,Σ,P), where
 * (Ω,Σ) is a {@link MeasurableSpace}, with S the {@link Domain} and Σ is the
 * {@link σField} of subsets of random events, and this is a {@link Measure} on
 * Σ with measure(S)=1 so that the {@link Measure} is said to be a
 * {@link ProbabilityMeasure}. Equivalently, this is said to be a normalized
 * {@link Measure}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ProbabilityMeasure<X, Σ extends σField<? extends X>> extends
                                   Measure<X, Σ>
{

}
