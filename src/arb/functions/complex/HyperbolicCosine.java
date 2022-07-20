
package arb.functions.complex;

import arb.*;

public class HyperbolicCosine implements
                              EvenFunction
{

  @Override
  public String toString()
  {
    return "Cosh";
  }

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    order = Math.max(order, 1);
    assert res.size() >= order;
    for (int o = 1; o <= order; o++)
    {
      if (o % 2 == 1)
      {
        arb.acb_cosh(res.get(o - 1), t, prec);
      }
      else
      {
        arb.acb_sinh(res.get(o - 1), t, prec);
      }
    }
    return res;
  }

}
