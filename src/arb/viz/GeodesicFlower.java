/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See *
 * <http://www.gnu.org/licenses/>
 */
package arb.viz;

import java.awt.*;

import arb.*;
import arb.curves.*;
import arb.functions.complex.*;
import arb.functions.real.*;

/**
 * This class traces out the path where the real part, imaginary part, phase, or
 * magnitude of a function is equal to a specific value which is by default 0
 * 
 * @param <P> the type of function to flow across
 */
public class GeodesicFlower<P extends ComplexFunction> implements AutoCloseable
{
  public static enum What
  {
   Real,
   Imag,
   Phase,
   Magnitude
  }

  public Real    dt;

  public What    what;

  public Complex basepoint;

  public Real    θ = new Real();

  public Real    ρ = new Real();


  @Override
  public void close() throws Exception
  {
    θ.clear();
    ρ.clear();
    basepoint.clear();
    dt.clear();   
  }
  
  /**
   * 
   * @param surface
   * @param t0      base-point from which to start flowing from
   * @param dt      the step-size which must be small enough not to miss any
   *                important features of the surface
   * @param what    specifies what part of the scalar function of the surface to
   *                minimize
   */
  public GeodesicFlower(P surface, Complex t0, Real dt, What what, Real θ0, Real ρ)
  {
    this.surface   = surface;
    this.dt        = dt;
    this.basepoint = t0;
    this.what      = what;
    this.θ.set(θ0);
    this.ρ.set(ρ);
  }

  P surface;

  public void flow() throws InterruptedException
  {
    try ( CircularComposition<P> direction = new CircularComposition<P>(surface,
                                                                        new ComplexCircle(basepoint,
                                                                                          dt));)
    {

      /**
       * ρ controls the (angular) width of the sector that is searched over for a
       * minimum of the specified part of the function
       */
      RealComplexPart field;
      switch (what)
      {
      case Real:
        field = new RealPart(direction);
        break;
      case Imag:
        field = new ImaginaryPart(direction);
        break;
//      case Magnitude:
//        //field = new ComplexMagnitude(direction);
      default:
       
        throw new UnsupportedOperationException("TODO: implement " + what);
      }

      RealRootInterval zeroPointInterval = new RealRootInterval();
      θ.getMid().sub(ρ.getMid(), 128, zeroPointInterval.getA());
      θ.getMid().add(ρ.getMid(), 128, zeroPointInterval.getB());

//      try ( RealFunctionPlotter plotter = new RealFunctionPlotter(field,
//                                                                  zeroPointInterval,
//                                                                  new RealRootInterval(-0.001,
//                                                                                       0.001),
//                                                                  500))
//      {
//        plotter.plot();
//      }
      System.out.println("Locating over " + zeroPointInterval);

      Roots root = field.locateRoots(new RootLocatorConfiguration(zeroPointInterval,
                                                                  1500,
                                                                  50000,
                                                                  1,
                                                                  512));
      System.out.println("Located  " + zeroPointInterval);
      System.out.println("Refining...");
      root.refine(field, 256, 100, true);
      System.out.println("root=" + root);
      Complex hmm = new Complex(root.get(0).getReal(new Real(), 128));

      System.out.println("angle(w)=" + direction.evaluate(hmm, 1, 512, new Complex()));

      Thread.sleep(60 * 1000);

    }

  }

  public void trace(Graphics2D graphics)
  {
    throw new UnsupportedOperationException("TODO: implement this after transition from Java2d to LWJGL is completed");
  }


}
