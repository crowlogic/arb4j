package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.awt.geom.Rectangle2D.Double;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import arb.functions.complex.SFunction;
import arb.graphing.ComplexFunctionPlotter;
import arb.graphing.Part;

public class SPlotter extends
                      ComplexFunctionPlotter<SFunction>
{

  public SPlotter(Dimension screen, Double domain) throws NoninvertibleTransformException
  {
    super(screen,
          domain,
          new SFunction());
  }

  public SPlotter() throws NoninvertibleTransformException
  {
    this(new Dimension(2000 ,
                       1000 ),
         new Rectangle2D.Double(-Math.PI*2,
                                -1.5*2,
                                Math.PI * 2*2,
                                3*2));
  }

  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {

    try ( SPlotter plotter = new SPlotter()
    {
      @Override
      public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
      {

        throw new UnsupportedOperationException("Replacing with Newton flow");
        // return sfunc.SNewtonIter(t, n);

      }
    })
    {

      plotter.color_mode  = 0;
      plotter.displayMode = Part.Blend;
      plotter.render();

    }

  }

}
