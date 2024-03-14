
package arb.functions.complex.hyperbolic;

import static arb.arblib.acb_cosh;
import static arb.arblib.acb_sinh;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.EvenFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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
        acb_cosh(res.get(o - 1), t, prec);
      }
      else
      {
        acb_sinh(res.get(o - 1), t, prec);
      }
    }
    return res;
  }

}
