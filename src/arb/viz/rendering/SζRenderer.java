package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.operators.*;
import arb.viz.*;

public class SζRenderer extends
                        ComplexFunctionRenderer
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    try ( SζRenderer plotter = new SζRenderer())
    {
      plotter.render();
      plotter.saveToFile();
    }
  }

  @SuppressWarnings("resource")
  public SζRenderer() throws NoninvertibleTransformException
  {
    super(new Dimension(5000,
                        2500),
          new Rectangle2D.Double(-10,
                                 20,
                                 80,
                                 -40),
          new Composition(new Composition(new SFunction(new Real().set("5", 128)),
                                          (new RiemannζFunction())),
                          new WickRotation()));

    colorMode   = 2;
    displayMode = Part.Imag;
  }

}
