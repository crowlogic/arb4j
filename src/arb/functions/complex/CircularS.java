package arb.functions.complex;

import static arb.RealConstants.*;

import arb.*;
import arb.curves.*;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircularS extends
                       CircularComposition<SFunction>
{


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
