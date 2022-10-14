package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import arb.functions.complex.dynamics.IteratedFunction;
import arb.functions.complex.dynamics.NewtonMap;
import arb.functions.complex.numbertheoretic.XFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class XNewtonKoenigsFunctionRenderer extends
                                            ComplexFunctionRenderer<IteratedFunction<NewtonMap<XFunction>>>
{

  public XNewtonKoenigsFunctionRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new IteratedFunction(new NewtonMap(new XFunction(new Real("1",
                                                                    128))),
                               3,
                               true)
          {

            @Override
            public Complex evaluate(Complex z, int order, int prec, Complex w)
            {
              super.evaluate(z, order, prec, w);
              return w;
            }
          });
  }

  public XNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension((int) (1000 ),
                       (int) (1000 )),
         new Rectangle2D.Double(-5,
                                -20,
                                40,
                                40));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    XNewtonKoenigsFunctionRenderer renderer = new XNewtonKoenigsFunctionRenderer();

    renderer.colorMode   = 1;
    renderer.displayMode = Part.Phase;
    renderer.render();
    renderer.saveToFile();

  }

}
