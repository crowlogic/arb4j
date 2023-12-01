package arb.functions.polynomials.orthogonal;

import arb.RealPolynomial;
import arb.arblib;

/**
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class JacobiPolynomial extends
                              RealPolynomial
{

  public JacobiPolynomial(JacobiPolynomialSequence sequence, int n)
  {
    this.sequence = sequence;
    this.n        = n;
    arblib.arb_poly_init2(this, n+1);
    assert getLength() == n+1;
    //assert false : "TODO: evaluate 3-term recurrence and initialize polynomial coeffecients";
  }

  final JacobiPolynomialSequence sequence;

  final int                      n;

}
