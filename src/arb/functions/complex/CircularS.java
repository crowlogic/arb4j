package arb.functions.complex;

import static arb.Constants.*;

import javax.swing.JFrame;

import arb.*;
import arb.curves.ComplexCircle;
import arb.functions.real.RealFunction;
import arb.functions.real.RealPart;
import arb.functions.real.dynamics.RealNewtonMap;
import arb.viz.RealFunctionPlotter;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircularS extends
                     CircularComposition<SFunction>
{

  @SuppressWarnings("resource")
  public static void main(String args[])
  {
    JFrame              frame    = new JFrame();
    RealFunction        function = new RealNewtonMap(new RealPart(new CircularS(new Real().set("1", 128),
                                                                              new Real().set("0.5", 128))));

    FloatInterval       domain   = new FloatInterval(-Math.PI,
                                                     Math.PI);
    FloatInterval       range    = new FloatInterval(-Math.PI * 2,
                                                     Math.PI * 2);
    RealFunctionPlotter plotter  = new RealFunctionPlotter(function,
                                                           domain,
                                                           range,
                                                           500);

    frame.getContentPane().add(plotter.asComponent());
    frame.setTitle(function.getClass().getSimpleName());
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    plotter.addCleanupOnWindowClosingListener(frame);

    frame.pack();
    frame.setVisible(true);
  }

  public CircularS()
  {
    this(new SFunction(),
         new ComplexCircle(ZERO,
                           ONE));
  }

  public CircularS(Complex t, Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ZERO,
                           h));
  }

  public CircularS(Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ZERO,
                           h));
  }

  public CircularS(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
