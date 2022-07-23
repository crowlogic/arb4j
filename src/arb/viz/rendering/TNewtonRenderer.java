package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.dynamics.NewtonFlow;
import arb.functions.complex.numbertheoretic.TFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class TNewtonRenderer extends
                             ComplexFunctionRenderer<NewtonFlow<TFunction>>
{

  public TNewtonRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new NewtonFlow<>(new TFunction()));
  }

  public TNewtonRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500 / 2,
                       1300 / 2),
         new Rectangle2D.Double(-2.5,
                                -2.5,
                                5,
                                5));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    TNewtonRenderer renderer = new TNewtonRenderer();

    renderer.colorMode   = 1;
    renderer.displayMode = Part.Real;
    renderer.render();
    renderer.saveToFile("TNewton.png");

  }

}
