package arb.functions.complex;

import arb.*;
import arb.curves.Circle;
import arb.curves.ComplexCircle;
import arb.functions.Function;
import arb.functions.*;
import arb.operators.ComplexCompositionOperator;
import arb.operators.CompositionOperator;

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
         new ComplexCircle(new Complex().set(0.3,0.4),
                           new Real().set("0.2", 128)));
  }

  public CircleS(SFunction f, ComplexCircle g)
  {
    super(f,
          g);
  }

  public ComplexImaginaryPart imag()
  {
    return new ComplexImaginaryPart(this);
  }

  
  public ComplexRealPart realComplex()
  {
    return new ComplexRealPart(this);
  }

  public ComplexImaginaryPart imagComplex()
  {
    return new ComplexImaginaryPart(this);
  }
}
