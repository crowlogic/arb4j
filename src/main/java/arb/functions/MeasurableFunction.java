package arb.functions;

import arb.measures.MeasurableSpace;

public interface MeasurableFunction<X, A extends MeasurableSpace<X>, B extends MeasurableSpace<X>> extends
                                   Function<A, B>
{

}
