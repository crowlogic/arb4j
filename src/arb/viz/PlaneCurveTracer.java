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

import java.awt.Graphics2D;

import arb.curves.PlaneCurve;

/**
 * This class does what is needed to draw the curve on a graphics context
 * 
 * @author crow
 *
 * @param <P>
 */
public class PlaneCurveTracer<P extends PlaneCurve>
{
  public PlaneCurveTracer(P curve)
  {
    this.curve = curve;
  }

  P curve;

  public void trace(Graphics2D graphics)
  {
    throw new UnsupportedOperationException("TODO: implement this after transition from Java2d to LWJGL is completed");
  }

}
