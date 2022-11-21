package arb.functions.complex;

import static arb.RealConstants.one;
import static java.lang.Math.pow;
import static java.lang.System.out;
import static org.junit.Assert.assertEquals;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealPart;
import arb.functions.real.dynamics.RealNewtonMap;
import arb.geometry.curves.ComplexCircle;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircularCompositionS extends
                                  CircularComposition<SFunction>
{

  /**
   * 
   * @param presentAngle
   * @param nextAngle
   * @return
   */
  public Real converge(Real presentAngle, Real nextAngle)
  {
    RealPart<CircularCompositionS> realRadialPressure            = new RealPart<>(this);
    Real                           angle                         = nextAngle;

    RealNewtonMap                  newtonMapOfRealRadialPressure = new RealNewtonMap(realRadialPressure,
                                                                                     RealConstants.one);
    presentAngle.set("-0.75", 128);
    newtonMapOfRealRadialPressure.iterate(presentAngle, 20, 128, angle);
    out.println("angle=" + angle);
    Complex vectorAtPoint = evaluate(new Complex(nextAngle), 1, 512, new Complex());
    System.out.println("f(angle)=" + vectorAtPoint);
    assertEquals(0, vectorAtPoint.getReal().doubleValue(), pow(10, -39));
    // assertEquals(0.01, vectorAtPoint.getImag().doubleValue(), pow(10, -6));

    return nextAngle;

  }

  public CircularCompositionS()
  {
    this(new SFunction(),
         new ComplexCircle(ComplexConstants.ZERO,
                           one));
  }

  public CircularCompositionS(Complex t, Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(t,
                           h));
  }

  public CircularCompositionS(Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ComplexConstants.ZERO,
                           h));
  }

  public CircularCompositionS(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
