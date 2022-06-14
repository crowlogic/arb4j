package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.*;
import arb.operators.ComplexCompositionOperator;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SNewtonRenderer extends
                             ComplexFunctionRenderer<NewtonStep<SFunction>>
{

  public SNewtonRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new NewtonStep<>(new SFunction()));
  }

  public SNewtonRenderer() throws NoninvertibleTransformException
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

    SNewtonRenderer renderer = new SNewtonRenderer();

    renderer.color_mode  = 0;
    renderer.displayMode = Part.Blend;
    renderer.render();
    renderer.saveToFile("SNewton.png");

  }

}
