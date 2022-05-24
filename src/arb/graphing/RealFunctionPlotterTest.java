package arb.graphing;

import javax.swing.JFrame;

import arb.FloatInterval;
import arb.RealFunction;
import arb.RealPart;
import arb.functions.SFunction;
import junit.framework.TestCase;

public class RealFunctionPlotterTest
{

  public static void main(String args[])
  {
    JFrame              frame    = new JFrame();
    RealFunction        function = new RealPart(new SFunction());   // SineFunction();
    FloatInterval       domain   = new FloatInterval(-5,
                                                     5);
    FloatInterval       range    = new FloatInterval(-2,
                                                     2);
    RealFunctionPlotter plotter  = new RealFunctionPlotter(function,
                                                           domain,
                                                           range,
                                                           200);

    frame.getContentPane().add(plotter.asComponent());
    frame.setTitle(function.getClass().getSimpleName());
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    plotter.addCleanupOnWindowClosingListener(frame);

    frame.pack();
    frame.setVisible(true);

  }
}
