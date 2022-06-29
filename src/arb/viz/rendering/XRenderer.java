package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.viz.*;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionRenderer}
 */
public class XRenderer extends
                       ComplexFunctionRenderer<NewtonFlow<XFunction>>
{

  @SuppressWarnings("resource")
  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {
    XRenderer r = new XRenderer();
    r.render();
    r.saveToFile("X.png");
  }

  public static final int width  = (int) (2500 * 0.7);
  public static final int height = (int) (1250 * 0.7);

  public XRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -Math.PI * 8,
                                 50,
                                 Math.PI * 16),
          new NewtonFlow(new XFunction(vscale))
          {

            @Override
            public Complex evaluate(Complex z, int order, int prec, Complex w)
            {
              super.evaluate(z, order, prec, w);
              Constants.ONE.div(w, prec, w );
              // w.sub(z, prec, w);
              return w;
            }
          });

    colorMode   = 0;
    displayMode = Part.Real;

  }

  @SuppressWarnings("resource")
  public XRenderer() throws NoninvertibleTransformException
  {
    this(new Real().set("3", 128));
  }

}