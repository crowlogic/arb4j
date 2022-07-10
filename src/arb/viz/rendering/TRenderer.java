package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.awt.geom.Rectangle2D.Double;
import java.io.*;

import arb.functions.complex.*;
import arb.viz.*;

public class TRenderer extends
                      ComplexFunctionRenderer<TFunction>
{

  public TRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new TFunction());
  }

  public TRenderer() throws NoninvertibleTransformException
  {
    this(new Dimension(2000 / 2,
                       1000 / 2),
         new Rectangle2D.Double(-Math.PI * 2,
                                -1.5 * 2,
                                Math.PI * 2 * 2,
                                3 * 2));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    TRenderer plotter = new TRenderer();
    plotter.colorMode  = 0;
    plotter.displayMode = Part.Blend;
    plotter.render();

  }

}
