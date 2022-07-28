package arb.mechanics.quantum;

import arb.Complex;
import arb.functions.Function;
import arb.measure.Measure;
import arb.nature.physics.Observable;
import arb.operators.FourierTransform;
import arb.topological.Space;

/**
 * A wave function in quantum physics is a mathematical description of the
 * {@link QuantumState} of an isolated quantum system. The wave function is a
 * {@link Complex}-valued probability amplitude, and the probabilities for the
 * possible results of {@link Measure}ments made on the system can be derived
 * from it. The most common symbols for a wave function are the Greek letters ψ
 * and Ψ (lower-case and capital psi, respectively).
 * 
 * The wave function is a function of the degrees of freedom corresponding to
 * some maximal set of commuting {@link Observable}. Once such a representation
 * is chosen, the {@link WaveFunction} can be derived from the quantum state.
 * 
 * For a given system, the choice of which commuting degrees of freedom to use
 * is not unique, and correspondingly the domain of the wave function is also
 * not unique. For instance, it may be taken to be a function of all the
 * position coordinates of the particles over position {@link Space}, or the
 * momenta of all the particles over momentum space; the two are related by a
 * {@link FourierTransform}. Some particles, like electrons and photons, have
 * nonzero spin, and the wave function for such particles include spin as an
 * intrinsic, discrete degree of freedom; other discrete variables can also be
 * included, such as isospin. When a system has internal degrees of freedom, the
 * wave function at each point in the continuous degrees of freedom (e.g., a
 * point in space) assigns a complex number for each possible value of the
 * discrete degrees of freedom (e.g., z-component of spin) – these values are
 * often displayed in a column matrix (e.g., a 2 × 1 column vector for a
 * non-relativistic electron with spin 1⁄2).
 * 
 * <a href="https://en.wikipedia.org/wiki/Wave_function">Wikipedia</a>
 */
public interface WaveFunction extends
                              Function<QuantumState, Complex>
{

}
