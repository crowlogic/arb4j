package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.awt.geom.Rectangle2D.Double;
import java.io.*;

import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.viz.*;

public class TNewtonRenderer extends
                             ComplexFunctionRenderer<NewtonFlow<XFunction>>
{

  public TNewtonRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new NewtonFlow<>(new XFunction()));
  }

  public TNewtonRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500/2,
                       1300/2),
         new Rectangle2D.Double(10,
                                -5,
                                15,
                                10));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    TNewtonRenderer renderer = new TNewtonRenderer();

    renderer.colorMode  = 1;
    renderer.displayMode = Part.Real;
    renderer.render();
    renderer.saveToFile("TNewton.png");
    renderer.image.check();

  }

}
