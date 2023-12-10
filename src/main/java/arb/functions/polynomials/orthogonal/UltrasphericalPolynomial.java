package arb.functions.polynomials.orthogonal;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @param <J> the type of {@link UltrasphericalPolynomial}
 * @param <K> the type of {@link UltrasphericalPolynomialSequence}
 */
public class UltrasphericalPolynomial<J extends UltrasphericalPolynomial<?, ? extends K>, K extends UltrasphericalPolynomialSequence<? extends J>>
                                     extends
                                     JacobiPolynomial<J>
{

  public UltrasphericalPolynomial(K sequence, int n)
  {
    super(sequence,
          n);
  }

}
