package arb.viz.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import arb.functions.complex.SFunction;
import arb.functions.complex.TFunction;
import arb.viz.ComplexFunctionPlotter;
import arb.viz.Part;

public class TPlotter extends
                      ComplexFunctionPlotter<TFunction>
{

  public TPlotter(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new TFunction());
  }

  public TPlotter() throws NoninvertibleTransformException
  {
    this(new Dimension(2000 / 2,
                       1000 / 2),
         new Rectangle2D.Double(-Math.PI * 2,
                                -1.5 * 2,
                                Math.PI * 2 * 2,
                                3 * 2));
  }

  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    try ( TPlotter plotter = new TPlotter()
    {
      @Override
      public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
      {

        throw new UnsupportedOperationException("Replacing with Newton flow");
        // return sfunc.SNewtonIter(t, n);

      }
    })
    {

      plotter.color_mode  = 1;
      plotter.displayMode = Part.Blend;
      plotter.render();
      

    }

  }

}
