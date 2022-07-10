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

import static arb.Constants.*;

import java.awt.*;

import arb.*;
import arb.curves.*;
import arb.functions.complex.*;
import arb.functions.real.*;

/**
 * This class does what is needed to draw the curve on a graphics context
 * 
 * @author crow
 *
 * @param <P>
 */
public class GeodesicFlower<P extends ComplexFunction>
{

  public Real dt;
  public What what;

  public static enum What
  {
   Real,
   Imag,
   Phase,
   Magnitude
  };

  public Complex t;

  public Real    θ = new Real();

  public Real    ρ = new Real();

  public GeodesicFlower(P surface, Complex t0, Real dt, What part)
  {
    this.surface = surface;
    this.dt      = dt;
    this.t       = t0;
    this.what    = part;
  }

  P surface;

  public void flow() throws InterruptedException
  {
    try ( CircularComposition<P> direction = new CircularComposition<P>(surface,
                                                                        new ComplexCircle(ZERO,
                                                                                          dt));)
    {
      θ.set("-0.75", 128);
      ρ.set("0.05", 128);
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
      default:
        throw new UnsupportedOperationException("TODO: implement " + what);
      }

      RealRootInterval zeroPointInterval = new RealRootInterval();
      θ.getMid().sub(ρ.getMid(), 128, zeroPointInterval.getA());
      θ.getMid().add(ρ.getMid(), 128, zeroPointInterval.getB());

      try ( RealFunctionPlotter plotter = new RealFunctionPlotter(field,
                                                                  zeroPointInterval,
                                                                  new RealRootInterval(-0.001,
                                                                                       0.001),
                                                                  500))
      {
        plotter.plot();
      }
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
