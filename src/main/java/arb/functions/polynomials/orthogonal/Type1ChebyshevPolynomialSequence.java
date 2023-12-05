package arb.functions.polynomials.orthogonal;

import arb.RealConstants;

/**
 * The Chebyshev polynomials of the first kind are an instance of the Jacobi
 * Polynomial Pₙ with α=β=−½ such that <br>
 * <br>
 * 
 * Tₙ(x) = Pₙ(−½,−½,x) / π​*Γ(n+1)/Γ(n+½)
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Type1ChebyshevPolynomialSequence extends
                                              JacobiPolynomialSequence

{

  public Type1ChebyshevPolynomialSequence(int n)
  {
    super(RealConstants.negHalf,
          RealConstants.negHalf);
  }

}
