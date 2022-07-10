package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.awt.geom.Rectangle2D.Double;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.viz.*;

public class XNewtonKoenigsFunctionRenderer extends
                                            ComplexFunctionRenderer<IteratedFunction<SNewtonMap>>
{

  public XNewtonKoenigsFunctionRenderer(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new IteratedFunction(new NewtonMap(new YFunction(new Real("1", 128))),
                               3,
                               true) {

                                @Override
                                public Complex evaluate(Complex z, int order, int prec, Complex w)
                                {
                                  super.evaluate(z, order, prec, w);
                                  //w.sub(z, prec, w);
                                  return w;
                                }} );
  }

  public XNewtonKoenigsFunctionRenderer() throws NoninvertibleTransformException
  {

    this(new Dimension(2500/2,
                       1250/2),
         new Rectangle2D.Double(-5,
                                -10,
                                50,
                                20));
  }

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    XNewtonKoenigsFunctionRenderer renderer = new XNewtonKoenigsFunctionRenderer();

    renderer.colorMode   = 0;
    renderer.displayMode = Part.Real;
    renderer.render();
    renderer.saveToFile();

  }

}
