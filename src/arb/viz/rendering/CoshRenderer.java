package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;

import arb.Constants;
import arb.functions.complex.*;
import arb.viz.ComplexFunctionRenderer;

public class CoshRenderer
{
  private static JFrame frame;

 
  static TFunction T = new TFunction(Constants.ONE);

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-1.5,
                                                       -6,
                                                       4,
                                                       50);

    Dimension screen = new Dimension(600,
                                     1200);

    SFunction sFunc = new SFunction();
    ComplexFunction function = (z, order, prec, w) ->
    {
      z.getReal().sub(Constants.HALF, prec, z.getReal());
      z.cosh(prec, w).mul(Constants.i, prec, w);
      return sFunc.evaluate(w, order, prec, w);

    };

    ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                domain,
                                                                function);

    plotter.color_mode = 0;

    frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(screen);
    frame.setPreferredSize(screen);
    frame.setLocationRelativeTo(null);
    frame.setContentPane(plotter);
    frame.pack();
    frame.setResizable(false);
    frame.setVisible(true);
    plotter.displayMode = arb.viz.Part.Blend;
    plotter.render();

  }

}