package arb;

import arb.functions.Function;
import arb.measure.Measure;
import arb.space.topological.CartesianProduct;
import arb.space.topological.MetricSpace;
import arb.space.topological.MetrizableSpace;

/**
 * 
 * A {@link Metric} is a distance {@link Function} on a {@link Set} X denoted by
 * ρ having non-negative {@link Real} values, defined on the
 * {@link CartesianProduct} X×X and satisfying for any x,y∈X the conditions:
 * 
 * <pre>
 * ρ(x,y)          = 0         iff x = y       (the identity axiom); 
 * ρ(x,y) + ρ(y,z) ≥ ρ(x,z)                    (the triangle  axiom); 
 * ρ(x,y)          = ρ(y,x)                    (the symmetry axiom).
 * 
 * (iff means if and only if)
 * </pre>
 * 
 * A set X on which it is possible to introduce a metric is a
 * {@link MetrizableSpace}. A set X provided with a metric is called a
 * {@link MetricSpace}.
 *
 * @param <X> the set this metric {@link Measure}s
 * 
 * @see <a href="https://encyclopediaofmath.org/wiki/Metric">The Encyclopedia of
 *      Mathematics wiki</a>
 */
public interface Metric<X> extends
                       Function<OrderedPair<X, X>, Real>
{

}
