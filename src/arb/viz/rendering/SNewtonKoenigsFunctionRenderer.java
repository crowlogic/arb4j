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
  public SNewtonKoenigsFunctionRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new IteratedFunction(new SNewtonMap(new Real().pi(256)),
                               7,
                               true));
  }

  public SNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500,
                       1250),
         new Rectangle2D.Double(-2,
                                -0.5,
                                1.5,
                                1));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SNewtonKoenigsFunctionRenderer renderer = new SNewtonKoenigsFunctionRenderer();

    renderer.colorMode   = 1;
    renderer.displayMode = Part.Phase;
    renderer.render();
    renderer.saveToFile("SNewtonKoenigs.png");

  }

}
