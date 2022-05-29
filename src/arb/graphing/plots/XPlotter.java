/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;

import arb.Constants;
import arb.Real;
import arb.functions.complex.XFunction;
import arb.graphing.ComplexFunctionPlotter;
import arb.graphing.Part;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionPlotter}
 */
public class XPlotter extends
                      ComplexFunctionPlotter<XFunction>
{

  public static final int width  = 2500 ;
  public static final int height = 1250  ;

  public XPlotter(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -7.5 * 5,
                                 80,
                                 15 * 5),
          new XFunction(vscale));

    color_mode  = 5;
    displayMode = Part.Blend;

  }

  public XPlotter() throws NoninvertibleTransformException
  {
    this(Constants.ONE);
  }

}