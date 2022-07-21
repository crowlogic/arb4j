package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.RiemannξFunction;
import arb.functions.complex.YFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link YFunction}
 */
public class ξRenderer extends
                       ComplexFunctionRenderer<RiemannξFunction>
{
  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException
  {
    ξRenderer renderer = new ξRenderer();
    renderer.render();
  }

  public static final int width  = 1900 / 2;
  public static final int height = 950 / 2;

  public ξRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-20,
                                 -30,
                                 40,
                                 120),
          new RiemannξFunction());

    colorMode   = 5;
    displayMode = Part.Real;

  }

  public ξRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}