package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.*;
import arb.functions.complex.numbertheoretic.*;
import arb.operators.Composition;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

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