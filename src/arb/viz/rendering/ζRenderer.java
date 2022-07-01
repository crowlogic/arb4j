package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.*;
import arb.functions.complex.*;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class ζRenderer
{

  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double     domain  = new Rectangle2D.Double(-1,
                                                            0,
                                                            1,
                                                            -50);

    Dimension              screen  = new Dimension(2500,
                                                   1250);

    ThreadLocalComplex     Z       = new ThreadLocalComplex(2);
    Real                   scale   = new Real().set(1);

    ComplexFunctionRenderer plotter = new ComplexFunctionRenderer(screen,
                                                                domain,
                                                                new RiemannZetaFunction());

    plotter.colorMode  = 0;
    plotter.displayMode = Part.Phase;

    plotter.render();
    plotter.saveToFile();

  }
}
