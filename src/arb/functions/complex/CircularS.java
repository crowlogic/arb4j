package arb.functions.complex;

import static arb.RealConstants.*;

import javax.swing.*;

import arb.*;
import arb.curves.*;
import arb.functions.real.*;
import arb.viz.*;

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
    JFrame              frame            = new JFrame();
    RealFunction        circularRealPart = new RealPart(new CircularS(new Real().set("1", 128),
                                                                      new Real().set("0.1", 128)));

    FloatInterval       domain           = new FloatInterval(-Math.PI,
                                                             Math.PI);
    FloatInterval       range            = new FloatInterval(-0.011,
                                                             0.011);
    RealFunctionPlotter plotter          = new RealFunctionPlotter(circularRealPart,
                                                                   domain,
                                                                   range,
                                                                   500);

    frame.getContentPane().add(plotter.asComponent());
    frame.setTitle(circularRealPart.getClass().getSimpleName());
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    plotter.addCleanupOnWindowClosingListener(frame);

    frame.pack();
    frame.setVisible(true);

    Roots root = circularRealPart.locateRoots(new RootLocatorOptions(new RealRootInterval(-.8,
                                                                                                     -0.7),
                                                                                150,
                                                                                1,
                                                                                50000,
                                                                                512));
    root.refine(circularRealPart, 256, 100, true);
    System.out.println("root=" + root);
    Real angle               = root.get(0).getReal(new Real(), 128);

    Real degrees             = angle.mul(180, 128, new Real());

    Real functionAtZeroAngle = circularRealPart.evaluate(angle, 1, 512, new Real());
    System.out.println("function(angle(w)) should equal 0 =" + functionAtZeroAngle);
    System.out.println("angle=" + angle);
    System.out.println("degrees=" + degrees);
    // println("hmm=" + hmm.div(RealConstants.radiansPerDegree, 128, new Real() ) );
  }

  public CircularS()
  {
    this(new SFunction(),
         new ComplexCircle(ComplexConstants.ZERO,
                           one));
  }

  public CircularS(Complex t, Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ComplexConstants.ZERO,
                           h));
  }

  public CircularS(Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ComplexConstants.ZERO,
                           h));
  }

  public CircularS(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
