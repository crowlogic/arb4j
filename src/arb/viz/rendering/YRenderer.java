package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.dynamics.NewtonFlow;
import arb.functions.complex.numbertheoretic.YFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link YFunction}
 */
public class YRenderer extends
                       ComplexFunctionRenderer<NewtonFlow<YFunction>>
{
  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException
  {
    YRenderer renderer = new YRenderer();
    renderer.displayMode = Part.Phase;
    renderer.render();
  }

  public static final int height = 1000;
  public static final int width  = height*2;

  public YRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -24,
                                 48*2,
                                 48),
          new NewtonFlow<YFunction>(new YFunction(vscale)));

    colorMode   = 4;
    displayMode = Part.Imag;

  }

  public YRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}