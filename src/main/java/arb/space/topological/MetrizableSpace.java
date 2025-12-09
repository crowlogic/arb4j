package arb.space.topological;

import arb.Metric;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A MetrizableSpace is a type of {@link TopologicalSpace} that can be endowed
 * with a metric, a function defining the distance between any two points in the
 * space. This metric can be used to induce a topology on the space.
 *
 * @param <X> The type of the elements in the space.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface MetrizableSpace<X> extends
                                TopologicalSpace<X>
{
  /**
   * Provides access to the metric associated with this MetrizableSpace.
   *
   * @return The Metric associated with this MetrizableSpace.
   */
  Metric<X> metric();
}