package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne copyright terms governing the
 *      {@link TheArb4jLibrary}
 */
public class RealSineFunction implements
                              RealFunction
{

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    assert z != null;
    assert w != null;
    assert order <= 3;
    assert w.size() >= order;

    if (order >= 1)
    {
      z.sin(prec, w);
    }
    if (order >= 2)
    {
      z.cos(prec, w.get(1));
    }
    if (order >= 3)
    {
      Real w2ndDeriv = w.get(2);
      w.neg(w2ndDeriv).div(2, prec, w2ndDeriv);
    }

    return w;
  }

  @Override
  public String toString()
  {
    return "sin";
  }

}
