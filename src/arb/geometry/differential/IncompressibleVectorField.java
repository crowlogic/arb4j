package arb.geometry.differential;

import arb.geometry.DifferentiableManifold;

/**
 * Also known as a solenoidal {@link VectorField} due. An electrodynamic spiral
 * having the conjuctive wire turned back along its axis, so as to neutralize
 * that component of the effect of the current which is due to the length of the
 * spiral, and reduce the whole effect to that of a series of equal and parallel
 * circular currents. When traversed by a current the solenoid exhibits polarity
 * and attraction or repulsion, like a magnet.
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Solenoidal_vector_field">SolenoidalVectorField@Wikipedia</a>
 *      
 * @param <M>
 */
public interface IncompressibleVectorField<M extends DifferentiableManifold> extends
                                          VectorField<M>
{

}
