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
  public static void main(String[] args) throws IOException, NoninvertibleTransformException
  {
    System.loadLibrary("arblib");
    XRenderer r = new XRenderer();
    r.displayMode = Part.Real;
    r.colorMode   = 4;
    r.render();
    r.saveToFile("X-Real.png");
  }

  public XRenderer(Real vscale)
  {
    super(new Dimension((int) (2400 * 1.1),
                        (int) (1200 * 1.1)),
          new Rectangle2D.Double(-50,
                                 -25,
                                 100,
                                 50),
          new XFunction(vscale));

    colorMode   = 0;
    displayMode = Part.Phase;

  }

  @SuppressWarnings("resource")
  public XRenderer() throws NoninvertibleTransformException
  {
    this(new Real("1",
                  128));
  }

}