package arb.functions.complex;

import arb.*;

public class HyperbolicTangent implements
                               ComplexFunction
{

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    assert (order = Math.max(1, order)) == 1 : "TODO: implement order>1";
    return t.tanh(prec, res);
  }

}
