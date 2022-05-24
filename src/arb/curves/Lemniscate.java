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

import static java.lang.Math.max;

import arb.Complex;
import arb.ComplexFunction;
import arb.Constants;
import arb.Real;

/**
 * A parameterization of the Lemniscate of Bernoulli with parameter 2 where t
 * ranges over -Pi to Pi
 * 
 * TODO: add scale factor
 * 
 * @author crow
 */
public class Lemniscate implements
                        PlaneCurve
{

  @Override
  public int getInverseBranchCount()
  {
    return 4;
  }

  @Override
  public ComplexFunction inverse(int branch)
  {
    switch (branch)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    }
    throw new UnsupportedOperationException("TODO: implement  inverse branches");

  }

  private static final Complex ONE   = Constants.COMPLEX_ONE;
  private static final Complex i     = Constants.IMAGINARY_UNIT;

  /**
   * @param z
   * @param int
   * @param order
   * @param w
   * @return 2*cos(t))/(1-i*sin(t)
   */
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = max(1, order);
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 2;

    try ( Complex cos = z.cos(prec, new Complex()); Complex sin = z.sin(prec, new Complex());
          Complex tmp = new Complex(); Complex divisor = ONE.sub(sin.mul(i, tmp), prec, tmp);
          Complex numerator = cos.mul(2, new Complex()))
    {
      numerator.div(divisor, prec, w);
      if (order >= 2)
      {
        sin.sub(i, numerator).mul(2,numerator);
        sin.add(i, divisor).pow(2, divisor);
        numerator.div(divisor, prec, w.get(1));
      }

    }
    return w;
  }

}
