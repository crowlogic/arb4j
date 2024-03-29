package arb.geometry;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

/**
 * a complex {@link Manifold} is a manifold with an atlas of charts to the open
 * unit disc[1] in ℂⁿ, such that the transition maps are
 * {@link ComplexFunction}s.
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Complex_manifold">ComplexManifold@Wikipedia</a>
 */
public interface ComplexManifold extends
                                 Manifold<Complex>
{
}
