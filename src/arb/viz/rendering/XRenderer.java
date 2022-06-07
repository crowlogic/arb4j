package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.*;

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

  @SuppressWarnings("resource")
  public static void main(String args[] ) throws IOException, NoninvertibleTransformException
  {
    XRenderer r = new XRenderer();
    r.render();
    r.saveToFile("X.png");
  }
  

  public static final int width  = 2500/2; 
  public static final int height = 1250/2;

  public XRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -7.5 * 2.5,
                                 80,
                                 15 * 3),
          new XFunction(vscale));

    color_mode  = 6;
    displayMode = Part.Real;

  }

  @SuppressWarnings("resource")
  public XRenderer() throws NoninvertibleTransformException
  {
    this(new Real().set("2", 128));
  }

}