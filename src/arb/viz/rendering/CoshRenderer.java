package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.operators.*;
import arb.viz.*;

public class CoshRenderer
{

  static TFunction T = new TFunction(RealConstants.one);

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain   = new Rectangle2D.Double(-1.5,
                                                         -2,
                                                         20,
                                                         4);

    Dimension          screen   = new Dimension(1200,
                                                600);

    ComplexFunction    function = new Composition(new HyperbolicCosine(),
                                                  new WickRotation());
    // ComplexFunction function = new HyperbolicCosine();
//    ComplexFunction function = (z, order, prec, w) ->
//    {
//      z.getReal().sub(RealConstants.HALF, prec, z.getReal());
//      return z.cosh(prec, w).mul(RealConstants.i, prec, w);
//    };

    try ( ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                        domain,
                                                                        function))
    {
      plotter.colorMode   = 0;

      plotter.displayMode = Part.Phase;
      plotter.render();
      plotter.saveToFile("cosh.png");
    }

  }

}