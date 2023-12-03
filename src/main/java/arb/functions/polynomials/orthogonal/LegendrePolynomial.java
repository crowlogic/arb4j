package arb.functions.polynomials.orthogonal;

import arb.Real;
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
public class LegendrePolynomial extends
                                RealPolynomial implements
                                AutoCloseable
{

  static
  {
    System.loadLibrary("arblib");
  }

  public LegendrePolynomial(int order)
  {
    this.n = order;

  }

  final int n;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order < 0 || order > 2)
    {
      throw new UnsupportedOperationException("only 0 <= order <= 2 supported");
    }
    assert res.size() >= order : "result size < order";
    Real resPrime = res.size() > 1 ? res.get(1) : null;
    arblib.arb_hypgeom_legendre_p_ui(res, resPrime, n, t, bits);
    return res;
  }
}
