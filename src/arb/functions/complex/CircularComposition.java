package arb.functions.complex;

import arb.geometry.curves.ComplexCircle;
import arb.operators.CompositionOperator;

public class CircularComposition<F extends HolomorphicFunction> extends
                                CompositionOperator<F, ComplexCircle>
{

  public CircularComposition(F f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
