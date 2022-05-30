package arb.viz.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Complex;
import arb.functions.complex.elliptic.RealQuarterPeriod;
import arb.viz.ComplexFunctionPlotter;
import arb.viz.Part;

public class KPlot extends
                   ComplexFunctionPlotter
{

  public static void main(String args[]) throws NoninvertibleTransformException, IOException, InterruptedException
  {

    // How To Find and Fix Memory Leaks:
    // Make the C code call back to a Java class which does the allocation and
    // records it, and also records the reallocations and deallocations then, at the
    // end of this function , after the frame that contains the rendered surface is
    // hidden, examine
    // the remaining entries in the heap to see which ones haven't been freed yet.
    // the native part of the code that installs the flint memory handlers as in
    // init.i

    try ( ComplexFunctionPlotter plotter = new KPlot()
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
      plotter.keepRunning = true;
      plotter.render();
      while (plotter.frame.isVisible())
      {
        Thread.sleep(1000);
      }
      System.out.println("Now, examine the heap to see what has yet to be freed");

    }
  }

  public KPlot() throws NoninvertibleTransformException
  {
    domain = new Rectangle2D.Double(-Math.PI*5,
                                    -Math.PI*5,
                                    Math.PI*10,
                                    Math.PI*10);
    resolution = new Dimension(2000,
                           1000);

    final int prec = 512;

    int       n    = 10;

    color_mode = 6;
    
    function = new RealQuarterPeriod();

    init();
  }

}
