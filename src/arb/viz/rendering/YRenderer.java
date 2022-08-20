package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.numbertheoretic.YFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link YFunction}
 */
public class YRenderer extends
                       ComplexFunctionRenderer<YFunction>
{
  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException
  {
    YRenderer renderer = new YRenderer();
    renderer.displayMode = Part.Phase;
    renderer.render();
  }

  public static final int height = (int) 1400;
  public static final int width  = (int) 3400;

  public YRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -24,
                                 30 * (double) ((double) width / (double) height),
                                 30),
          new YFunction(vscale));

    colorMode   = 4;
    displayMode = Part.Imaginary;
  }

  public YRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}