package arb.viz.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Constants;
import arb.Real;
import arb.ThreadLocalComplex;
import arb.viz.ComplexFunctionPlotter;
import arb.viz.Part;

public class ZetaPlot
{

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double     domain  = new Rectangle2D.Double(0,
                                                            15,
                                                            60,
                                                            -30);

    Dimension              screen  = new Dimension(2500,
                                                   1250);

    ThreadLocalComplex     Z       = new ThreadLocalComplex(2);
    Real                   scale   = new Real().assign(1);

    ComplexFunctionPlotter plotter = new ComplexFunctionPlotter(screen,
                                                                domain,
                                                                (z, order, prec, w) ->
                                                                {
                                                                  return z.mul(Constants.i, prec, w)
                                                                          .ζ(prec, w)
                                                                          .normalize(w);
                                                                });

    plotter.color_mode  = 0;
    plotter.displayMode = Part.Blend;

    plotter.render();
    plotter.saveToFile();

  }
}
