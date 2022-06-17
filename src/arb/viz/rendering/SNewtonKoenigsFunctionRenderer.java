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

public class SNewtonKoenigsFunctionRenderer extends
                                            ComplexFunctionRenderer<IteratedFunction<SNewtonMap>>
{

  public SNewtonKoenigsFunctionRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new IteratedFunction(new SNewtonMap(),
                               5,
                               true));
  }

  public SNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500*2,
                       1300*2),
         new Rectangle2D.Double(-2.3,
                                -1.7,
                                4.6,
                                3.4));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    SNewtonKoenigsFunctionRenderer renderer = new SNewtonKoenigsFunctionRenderer();

    renderer.colorMode  = 6;
    renderer.displayMode = Part.Phase;
    renderer.render();
    renderer.saveToFile("SNewtonKoenigs.png");

  }

}
