package arb.functions.real;

import static java.lang.Math.max;

import arb.NumberField;
import arb.Real;
import arb.functions.Function;

public class AbsoluteValue<D extends NumberField> implements
                          Function<D, Real>
{

  @Override
  public Real evaluate(D t, int order, int prec, Real res)
  {
    order = max(1, order);
    assert order < 2 : "TODO: implement derivative which returns NaN at 0 and -1 when negative and +1 when positive";
    return t.abs(prec, res);
  }

}
