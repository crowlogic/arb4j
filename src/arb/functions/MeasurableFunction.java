package arb.functions;

import arb.measures.MeasurableSpace;
import arb.stochastic.RandomVariable;

public interface MeasurableFunction<A extends MeasurableSpace, B extends MeasurableSpace> extends
                                   Function<A, B>
{

}
