package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Real;
import arb.functions.complex.*;
import arb.functions.complex.numbertheoretic.RiemannζFunction;
import arb.operators.Composition;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class SζRenderer extends
                        ComplexFunctionRenderer<Composition<Composition<SFunction, RiemannζFunction>, WickRotation>>
{
  public static void main(String[] args) throws IOException, NoninvertibleTransformException
  {
    try ( SζRenderer plotter = new SζRenderer())
    {
      plotter.render();
      plotter.saveToFile();
    }
  }

  @SuppressWarnings("resource")
  public SζRenderer() throws NoninvertibleTransformException
  {
    super(new Dimension(3600,
                        1800),
          new Rectangle2D.Double(-10,
                                 20,
                                 60,
                                 -30),
          new Composition<>(new Composition<>(new SFunction(new Real().set("1", 128)),
                                              new RiemannζFunction()),
                            new WickRotation()));

    colorMode   = 0;
    displayMode = Part.Real;
  }

}
