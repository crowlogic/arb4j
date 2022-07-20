package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.viz.*;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionRenderer}
 */
public class XRenderer extends
                       ComplexFunctionRenderer<XFunction>
{

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    XRenderer r = new XRenderer();
    r.render();
    r.saveToFile("X.png");
  }

  public static final int width  = (int) (2500 * 0.4);
  public static final int height = (int) (1250 * 0.4);

  public XRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -Math.PI * 8,
                                 50,
                                 Math.PI * 16),
          new XFunction(vscale));

    colorMode   = 0;
    displayMode = Part.Phase;

  }

  @SuppressWarnings("resource")
  public XRenderer() throws NoninvertibleTransformException
  {
    this(new Real().set("1", 128));
  }

}