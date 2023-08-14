package arb.functions.complex;

import static arb.RealConstants.one;

import arb.*;
import arb.geometry.curves.ComplexCircle;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircularSFunction extends
                               CircularComposition<SFunction>
{

  public CircularSFunction()
  {
    this(
         new SFunction(),
         new ComplexCircle(ComplexConstants.ZERO,
                           one));
  }

  public CircularSFunction(Complex t,
                           Real sFuncScale,
                           Real h)
  {
    this(
         new SFunction(sFuncScale),
         new ComplexCircle(t,
                           h));
  }

  public CircularSFunction(Real sFuncScale,
                           Real h)
  {
    this(
         new SFunction(sFuncScale),
         new ComplexCircle(ComplexConstants.ZERO,
                           h));
  }

  public CircularSFunction(SFunction f,
                           ComplexCircle g)
  {
    super(
          f,
          g);
  }

}
