package arb.spaces;

import arb.Set;

/**
 * A {@link Space} is a {@link Set} (sometimes called a universe) with some
 * added structure.
 * 
 * While modern mathematics uses many types of spaces, such as
 * {@link EuclideanSpace}, {@link LinearSpace}, {@link TopologicalSpace},
 * {@link HilbertSpace}, or probability spaces, it does not define the notion of
 * "space" itself.
 * 
 * A space consists of selected mathematical {@link Object}s that are treated as
 * points, and selected relationships between these points.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Space_(mathematics)">Wikipedia</a>
 */
public interface Space<R> extends
                      Set<R>
{

}
