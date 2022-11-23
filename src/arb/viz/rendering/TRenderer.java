package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.functions.complex.TFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class TRenderer extends
                       ComplexFunctionRenderer<TFunction>
{

  public TRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new TFunction());
  }

  public TRenderer() throws NoninvertibleTransformException
  {
    this(new Dimension(1000,
                       1000),
         new Rectangle2D.Double(-1.5,
                                -1.5 ,
                                3,
                                3));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    TRenderer plotter = new TRenderer();
    plotter.colorMode   = 0;
    plotter.displayMode = Part.Blend;
    plotter.render();

  }

}
