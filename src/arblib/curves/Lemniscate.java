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
 * A parameterization of the Lemniscate of Bernoulli with parameter 2 where t
 * ranges over -Pi to Pi
 * 
 * TODO: add scale factor
 * 
 * @author crow
 */
public class Lemniscate implements
                        PlanarCurve
{
  @Override
  public ComplexFunction differentiate()
  {
    return PlanarCurve.super.differentiate();
  }

  @Override
  public int getInverseBranchCount()
  {
    return 4;
  }

  @Override
  public ComplexFunction getInverseFunction(int branch)
  {
    switch(branch)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    }
    throw new UnsupportedOperationException( "TODO: implement  inverse branches" );
   
  }

  private static final Complex ONE   = Constants.COMPLEX_ONE;
  private static final Complex i     = Constants.IMAGINARY_UNIT;
  private static Real          sqrt2 = new Real().assign(2).sqrt(256);

  /**
   * @param z
   * @param int
   * @param order
   * @param w
   * @return sqrt(2)*cos(t))/(1-i*sin(t)
   */
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size() );
    assert order <= 2;

    try ( Complex cos = z.cos(prec, new Complex()); Complex sin = z.sin(prec, new Complex());
          Complex tmp = new Complex(); Complex divisor = ONE.sub(sin.mul(i, tmp), prec, tmp);
          Complex numerator = sqrt2.mul(cos, prec, new Complex()))
    {
      numerator.div(divisor, prec, w);
      if (order >= 2)
      {
        sqrt2.mul(sin.sub(i, numerator), numerator);
        sin.add(i, divisor).pow(2, divisor);
        numerator.div(divisor, prec, w.get(1));
      }

    }
    return w;
  }

}
