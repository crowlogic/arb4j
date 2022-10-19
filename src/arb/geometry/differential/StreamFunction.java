package arb.geometry.differential;

import arb.Complex;
import arb.Real;
import arb.functions.Function;

/**
 * For two-dimensional potential flow, streamlines are perpendicular to
 * equipotential lines. Taken together with the velocity potential, the stream
 * function may be used to derive a complex potential. In other words, the
 * stream function accounts for the solenoidal part of a two-dimensional
 * Helmholtz decomposition, while the velocity potential accounts for the
 * irrotational part.
 * 
 *
 */
public interface StreamFunction extends
                                Function<Complex, Real>
{

}
