package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;

import arb.RealConstants;
import arb.functions.complex.*;
import arb.functions.complex.hyperbolic.HyperbolicCosine;
import arb.operators.Composition;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SCoshRenderer
{
  private static JFrame frame;

  static TFunction      T = new TFunction(RealConstants.one);

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double      domain    = new Rectangle2D.Double(-10,
                                                               -2,
                                                               20,
                                                               4);

    Dimension               screen    = new Dimension(2560,
                                                      1440);

    SFunction               sFunction = new SFunction();

    HolomorphicFunction         function  = (new Composition(sFunction,
                                                         new Composition(new HyperbolicCosine(),
                                                                         new WickRotation())));

    ComplexFunctionRenderer plotter   = new ComplexFunctionRenderer(screen,
                                                                    domain,
                                                                    function);

    plotter.displayMode = Part.Phase;
    plotter.render();

  }

}