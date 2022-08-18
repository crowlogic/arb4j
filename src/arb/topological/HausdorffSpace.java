package arb.topological;

/**
 * Points x,y∈X in a (topological) {@link Space} X can be separated by
 * neighbourhoods if there exists a neighbourhood U of x and a neighbourhood V
 * of y such that U and V are disjoint ( U ∩ V = ∅ ) . X is a Hausdorff space if
 * all distinct points in X X are pairwise neighbourhood-separable. This
 * condition is the third separation axiom (after T0 and T1), which is why
 * Hausdorff spaces are also called T2 spaces. The name separated space is also
 * used.
 * 
 * A related, but weaker, notion is that of a preregular space. X X is a
 * preregular space if any two topologically distinguishable points can be
 * separated by disjoint neighbourhoods. Preregular spaces are also called R1
 * spaces.
 * 
 * The relationship between these two conditions is as follows. A topological
 * space is Hausdorff if and only if it is both preregular (i.e. topologically
 * distinguishable points are separated by neighbourhoods) and Kolmogorov (i.e.
 * distinct points are topologically distinguishable). A topological space is
 * preregular if and only if its Kolmogorov quotient is Hausdorff.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Hausdorff_space">HausdorffSpace@Wikipedia</a>
 * @param <X>
 */
public interface HausdorffSpace<X> extends
                               Space<X>
{

}
