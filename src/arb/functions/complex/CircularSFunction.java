package arb.functions.complex;

import static arb.RealConstants.one;

import arb.Complex;
import arb.ComplexConstants;
import arb.FloatInterval;
import arb.Real;
import arb.RealConstants;
import arb.RealRootInterval;
import arb.RootLocatorOptions;
import arb.Roots;
import arb.functions.real.ImaginaryPart;
import arb.functions.real.RealPart;
import arb.functions.real.dynamics.RealNewtonMap;
import arb.geometry.curves.ComplexCircle;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircularSFunction extends
                               CircularComposition<SFunction>
{

  /**
   * 
   * @param real         if true then converge to the root of the real part,
   *                     otherwise converge to the root of the imaginary part
   * @param presentAngle
   * @param nextAngle
   * @return
   */
  public Real converge(boolean real, Real h, Real presentAngle, int prec, Real angle)
  {
    RealNewtonMap newtonMapOfPart = new RealNewtonMap(real ? new RealPart<>(this) : new ImaginaryPart<>(this),
                                                      h);
    Real          iterate         = newtonMapOfPart.iterate(presentAngle, 42, prec, angle);

  
    return iterate;

  }

  public CircularSFunction()
  {
    this(new SFunction(),
         new ComplexCircle(ComplexConstants.ZERO,
                           one));
  }

  public CircularSFunction(Complex t, Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(t,
                           h));
  }

  public CircularSFunction(Real sFuncScale, Real h)
  {
    this(new SFunction(sFuncScale),
         new ComplexCircle(ComplexConstants.ZERO,
                           h));
  }

  public CircularSFunction(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
