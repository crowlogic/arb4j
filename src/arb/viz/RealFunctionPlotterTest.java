package arb.viz;

import javax.swing.JFrame;

import arb.FloatInterval;
import arb.functions.complex.*;
import arb.functions.real.RealFunction;
import arb.functions.real.RealPart;

public class RealFunctionPlotterTest
{

  public static void main(String args[])
  {
    JFrame              frame    = new JFrame();
    // RealFunction function = new RealPart(new SFunction()); // SineFunction();
    RealFunction        function = new RealPart(new CircleS());
    FloatInterval       domain   = new FloatInterval(-Math.PI*2,
                                                     Math.PI*2);
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
