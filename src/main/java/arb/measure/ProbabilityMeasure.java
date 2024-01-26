package arb.measures;

import arb.Field;
import arb.domains.Domain;
import arb.space.topological.ProbabilitySpace;

/**
 * Consider a {@link ProbabilitySpace} specified by the triple (S,S,Pfunc), where
 * (S,S) is a {@link MeasurableSpace#}, with S the {@link Domain} and S is its
 * measurable subsets, and Pfunc is a {@link Measure} on S with Pfunc(S)=1. Then the
 * {@link Measure} Pfunc is said to be a {@link ProbabilityMeasure}. Equivalently, Pfunc
 * is said to be normalized.
 * 
 * @see <a href=
 *      "https://mathworld.wolfram.com/ProbabilityMeasure.html">ProbabilityMeasure@WolframMathwortd</a>
 */
public interface ProbabilityMeasure<X extends Field<X>> extends
                                   Measure<X>
{

}
