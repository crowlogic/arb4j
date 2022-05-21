package arblib.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;

import arblib.Complex;
import arblib.ComplexFunction;
import arblib.ThreadLocalComplex;
import arblib.functions.Part;
import arblib.functions.ZFunction;
import arblib.graphing.ComplexFunctionPlotter;

public class ZPlot
{
  private static JFrame frame;

  static
  {
    System.loadLibrary("arblib");
  }

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-60,
                                                       -100,
                                                       120,
                                                       200);
    Dimension screen = new Dimension(2400/4,
                                     1200/4);

    ThreadLocalComplex Z = new ThreadLocalComplex(2);

    ComplexFunction normalizedHardyZFunction = (z, order, prec, w) ->
    {
      ZFunction.Z(z, 2, w, Complex.defaultPrec);
      return w.normalize(w);
    };
    ComplexFunctionPlotter plotter = new ComplexFunctionPlotter(screen,
                                                                domain,
                                                                normalizedHardyZFunction);

    plotter.color_mode = 1;

    frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(screen.width, screen.height);
    frame.setVisible(true);
    frame.setContentPane(plotter);
    plotter.displayMode = Part.Imag;
    plotter.plot();

  }
}