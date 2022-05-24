package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.ComplexComposition;
import arb.functions.RiemannZetaFunction;
import arb.functions.SFunction;
import arb.functions.WickRotation;
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
    bilinearSmoothing = false;
    displayMode       = arb.functions.Part.Blend;
  }

}
