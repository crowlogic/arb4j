package arblib.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.JScrollPane;

import arblib.Complex;
import arblib.Constants;
import arblib.Real;
import arblib.functions.Part;
import arblib.functions.SFunction;
import arblib.graphing.ComplexFunctionPlotter;

public class SPlot
{


  static
  {
    System.loadLibrary("arblib");
  }


  public static void main(String args[]) throws IOException, NoninvertibleTransformException
  {

    Rectangle2D.Double domain = new Rectangle2D.Double(-Math.PI,
                                                       -1.5,
                                                       Math.PI * 2,
                                                       3);
    Dimension          screen = new Dimension(2000,
                                              1000);


    final int              prec          = 512;

    int                    n             = 10;

    // the multiplier of the Newton map of T is equal to 1/2 and thus we divide by
    // (1/2)^n which is the same as multiplying by 2^n
    final int              normalization = (int) Math.pow(2, n);

    SFunction              sfunc         = new SFunction(new Real().assign(5));
    
    ComplexFunctionPlotter plotter       = new ComplexFunctionPlotter(screen,
                                                                      domain,
                                                                      sfunc)
                                         {
                                           @Override
                                           public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
                                           {

                                             throw new UnsupportedOperationException( "Replacing with Newton flow");
                                            // return sfunc.SNewtonIter(t, n);

                                           }
                                         };

    plotter.color_mode = 0;

    plotter.displayMode = Part.Blend;
    plotter.plot();
  }

}
