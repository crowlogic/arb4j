package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.measure.Measure;
import arb.space.topological.CartesianProduct;
import arb.space.topological.MetricSpace;
import arb.space.topological.MetrizableSpace;

/**
 * 
 * A {@link Metric} is a distance {@link Function} on a set (which is just a
 * Java {@link Class} that implemenets the set-theoretic constructs for that
 * notion) X denoted by ρ having non-negative {@link Real} values, defined on
 * the {@link CartesianProduct} X×X and satisfying for any x,y∈X the conditions:
 * 
 * <pre>
 * ρ(x,y)          = 0         iff x = y       (the identity axiom); 
 * ρ(x,y) + ρ(y,z) ≥ ρ(x,z)                    (the triangle  axiom); 
 * ρ(x,y)          = ρ(y,x)                    (the symmetry axiom).
 * 
 * (iff means if and only if)
 * </pre>
 * 
 * A set X on which it is possible to introduce a {@link Metric} is a
 * {@link MetrizableSpace}. A set X provided with a metric is called a
 * {@link MetricSpace}.
 *
 * @param <X> the set this metric {@link Measure}s
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Metric<X> extends
                       Function<OrderedPair<? extends X, ? extends X>, Real>
{

}
