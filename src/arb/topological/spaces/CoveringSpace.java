package arb.topological.spaces;

import arb.topological.TopologicalSpace;

/**
 * A covering of a topological space X is a continuous map
 * 
 * π : E → X
 * 
 * such that there exists a discrete space D and for every x∈X an open
 * neighborhood U⊂X , such that π^(−1)(U)=⨆d∈Vd and π|Vd: Vd→U is a
 * homeomorphism for every d∈D. Intuitively, a covering locally projects a
 * "stack of pancakes" above an open neighborhood of U onto U. <br>
 * 
 * Often, the notion of a covering is used for the covering space E as well as
 * for the map π : E → X. The open sets Vd are called sheets, which are uniquely
 * determined up to a homeomorphism if U is connected.
 * 
 * For a x∈X the discrete subset π(^−1)(x) is called the fiber of x. The degree
 * of a covering is the cardinality of the space D. If E is path-connected, then
 * the covering π : E → X is denoted as a path-connected covering.
 * 
 * @author crow
 *
 * @param <X>
 */
public interface CoveringSpace<X> extends
                              TopologicalSpace<X>
{

}
