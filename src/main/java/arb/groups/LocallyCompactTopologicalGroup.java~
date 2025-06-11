package arb.groups;

import java.util.Set;

import arb.OpenSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.measure.HaarMeasure;
import arb.measure.Measure;
import arb.measure.σField;
import arb.space.topological.TopologicalSpace;
import io.fair_acc.bench.Measurable;

/**
 * Represents a locally compact {@link Group}. A locally compact group is a
 * {@link TopologicalSpace} that is also a group that satisfies local
 * compactness at every point within it. <br>
 * <br>
 * <b>Local compactness</b> means that for every point, there exists a
 * neighborhood which is compact, meaning every open cover of the neighborhood
 * has a finite subcover. <br>
 * <br>
 * This interface provides methods to find a local base of the topology at a
 * given point, and to measure subsets using the {@link HaarMeasure}, if
 * applicable.
 * 
 * @param <X>the type of elements in this locally compact group
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LocallyCompactTopologicalGroup<X> extends
                                               TopologicalGroup<X>
{
  /**
   * Returns a local base of the topology at a given point. A local base at a
   * point consists of open sets containing the point such that every
   * neighbourhood of the point contains at least one of the sets.
   *
   * @param point the point for which to find the local base
   * @return a Set of sets that form a local base of the topology at the given
   *         point
   */
  Set<? extends OpenSet<? extends X>> localBase(X point);

  /**
   * Returns the {@link HaarMeasure} of a set if the {@link Group} is Haar
   * {@link Measurable}. The Haar {@link Measure} provides a way to measure
   * subsets of the group in a translation-invariant way.
   *
   * @param subset the subset to measure
   * @return the Haar measure of the subset, or null if the set is not measurable
   *         or the group is not Haar measurable
   */
  HaarMeasure<? extends X, σField<? extends X>> haarMeasure(Set<? extends X> subset);
}
