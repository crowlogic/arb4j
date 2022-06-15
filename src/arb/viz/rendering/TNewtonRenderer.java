package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.TFunction;
import arb.functions.complex.dynamics.NewtonStep;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class TNewtonRenderer extends
                             ComplexFunctionRenderer<NewtonStep<TFunction>>
{

  public TNewtonRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new NewtonStep<>(new TFunction()));
  }

  public TNewtonRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500,
                       1300),
         new Rectangle2D.Double(-3,
                                -1.5 * 2,
                                6,
                                3 * 2));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    TNewtonRenderer renderer = new TNewtonRenderer();

    renderer.color_mode  = 1;
    renderer.displayMode = Part.Phase;
    renderer.render();
    renderer.saveToFile("TNewton.png");

  }

}
