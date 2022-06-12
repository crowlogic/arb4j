package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.complex.*;
import arb.operators.ComplexCompositionOperator;
import arb.viz.ComplexFunctionRenderer;

public class SζRenderer extends
                          ComplexFunctionRenderer
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    SζRenderer plotter = new SζRenderer();
    plotter.render();
    plotter.saveToFile();
  }

  public SζRenderer() throws NoninvertibleTransformException
  {
    super(new Dimension(2500,
                        1250),
          new Rectangle2D.Double(0,
                                 -5,
                                 40,
                                 10),
          new ComplexCompositionOperator(new SFunction(),
                                 new ComplexCompositionOperator(new RiemannZetaFunction(),
                                                        new WickRotation(true))));

    color_mode        = 06;
    displayMode       = arb.viz.Part.Blend;
  }

}
