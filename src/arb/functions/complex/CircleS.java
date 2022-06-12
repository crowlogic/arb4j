package arb.functions.complex;

import arb.Constants;
import arb.Real;
import arb.curves.ComplexCircle;
import arb.operators.ComplexCompositionOperator;

/**
 * S(e^i*θ) where θ is a real-valued angle but its easier for now to work with
 * complex types.. and letting the imaginary part of the independent variable be
 * nonzero might be useful as well
 */
public class CircleS extends
                     ComplexCompositionOperator<SFunction, ComplexCircle>
{

  public CircleS()
  {
    this(new SFunction(),
         new ComplexCircle(Constants.ZERO,
                           Constants.ONE));
  }

  public CircleS( Real a )
  {
    this(new SFunction(),
         new ComplexCircle(Constants.ZERO,
                           Constants.ONE));
  }

  public CircleS(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }


}
