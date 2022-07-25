package arb.spaces;

import arb.Metric;
import arb.Set;

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
