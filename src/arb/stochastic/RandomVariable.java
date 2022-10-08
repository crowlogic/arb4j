package arb.stochastic;

import arb.functions.MeasurableFunction;
import arb.measures.MeasurableSpace;
import arb.topological.spaces.ProbabilitySpace;
import arb.topological.spaces.SampleSpace;

/**
 * A {@link RandomVariable} a {@link MeasurableFunction} from a
 * {@link ProbabilitySpace} called the {@link SampleSpace} to a
 * {@link MeasurableSpace}
 *
 */
public interface RandomVariable<P extends ProbabilitySpace, Ω extends SampleSpace> extends
                               MeasurableFunction<P, Ω>
{

}
