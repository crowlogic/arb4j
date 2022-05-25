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
import arb.arb;
import arb.exceptions.NotDifferentiableException;

/**
 * A parameterization of the Lemniscate of Bernoulli with parameter 2 where t
 * ranges over -Pi to Pi
 * 
 * The curvature and tangential angle of the lemniscate are kappa(t) =
 * (3sqrt(2)cost)/(asqrt(3-cos(2t))) and phi(t) = 3tan^(-1)(sint). TODO: add
 * scale factor
 * 
 * @author crow
 */
public class Lemniscate implements
                        PlaneCurve
{

  @Override
  public ComplexFunction differential() 
  {   
    return new LemniscateDerivative();
  }

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

  private static final Complex ONE = Constants.COMPLEX_ONE;
  private static final Complex i   = Constants.IMAGINARY_UNIT;

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
//    arb.f_lemniscate(w, z, null, order, prec);
//return w;

    try ( Complex a = new Complex(); Complex divisor = new Complex(); Complex numerator = new Complex())
    {
      z.cos(prec * 2, a).mul(2, numerator);
      z.sin(prec * 2, a).mul(i, divisor);
      divisor.neg(divisor).add(1, divisor);
      numerator.div(divisor, prec, w);
      if (order >= 2)
      {
        a.sub(i, numerator).mul(2, numerator);
        a.add(i, divisor).pow(2, divisor);
        numerator.div(divisor, prec, w.get(1));
      }

    }
    return w;
  }

}
