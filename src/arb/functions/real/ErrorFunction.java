package arb.functions.real;

import arb.*;

public class ErrorFunction implements
                           OddFunction
{

  @Override
  public Real evaluate(Real t, int order, int prec, Real res)
  {
    order = Math.max(0, order);
    assert order == 1 : "TODO: implement order>1";
    return t.erf(prec, res);
  }

}
