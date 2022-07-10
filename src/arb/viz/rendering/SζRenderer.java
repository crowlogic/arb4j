package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.*;
import arb.operators.CompositionOperator;
import arb.viz.ComplexFunctionRenderer;

public class SζRenderer extends
                        ComplexFunctionRenderer
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    try ( SζRenderer plotter = new SζRenderer())
    {
      plotter.render();
      plotter.saveToFile();
    }
  }

  @SuppressWarnings("resource")
  public SζRenderer() throws NoninvertibleTransformException
  {
    super(new Dimension(5000,
                        2500),
          new Rectangle2D.Double(-10,
                                 20,
                                 80,
                                 -40),
          new CompositionOperator(new CompositionOperator(new SFunction(new Real().set("5", 128)),
                                                          (new RiemannZetaFunction())),
                                  new WickRotation()));

    colorMode   = 2;
    displayMode = arb.viz.Part.Imag;
  }

}
