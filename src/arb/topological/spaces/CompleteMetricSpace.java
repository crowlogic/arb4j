package arb.topological.spaces;

import arb.Set;

public interface CompleteMetricSpace<X extends Set> extends
                                    MetricSpace<X>,
                                    CompleteSpace<X>
{

}
