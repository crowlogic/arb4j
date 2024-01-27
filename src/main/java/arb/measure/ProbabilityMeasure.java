package arb.measure;

import arb.domains.Domain;

/**
 * Consider a {@link ProbabilitySpace} specified by the triple (Ω,Σ,P),
 * where (Ω,Σ) is a {@link MeasurableSpace}, with S the {@link Domain} and S is
 * its measurable subsets, and Pfunc is a {@link Measure} on S with Pfunc(S)=1.
 * Then the {@link Measure} Pfunc is said to be a {@link ProbabilityMeasure}.
 * Equivalently, Pfunc is said to be normalized.
 * 
 * @see <a href=
 *      "https://mathworld.wolfram.com/ProbabilityMeasure.html">ProbabilityMeasure@WolframMathwortd</a>
 */
public interface ProbabilityMeasure<X, Σ extends σField<X>> extends
                                   Measure<X, Σ>
{

}
