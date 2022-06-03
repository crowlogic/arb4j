package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;

import arb.Constants;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.SFunction;
import arb.functions.complex.TFunction;
import arb.viz.*;

public class SCoshRenderer
{
  private static JFrame frame;

  static TFunction T = new TFunction(Constants.ONE);

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-1.5,
                                                       -6,
                                                       30,
                                                       30);

    Dimension screen = new Dimension(600,
                                     1200);

    TFunction sFunction = new TFunction();
    
    ComplexFunction function = (z, order, prec, w) ->
    {
      z.getReal().sub(Constants.HALF, prec, z.getReal());
      z.cosh(prec, w).mul(Constants.i, prec, w);
      // TFunction.T(z, w, Constants.ONE, 2, false, prec, w);
      return sFunction.evaluate(w, 2, prec, w);

    };

    ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                domain,
                                                                function);

   
    plotter.displayMode = Part.Blend;
    plotter.render();

  }

}