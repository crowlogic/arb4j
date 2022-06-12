/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.curves;

import arb.*;

/**
 * A parameterization of a rectangular unit hyperbola where t ranges over -Pi to
 * Pi: sec(t)+itan(t)
 *
 * TODO: add scale factor
 *
 * @author crow
 */
public class RectangularHyperbola implements
                                  PlaneCurve
{
  private static final Complex i = Constants.IMAGINARY_UNIT;

  /**
   * @param t
   * @param int
   * @param order
   * @param w
   * @return w=sec(t)+i*tan(t)
   */
  @Override
  public Complex evaluate(Real x, int order, int prec, Complex w)
  {
    assert order == w.size();
    assert order <= 2;

    try ( Real r = new Real(); Real s = new Real();)
    {
      w.getReal().set(x.sec(prec, r));
      w.getImag().set(x.tan(prec, s));
      if (order >= 2)
      {
        Complex dw = w.get(1);
        dw.getReal().set(r.mul(s, prec, s));
        dw.getImag().set(r.mul(r, prec, r));
      }

    }
    return w;
  }

}
