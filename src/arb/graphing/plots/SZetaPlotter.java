package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.complex.ComplexComposition;
import arb.functions.complex.RiemannZetaFunction;
import arb.functions.complex.SFunction;
import arb.functions.complex.WickRotation;
import arb.graphing.ComplexFunctionPlotter;

public class SZetaPlotter extends
                          ComplexFunctionPlotter
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    SZetaPlotter plotter = new SZetaPlotter();
    plotter.plot();
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
          new ComplexComposition(new SFunction(),
                                 new ComplexComposition(new RiemannZetaFunction(),
                                                        new WickRotation(true))));

    color_mode        = 06;
    displayMode       = arb.graphing.Part.Blend;
  }

}
