package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;

import arb.ThreadLocalComplex;
import arb.functions.complex.ZFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class ZRenderer
{
  private static JFrame frame;

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-60,
                                                       -100,
                                                       120,
                                                       200);
    Dimension screen = new Dimension(2400/4,
                                     1200/4);

    ThreadLocalComplex Z = new ThreadLocalComplex(2);

//    ComplexFunction normalizedHardyZFunction = (z, order, prec, w) ->
//    {
//      ZFunction.Z(z, 2, w, Complex.defaultPrec);
//      return w.normalize(w);
//    };
    ZFunction func = new ZFunction();
    ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                domain,
                                                                func);

    plotter.color_mode = 1;

    frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(screen.width, screen.height);
    frame.setVisible(true);
    frame.setContentPane(plotter);
    plotter.displayMode = Part.Imag;
    plotter.render();

  }
}