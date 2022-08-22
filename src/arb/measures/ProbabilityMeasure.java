package arb.measures;

import arb.domains.Domain;
import arb.topological.spaces.ProbabilitySpace;

/**
 * Consider a {@link ProbabilitySpace} specified by the triple (S,S,P), where
 * (S,S) is a {@link MeasurableSpace#}, with S the {@link Domain} and S is its
 * measurable subsets, and P is a {@link Measure} on S with P(S)=1. Then the
 * {@link Measure} P is said to be a {@link ProbabilityMeasure}. Equivalently, P
 * is said to be normalized.
 * 
 * @see <a href=
 *      "https://mathworld.wolfram.com/ProbabilityMeasure.html">ProbabilityMeasure@WolframMathwortd</a>
 */
public interface ProbabilityMeasure extends
                                    Measure
{

}
