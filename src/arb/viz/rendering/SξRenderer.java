package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.operators.Composition;
import arb.viz.*;

/**
 * Renders the {@link YFunction}
 */
public class SξRenderer extends
                        ComplexFunctionRenderer<Composition<SFunction, RiemannξFunction>>
{
  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException
  {
    SξRenderer renderer = new SξRenderer();
    renderer.render();
  }

  public static final int width  = 1900;
  public static final int height = 950;

  public SξRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-20,
                                 -30,
                                 40,
                                 60),
          Composition.compose(new SFunction(), new RiemannξFunction()));

    colorMode   = 5;
    displayMode = Part.Real;

  }

  public SξRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}