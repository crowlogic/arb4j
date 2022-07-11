package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import javax.swing.*;

import arb.*;
import arb.functions.complex.*;
import arb.operators.*;
import arb.viz.*;

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

    ComplexFunction         function  = (new CompositionOperator(sFunction,
                                                                 new CompositionOperator(new HyperbolicCosine(),
                                                                                         new WickRotation())));

    ComplexFunctionRenderer plotter   = new ComplexFunctionRenderer(screen,
                                                                    domain,
                                                                    function);

    plotter.displayMode = Part.Phase;
    plotter.render();

  }

}