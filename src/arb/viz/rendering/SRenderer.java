package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.awt.geom.Rectangle2D.Double;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.viz.*;

public class SRenderer extends
                       ComplexFunctionRenderer<SFunction>
{

  private static final Double    domain     = new Rectangle2D.Double(-Math.PI * 2,
                                                                     -1.5 * 2,
                                                                     Math.PI * 2 * 2,
                                                                     3 * 2);
  private static final Dimension dimensions = new Dimension(2000 / 2,
                                                            1000 / 2);

  public SRenderer(Dimension screen, Double domain, Real scale) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new SFunction(scale));
  }

  public SRenderer() throws NoninvertibleTransformException
  {
    this(dimensions,
         domain,
         Constants.ONE);
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SRenderer plotter = new SRenderer(dimensions,
                                      domain,
                                      new Real().set(3));

    plotter.colorMode  = 0;
    plotter.displayMode = Part.Blend;
    plotter.render();

  }

}
