package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.functions.complex.elliptic.RealQuarterPeriod;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class KRenderer extends
                       ComplexFunctionRenderer
{

  @SuppressWarnings("resource")
  public static void main(String args[]) throws NoninvertibleTransformException, IOException, InterruptedException
  {

    ComplexFunctionRenderer plotter = new KRenderer();

    plotter.colorMode   = 0;

    plotter.displayMode = Part.Blend;
    plotter.keepRunning = true;
    plotter.render();

  }

  public KRenderer() throws NoninvertibleTransformException
  {
    domain     = new Rectangle2D.Double(-Math.PI * 5,
                                        -Math.PI * 5,
                                        Math.PI * 10,
                                        Math.PI * 10);
    resolution = new Dimension(2000,
                               1000);

    final int prec = 512;

    int       n    = 10;

    colorMode = 6;

    function  = new RealQuarterPeriod();

    init();
  }

}
