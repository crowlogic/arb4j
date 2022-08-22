package arb.functions.complex.hyperbolic;

import arb.Complex;
import arb.functions.complex.OddFunction;

public class HyperbolicTangent implements
                               OddFunction
{

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    assert (order = Math.max(1, order)) == 1 : "TODO: implement order>1";
    return t.tanh(prec, res);
  }

}
