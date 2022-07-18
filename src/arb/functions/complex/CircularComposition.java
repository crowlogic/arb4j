package arb.functions.complex;

import arb.curves.*;
import arb.operators.*;

public class CircularComposition<F extends ComplexFunction> extends
                                Composition<F, ComplexCircle>
{

  public CircularComposition(F f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
