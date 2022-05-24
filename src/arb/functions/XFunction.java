package arb.functions;

import static arb.Constants.*;
import static java.lang.Math.pow;

import arb.Complex;
import arb.Constants;
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
 * The conjugate of this function is {@link YFunction}
 */
public class XFunction extends
                       ComplexComposition
{

  public XFunction()
  {
    super(new SFunction(),
          new ZFunction());
  }

  public XFunction(double scale)
  {
    super(new SFunction(new Real().assign(scale)),
          new ZFunction());
  }

  /**
   * Radial hyperbolic tangent of the Real part of X
   * 
   * @param t     a point on the curve where Re(X(t))=0
   * @param s     OUTPUT s=t+h*e^(i*π*a)
   * @param scale
   * @param h     magnitude
   * @param a     angle ranging from [-1,1] indicating direction
   * @param res   OUTPUT angle ranging from [-1,1] indicating a direction which
   *              should be pointing in a direction of less than or equal real
   *              part as the compared to the value at the input angle a
   * @param prec
   * @return res=frac(a+tanh(Re(Y(t+h*e^(i*Pi*a)))/Im(Y'(t+h*e^(i*Pi*a))*h*Pi*e^(i*Pi*a))))
   */
  public Real realXang(Complex t, Complex s, Real scale, Real h, Real res, int prec)
  {
    assert t.isFinite();
    try ( Complex dt = new Complex(); Complex y = Complex.newVector(2); Complex p = new Complex();
          Complex Z = Complex.newVector(2))
    {
      s = t.add(h.mul(iπ.mul(scale, prec, dt).exp(prec, dt), dt), prec, s);
      assert s.isFinite() : String.format("s=%s t=%s h=%s a=%s dt=%s\n", s, t, h, scale, dt);
//      .dt.(s, Z, scale, 2, y);
      y.get(1).mul(dt, prec, p).getImag().mul(π, p.getImag());
      y.getReal().div(p.getImag(), prec, res).tanh(res, prec).add(scale, prec, res).frac(prec, res);
      assert res.isFinite() : "result is not finite";
      return res;
    }
  }

  public static void testXangLimit()
  {
    int                   prec   = 256;
    RealConvergenceTester tester = new RealConvergenceTester(prec,
                                                             pow(10, -17));
    try ( Real h = new Real().assign(0.1); Real a = new Real().assign(0.75); Real heading = new Real();
          Complex s = new Complex();
          Complex y0 = new Complex().set(ZFunction.roots.getOrCreate(1), Constants.ZERO.getImag()))
    {
      int          iters[]          = new int[]
      { 100 };
      XFunction    xFunc            = new XFunction(1);
      RealFunction realYangFunction = (inDir, order, bits, outDir) -> xFunc.realXang(y0, s, h, inDir, outDir, bits);
      // realYangFunction.iteratedCompositionLimit(a, tester, iters, heading, prec);
      // assertEquals(0.74754757546711682717, vector.get(0).doubleValue(),
      // Math.pow(10, -17));
      // assertEquals(0.7475482453531754, vector.get(1).doubleValue(), Math.pow(10,
      // -17));

//      System.out.println("converged to heading=" + heading + " starting from " + y0 + " in " + iters[0]
//                    + " iterations \n  where the initial angle was a=" + a + " with vector length h=" + h);
    }
  }

}
