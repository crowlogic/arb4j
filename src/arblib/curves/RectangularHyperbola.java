/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arblib.curves;

import arblib.Complex;
import arblib.ComplexFunction;
import arblib.Constants;
import arblib.Real;

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
  public Complex evaluate(Complex t, int order, int prec, Complex w)
  {
    assert order == w.size();
    assert order <= 2;

    try ( Real r = new Real(); Real s = new Real();)
    {
      Real x = t.getReal();
      w.getReal().set(x.sec(prec, r));
      w.getImag().set(x.tan(prec, s));
      if (order >= 2)
      {
        Complex dw = w.get(1);
        dw.getReal().set(r.mul(s, s));
        dw.getImag().set(r.mul(r, r));
      }

    }
    return w;
  }

}
