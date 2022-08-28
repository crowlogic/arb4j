package arb.topological.spaces;

import arb.Field;
import arb.Set;

/**
 * sequence x 1 , x 2 , x 3 , … (X,d) is called Cauchy if for every positive
 * real number r > 0 r > 0 there is a positive integer N such that for all
 * positive integers m , n > N , d ( x m , x n ) < r .
 * 
 * Complete space
 * 
 * A metric space (X,d) is complete if any of the following equivalent
 * conditions are satisfied:
 * 
 * 1. Every Cauchy sequence of points in X X has a limit that is also in X .
 * <br>
 * 2. Every Cauchy sequence in X converges in X (that is, to some point of X .
 * <br>
 * 3. Every decreasing sequence of non-empty closed subsets of X , X, with
 * diameters tending to 0, has a non-empty intersection: if F n is closed and
 * non-empty, F n + 1 ⊆ F_ n F_{n+1} for every n , and diam ⁡ ( F n ) → 0 , then
 * there is a point x ∈ X x\in X common to all sets F n .
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Complete_metric_space">CompleteMetricSpace@Wikipedia</a>
 *
 * @param <X>
 */
public interface CompleteMetricSpace<X extends Field> extends
                                    MetricSpace<X>,
                                    CompleteSpace<X>
{

}
