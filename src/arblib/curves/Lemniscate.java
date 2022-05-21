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

import static arblib.Constants.sqrt2;

import arblib.Complex;
import arblib.ComplexFunction;
import arblib.Constants;
import arblib.Real;

/**
 * The Bernoullian Lemniscate was first described in 1694 by Jakob Bernoulli as
 * a modification of an ellipse, which is the locus of points for which the sum
 * of the distances to each of two fixed focal points is a constant. A Cassini
 * oval, by contrast, is the locus of points for which the product of these
 * distances is constant. In the case where the curve passes through the point
 * midway between the foci, the oval is a lemniscate of Bernoulli.
 *
 * @author Jakob Bernoulli
 * @author Stephen Crowley
 */
public class Lemniscate implements
                        PlaneCurve
{
  public Lemniscate()
  {
    this.a = Constants.ONE;
  }

  public Lemniscate(Real a)
  {
    this.a = a;
  }

  Real a;

  @Override
  public ComplexFunction differentiate()
  {
    return PlaneCurve.super.differentiate();
  }

  @Override
  public int getInverseBranchCount()
  {
    return 4;
  }

  @Override
  public ComplexFunction getInverseFunction(int branch)
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

  private static final Complex ONE = Constants.COMPLEX_ONE;
  private static final Complex i   = Constants.IMAGINARY_UNIT;

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
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 2;

    try ( Complex cos = z.cos(prec, new Complex()); Complex sin = z.sin(prec, new Complex());
          Complex tmp = new Complex(); Complex divisor = ONE.sub(sin.mul(i, tmp), prec, tmp);
          Complex numerator = new Complex())
    {
      sqrt2.mul(cos, prec, numerator).div(divisor, prec, w).mul(a, prec, w);
      if (order >= 2)
      {
        sqrt2.mul(sin.sub(i, numerator), numerator);
        sin.add(i, divisor).pow(2, divisor);
        numerator.div(divisor, prec, w.get(1)).mul(a, prec, w.get(1));
      }

    }
    return w;
  }

}
