package arb.functions.complex;

import arb.curves.ComplexCircle;
import arb.operators.CompositionOperator;

public class CircularComposition<F extends ComplexFunction> extends
                                CompositionOperator<F, ComplexCircle>
{

  public CircularComposition(F f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
