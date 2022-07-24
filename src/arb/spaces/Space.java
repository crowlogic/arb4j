package arb.spaces;

import arb.Set;

/**
 * A space is a set (sometimes called a universe) with some added structure.
 * 
 * While modern mathematics uses many types of spaces, such as Euclidean spaces,
 * linear spaces, topological spaces, Hilbert spaces, or probability spaces, it
 * does not define the notion of "space" itself.
 * 
 * A space consists of selected mathematical objects that are treated as points,
 * and selected relationships between these points.
 */
public interface Space<R> extends
                      Set<R>
{

}
