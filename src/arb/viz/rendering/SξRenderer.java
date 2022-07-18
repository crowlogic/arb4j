package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.operators.CompositionOperator;
import arb.viz.*;

/**
 * Renders the {@link YFunction}
 */
public class SξRenderer extends
                        ComplexFunctionRenderer<CompositionOperator<SFunction, RiemannξFunction>>
{
  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException
  {
    SξRenderer renderer = new SξRenderer();
    renderer.render();
  }

  public static final int width  = 1900 / 2;
  public static final int height = 950 / 2;

  public SξRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-20,
                                 -30,
                                 40,
                                 120),
          new CompositionOperator<>(new SFunction(),
                                    new RiemannξFunction()));

    colorMode   = 5;
    displayMode = Part.Real;

  }

  public SξRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}