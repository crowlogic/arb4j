package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.NewtonFlow;
import arb.functions.complex.dynamics.SNewtonMap;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SNewtonRenderer extends
                             ComplexFunctionRenderer<SNewtonMap>
{

  public SNewtonRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new SNewtonMap());
  }

  public SNewtonRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2560 / 4,
                       1440 / 4),
         new Rectangle2D.Double(-3,
                                -3,
                                6,
                                6));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SNewtonRenderer renderer = new SNewtonRenderer();

    renderer.colorMode   = 0;
    renderer.displayMode = Part.Real;
    renderer.render();
    renderer.saveToFile("SNewton.png");

  }

}
