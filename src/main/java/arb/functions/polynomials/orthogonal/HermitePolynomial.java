package arb.functions.polynomials.orthogonal;

import arb.*;

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
public class HermitePolynomial extends
                               RealPolynomial implements
                               AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  @Override
  public String toString()
  {
    return String.format("HermitePolynomial[ν=%s]", nu);
  }

  @Override
  public void close()
  {
    nu.close();
  }

  public HermitePolynomial(int order)
  {
    this.nu = new Real();
    nu.set(order);
  }

  final Real nu;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order > 1)
    {
      throw new UnsupportedOperationException("TODO: derivatives");
    }
    assert res.size() >= order : "result size < order";
    arblib.arb_hypgeom_hermite_h(res, nu, t, bits);
    return res;
  }

}
