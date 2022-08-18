package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Real;
import arb.RealConstants;
import arb.functions.complex.SFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SRenderer extends
                       ComplexFunctionRenderer<SFunction>
{

  private static final Double    domain     = new Rectangle2D.Double(-Math.PI ,
                                                                     -1.5 ,
                                                                     Math.PI * 2 ,
                                                                     3 );
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
         RealConstants.one);
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SRenderer plotter = new SRenderer(dimensions,
                                      domain,
                                      RealConstants.one);

    plotter.colorMode   = 2;
    plotter.displayMode = Part.Real;
    plotter.render();

  }

}
