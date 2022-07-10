package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Constants;
import arb.functions.complex.*;
import arb.operators.*;
import arb.viz.ComplexFunctionRenderer;

public class CoshRenderer
{

 
  static TFunction T = new TFunction(Constants.ONE);

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-1.5,
                                                       -2,
                                                       20,
                                                       4);

    Dimension screen = new Dimension(1200,
                                     600);

   ComplexFunction function = new CompositionOperator(new HyperbolicCosine(), new WickRotation() );
   // ComplexFunction function = new HyperbolicCosine();
//    ComplexFunction function = (z, order, prec, w) ->
//    {
//      z.getReal().sub(Constants.HALF, prec, z.getReal());
//      return z.cosh(prec, w).mul(Constants.i, prec, w);
//    };

    ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                domain,
                                                                function);

    plotter.colorMode = 0;

    
    plotter.displayMode = arb.viz.Part.Phase;
    plotter.render();
    plotter.saveToFile("cosh.png");

  }

}