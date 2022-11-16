package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.SFunction;
import arb.functions.complex.numbertheoretic.RiemannξFunction;
import arb.operators.CompositionOperator;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link CompositionOperator} of the {@link SFunction} and the
 * {@link RiemannξFunction}
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

  public SξRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(1900,
                        950),
          new Rectangle2D.Double(-20,
                                 -30,
                                 40,
                                 60),
          CompositionOperator.compose(new SFunction(vscale), new RiemannξFunction()));

    colorMode   = 5;
    displayMode = Part.Real;

  }

  public SξRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",
                  128));
  }

}