package arb.functions.complex;

import arb.curves.ComplexCircle;
import arb.operators.Composition;

public class CircularComposition<F extends HolomorphicFunction> extends
                                Composition<F, ComplexCircle>
{

  public CircularComposition(F f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
