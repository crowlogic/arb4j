package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.*;
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
    this(new Dimension(2000,
                       1000),
         new Rectangle2D.Double(-Math.PI * 2,
                                -1.5 * 2,
                                Math.PI * 2 * 2,
                                3 * 2));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SNewtonRenderer renderer = new SNewtonRenderer();

    renderer.color_mode  = 0;
    renderer.displayMode = Part.Blend;
    renderer.render();
    renderer.saveToFile("SNewton.png");

  }

}
