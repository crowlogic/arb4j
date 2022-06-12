package arb.viz;

import javax.swing.JFrame;

import arb.FloatInterval;
import arb.functions.complex.CircleS;
import arb.functions.real.RealPart;

public class RealFunctionPlotterTest
{

  public static void main(String args[])
  {
    JFrame              frame    = new JFrame();
    // RealFunction function = new RealPart(new SFunction()); // SineFunction();
    RealPart<CircleS>        function = new RealPart(new CircleS());
    function.func.f.scale.set("0.1", 128);
    FloatInterval       domain   = new FloatInterval(-Math.PI,
                                                     Math.PI);
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
