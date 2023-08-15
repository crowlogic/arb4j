package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.groups.CommutativeGroup;
import arb.operators.SelfAdjointOperator;

/**
 * Represents a quantum wave function, which is a mathematical description of
 * the state of a quantum system. The interface extends both HolomorphicFunction
 * and CommutativeGroup, indicating that a wave function is a complex-valued
 * function and can be combined with other wave functions in a commutative
 * manner.
 * 
 * <pre>
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @author ©2023 Stephen A. Crowley
 */
public interface WaveFunction extends
                              HolomorphicFunction,
                              CommutativeGroup<WaveFunction>
{

  /**
   * Computes the probability density of the wave function at a specified point in
   * the complex plane. The probability density is determined using the Born rule,
   * which states that the probability density is the square of the magnitude of
   * the wave function. This method provides a default implementation based on
   * this rule.
   *
   * @param t      The point in the complex plane where the wave function is
   *               evaluated.
   * @param bits   The number of bits of precision for the computation.
   * @param result An instance of Real where the computed probability density will
   *               be stored.
   * @return The populated Real instance containing the probability density at the
   *         specified point.
   */
  default Real probabilityDensity(Complex t, int bits, Real result)
  {
    try ( Complex z = new Complex();)
    {
      Complex value = evaluate(t, 1, bits, z);
      return result.set(value.abs(bits, result).pow(2, bits));
    }
  }

  /**
   * Retrieves the quantum observable associated with this wave function. In
   * quantum mechanics, observables correspond to physical quantities that can be
   * measured, and they are represented by self-adjoint operators.
   *
   * @return The SelfAdjointOperator instance representing the quantum observable
   *         associated with this wave function.
   */
  SelfAdjointOperator<?, ?, ?> getObservables();

  /**
   * Normalizes the wave function to ensure that its integral over all space
   * equals 1. Normalization is essential in quantum mechanics to ensure that the
   * wave function represents a valid probability distribution.
   *
   * @param bits   The number of bits of precision for the normalization process.
   * @param result An instance of WaveFunction where the normalized wave function
   *               will be stored.
   * @return The populated WaveFunction instance representing the normalized wave
   *         function.
   */
  WaveFunction normalize(int bits, WaveFunction result);

  // ... other quantum-specific methods ...

}
