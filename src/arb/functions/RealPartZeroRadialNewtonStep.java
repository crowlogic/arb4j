package arb.functions;


import static arb.Constants.*;

import arb.Complex;
import arb.ComplexFunction;
import arb.Real;
import arb.RealFunction;

/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 * 
 * 
 * This function is the Newton iteration which converges to the angle which,
 * when stepped towards with a given radius h results in the value where the
 * function has Re(f(t+h*exp(i*a)))=0 . The input to this function is an angle,
 * and the output which is an angle where the function has a real part of lesser
 * magnitude
 * 
 * @param <F>
 */
public class RealPartZeroRadialNewtonStep<F extends ComplexFunction> implements
                                         RealFunction,
                                         AutoCloseable
{
  F f;

  /**
   * 
   * @param f function which the real part of a root is wanted
   * @param t base-point
   * @param h radius
   */
  public RealPartZeroRadialNewtonStep(F f, Complex t, Real h)
  {
    assert f != null;
    assert t != null;
    assert h != null;
    this.f = f;
    this.t = t;
    this.h = h;
    this.s = new Complex();
  }

  Complex s;
  Real    h;
  Complex t;
  ComplexFunction func;
  
  @Override
  public Real evaluate(Real a, int order, int prec, Real res)
  {
    assert a.isFinite();
    assert order == 1;

    try ( Complex dt = new Complex(); Complex y = Complex.newVector(2); Complex p = new Complex(); Complex Z = Complex.newVector(2))
    {
      s = t.add(h.mul(iπ.mul(a, prec, dt).exp(prec, dt), dt), prec, s);
      assert s.isFinite() : String.format("s is not finite: s=%s t=%s h=%s a=%s dt=%s\n", s, t, h, a, dt);

      Real yRealPart           = func.evaluate( s, 2, prec, y).getReal();
      Real yDerivativeImagPart = y.get(1).mul(dt, prec, p).getImag().mul(π, p.getImag());
      return yRealPart.div(yDerivativeImagPart, prec, res).tanh(res, prec).add(a, prec, res).frac(prec, res);

    }
  }

  @Override
  public void close() throws Exception
  {
    t.close();
    s.close();
    h.close();
  }

}