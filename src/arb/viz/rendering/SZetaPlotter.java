package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.complex.RiemannZetaFunction;
import arb.functions.complex.SFunction;
import arb.functions.complex.WickRotation;
import arb.operators.ComplexCompositionOperator;
import arb.viz.ComplexFunctionPlotter;

public class SZetaPlotter extends
                          ComplexFunctionPlotter
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    SZetaPlotter plotter = new SZetaPlotter();
    plotter.render();
    plotter.saveToFile();
  }

  public SZetaPlotter() throws NoninvertibleTransformException
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
