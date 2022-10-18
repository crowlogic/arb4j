package arb.topological.spaces;

import arb.topological.Space;

/**
 * Let X be a topological space. A covering of X X is a continuous map
 * 
 * π : E → X
 * 
 * such that there exists a discrete space D D and for every x ∈ X x\in X an
 * open neighborhood U ⊂ X U\subset X, such that π − 1 ( U ) = ⨆ d ∈ D V d
 * {\displaystyle \pi ^{-1}(U)=\displaystyle \bigsqcup _{d\in D}V_{d}}
 * {\displaystyle \pi ^{-1}(U)=\displaystyle \bigsqcup _{d\in D}V_{d}} and π | V
 * d : V d → U {\displaystyle \pi |_{V_{d}}:V_{d}\rightarrow U} {\displaystyle
 * \pi |_{V_{d}}:V_{d}\rightarrow U} is a homeomorphism for every d ∈ D
 * {\displaystyle d\in D} {\displaystyle d\in D}. Intuitively, a covering
 * locally projects a "stack of pancakes" above an open neighborhood U
 * {\displaystyle U} U onto U {\displaystyle U} U
 * 
 * Often, the notion of a covering is used for the covering space E
 * {\displaystyle E} E as well as for the map π : E → X {\displaystyle \pi
 * :E\rightarrow X} {\displaystyle \pi :E\rightarrow X}. The open sets V d
 * {\displaystyle V_{d}} {\displaystyle V_{d}} are called sheets, which are
 * uniquely determined up to a homeomorphism if U {\displaystyle U} U is
 * connected.[1]: 56 For a x ∈ X {\displaystyle x\in X} x\in X the discrete
 * subset π − 1 ( x ) {\displaystyle \pi ^{-1}(x)} {\displaystyle \pi ^{-1}(x)}
 * is called the fiber of x {\displaystyle x} x. The degree of a covering is the
 * cardinality of the space D {\displaystyle D} D. If E {\displaystyle E} E is
 * path-connected, then the covering π : E → X {\displaystyle \pi :E\rightarrow
 * X} {\displaystyle \pi :E\rightarrow X} is denoted as a path-connected
 * covering.
 * 
 * @author crow
 *
 * @param <X>
 */
public interface CoveringSpace<X> extends
                              Space<X>
{

}
