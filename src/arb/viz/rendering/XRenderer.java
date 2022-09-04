package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.numbertheoretic.XFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionRenderer}
 */
public class XRenderer extends
                       ComplexFunctionRenderer<XFunction>
{

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    System.loadLibrary("arblib");
    XRenderer r = new XRenderer();
    r.displayMode = Part.Real;
    r.colorMode   = 4;
    r.render();
    r.saveToFile("X-Real.png");
  }

  public static final int width  = (int) (2400 * 1.1);
  public static final int height = (int) (1200 * 1.1);

  public XRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-15,
                                 -12.5,
                                 50 * 1.4,
                                 25 * 1.4),
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