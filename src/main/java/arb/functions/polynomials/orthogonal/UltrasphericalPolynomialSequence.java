package arb.functions.polynomials.orthogonal;

import arb.Real;

/**
 * The {@link UltrasphericalPolynomial}s are special-cases of the
 * {@link JacobiPolynomial}s where both α and β are equal to the same value
 * α=β=μ
 * 
 *
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @param <J> the type of {@link UltrasphericalPolynomial}s that this sequence
 *            generates
 */
public class UltrasphericalPolynomialSequence<J extends UltrasphericalPolynomial<?, ?>> extends
                                             JacobiPolynomialSequence<J>
{

  /**
   * 
   * @param μ the value of α=μ and β=μ to pass to the
   *          {@link JacobiPolynomialSequence} constructor
   */
  public UltrasphericalPolynomialSequence(Real μ)
  {
    super(μ,
          μ);
  }

}
