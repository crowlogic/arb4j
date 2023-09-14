package arb.functions.polynomials.orthogonal;

import arb.Real;

/**
 * An interface for the generation of recurrence coefficients
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public interface Recurrence
{
  /**
   * Generate recurrence coefficients.
   * 
   * @param k order
   * @return a 3-dimensional {@link Real} whose elements are related by <br>
   *         <br>
   *         <code>Pₖ₊₁(x) = (a₀ + a₁*x)*Pₖ(x) - a₂*Pₖ₋₁(x)</code>
   */
  Real generate(int k);

}
