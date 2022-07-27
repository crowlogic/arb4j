package arb.topological.spaces;

import arb.Metric;
import arb.Set;
import arb.topological.Space;

/**
 * 
 * @author crow
 *
 * @param <X>
 */
public interface MetricSpace<X extends Set> extends
                            Space<X>
{
  public Metric<X> metric();
}
