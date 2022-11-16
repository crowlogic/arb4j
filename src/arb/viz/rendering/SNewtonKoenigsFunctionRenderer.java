package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.dynamics.IteratedFunction;
import arb.functions.complex.dynamics.SNewtonMap;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SNewtonKoenigsFunctionRenderer extends
                                            ComplexFunctionRenderer<IteratedFunction<SNewtonMap>>
{

  @SuppressWarnings("resource")
  public SNewtonKoenigsFunctionRenderer(Dimension screen, Double domain)
  {
    super(screen,
          domain,
          new IteratedFunction(new SNewtonMap(),
                               10,
                               true));
  }

  public SNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(1500,
                       1500),
         new Rectangle2D.Double(-2,
                                -2,
                                4,
                                4));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    SNewtonKoenigsFunctionRenderer renderer = new SNewtonKoenigsFunctionRenderer();

    renderer.colorMode   = 1;
    renderer.displayMode = Part.Phase;
    renderer.render();
    renderer.saveToFile("SNewtonKoenigs.png");

  }

}
