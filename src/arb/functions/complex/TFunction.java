package arb.functions.complex;

import static arb.Constants.*;
import static java.lang.String.format;

import arb.Complex;
import arb.Constants;
import arb.Real;

/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
public class TFunction implements
                       ComplexFunction
{
  Real a;

  public TFunction()
  {
    a = Constants.ONE;
  }

  public TFunction(Real scale)
  {
    this.a = scale;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    return T(null, z.mul(Constants.i, z), a, order, false, Complex.defaultPrec, w);
  }

  public static Complex
         T(Complex f, Complex t, Real a, int order, boolean functionalDerivative, int prec, Complex res)
  {
    assert res.dim >= order && order > 0 : format("res.dim = %d must be >= order = %d > 0", res.dim, order);
    try ( Complex r = new Complex())
    {
      if (order >= 1)
      {
        t.div(a, prec, r)
         .pow(2, prec, r)
         .add(1, prec, r)
         .pow(2, prec, r)
         .add(1, prec, r)
         .sub(2, prec, res)
         .div(r, prec, res);
      }
      if (order >= 2)
      {
        Complex res1 = res.get(1);

        try ( Complex q = new Complex(); Complex s = new Complex())
        {
          t.div(a, prec, r).pow(2, prec, q).add(1, prec, q).mul(t, prec, r);
          if (functionalDerivative)
          {
            r.mul(f.get(1), prec, r);
          }
          r.mul(8, prec, r).div(t.pow(4, prec, s).add(q.mul(2, prec, q), s).pow(2, prec, s), prec, res1);
        }
      }
      return res;
    }
  }

  public Complex TNewton(Complex t, int prec, Complex res)
  {
    try ( Complex r = new Complex(); Complex s = Complex.newVector(2))
    {
      return t.sub(T(null, t, a, 2, false, prec, s).div(s.get(1), prec, r), prec, res);
    }
  }

  /**
   * Radial hyperbolic tangent of the Real part of Y
   * 
   * @param t    a point on the curve where Re(Y(t))=0
   * @param s    OUTPUT s=t+h*e^(i*π*a)
   * @param h    magnitude
   * @param a    angle ranging from [-1,1] indicating direction
   * @param res  OUTPUT angle ranging from [-1,1] indicating a direction which
   *             should be pointing in a direction of less than or equal real part
   *             as the compared to the value at the input angle a
   * @param prec
   * 
   * @return res=frac(a+tanh(Re(T(t+h*e^(i*Pi*a)))/Im(T'(t+h*e^(i*Pi*a))*h*Pi*e^(i*Pi*a))))
   */
  public Real realTang(Complex t, Complex s, Real h, Real a, Real res, int prec)
  {
    assert t.isFinite();
    assert a.isFinite();
    try ( Complex dt = new Complex(); Complex y = Complex.newVector(2); Complex p = new Complex();
          Complex Z = Complex.newVector(2))
    {
      s = t.add(h.mul(iπ.mul(a, prec, dt).exp(prec, dt), dt), prec, s);
      assert s.isFinite() : String.format("s=%s t=%s h=%s a=%s dt=%s\n", s, t, h, a, dt);
      return T(null, s, a, 2, false, prec, y).getReal()
                                             .div(y.get(1).mul(dt, prec, p).getImag().mul(π, p.getImag()), prec, res)
                                             .tanh(res, prec)
                                             .add(a, prec, res)
                                             .frac(prec, res);
    }
  }

}
