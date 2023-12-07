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
 * @param <J>
 */
public class UltrasphericalPolynomial<J extends UltrasphericalPolynomial<?>> extends
                                     JacobiPolynomial<J>
{

  public UltrasphericalPolynomial(JacobiPolynomialSequence<J> sequence, int n)
  {
    super(sequence,
          n);
  }

}
