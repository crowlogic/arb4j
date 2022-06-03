package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;

import arb.Constants;
import arb.Real;
import arb.functions.complex.XFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionRenderer}
 */
public class XRenderer extends
                       ComplexFunctionRenderer<XFunction>
{

  public static final int width  = 2500 / 4;
  public static final int height = 1250 / 4;

  public XRenderer(Real vscale) throws NoninvertibleTransformException
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

  public XRenderer() throws NoninvertibleTransformException
  {
    this(Constants.ONE);
  }

}