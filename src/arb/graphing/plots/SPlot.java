package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import arb.functions.complex.SFunction;
import arb.graphing.ComplexFunctionPlotter;
import arb.graphing.Part;

public class SPlot
{


  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {
    Rectangle2D.Double domain = new Rectangle2D.Double(-Math.PI,
                                                       -1.5,
                                                       Math.PI * 2,
                                                       3);
    Dimension          screen = new Dimension(2000/4,
                                              1000/4);

    final int          prec   = 512;

    int                n      = 10;

    SFunction          sfunc  = new SFunction(new Real().assign(5));

    // How To Find and Fix Memory Leaks:
    // Make the C code call back to a Java class which does the allocation and
    // records it,  and also records the reallocations and deallocations then, at the end of this function , after the frame that contains the rendered surface is hidden, examine
    // the remaining entries in the heap to see which ones haven't been freed yet. the native part of the code that installs the flint memory handlers as in init.i

    try ( ComplexFunctionPlotter plotter = new ComplexFunctionPlotter(screen,
                                                                      domain,
                                                                      sfunc)
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
      arb.arb.flint_cleanup();
      arb.arb.flint_cleanup_master();
      System.exit(1);
      
    }
    
  }

}
