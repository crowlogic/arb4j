package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.viz.*;

public class ζRenderer
{

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-1,
                                                       0,
                                                       1,
                                                       -50);

    Dimension          screen = new Dimension(2500,
                                              1250);

    ThreadLocalComplex Z      = new ThreadLocalComplex(2);

    try ( ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                        domain,
                                                                        new RiemannZetaFunction()))
    {
      plotter.colorMode   = 0;
      plotter.displayMode = Part.Phase;

      plotter.render();
      plotter.saveToFile();
    }

  }
}
