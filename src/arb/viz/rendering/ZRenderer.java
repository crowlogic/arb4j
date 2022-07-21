package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.complex.ZFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class ZRenderer
{

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-60,
                                                       -50,
                                                       120,
                                                       100);
    Dimension          screen = new Dimension(2400 / 2,
                                              1200 / 2);

//    ComplexFunction normalizedHardyZFunction = (z, order, prec, w) ->
//    {
//      ZFunction.Z(z, 2, w, Complex.defaultPrec);
//      return w.normalize(w);
//    };
    ZFunction          func   = new ZFunction();
    try ( ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                        domain,
                                                                        func))
    {
      plotter.colorMode   = 1;

      plotter.displayMode = Part.Phase;
      plotter.render();
    }

  }
}