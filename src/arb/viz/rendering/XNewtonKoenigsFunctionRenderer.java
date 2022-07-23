package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import arb.functions.complex.YFunction;
import arb.functions.complex.dynamics.*;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

public class XNewtonKoenigsFunctionRenderer extends
                                            ComplexFunctionRenderer<IteratedFunction<SNewtonMap>>
{

  public XNewtonKoenigsFunctionRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new IteratedFunction(new NewtonMap(new YFunction(new Real("1",
                                                                    128))),
                               3,
                               true)
          {

            @Override
            public Complex evaluate(Complex z, int order, int prec, Complex w)
            {
              super.evaluate(z, order, prec, w);
              // w.sub(z, prec, w);
              return w;
            }
          });
  }

  public XNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension((int)(2500 / 1.5),
                       (int)(1250 / 1.5)),
         new Rectangle2D.Double(-5,
                                -10,
                                50,
                                20));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    XNewtonKoenigsFunctionRenderer renderer = new XNewtonKoenigsFunctionRenderer();

    renderer.colorMode   = 2;
    renderer.displayMode = Part.Real;
    renderer.render();
    renderer.saveToFile();

  }

}
