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

import arb.*;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;

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
  public Function<Real, Complex> differential()
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
  public Complex evaluate(Real z, int order, int prec, Complex w)
  {
    order = max(1, order);
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 2;

    try ( Real a = new Real(); Complex divisor = new Complex(); Complex numerator = new Complex())
    {
      z.cos(prec, a).mul(2, prec, numerator.getReal());
      z.sin(prec, a).mul(i, prec, divisor);
      divisor.neg(divisor).add(1, prec, divisor);
      numerator.div(divisor, prec, w);
      if (order >= 2)
      {
        a.sub(i, prec, numerator).mul(2, prec, numerator);
        a.add(i, prec, divisor).pow(2, prec, divisor);
        numerator.div(divisor, prec, w.get(1));
      }

    }
    return w;
  }

  public void integrate(Complex a,
                        Complex b,
                        int relativeAccuracyBitsGoal,
                        Magnitude acceptableUncertainty,
                        Object object,
                        int k,
                        Complex integral)
  {
    // TODO Auto-generated method stub

  }

}
