package arb.functions.complex.trigonometric;

import arb.Complex;
import arb.functions.complex.HolomorphicFunction;

public class SineFunction implements
                                 HolomorphicFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = Math.max(1, order);
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
      Complex w2ndDeriv = w.get(2);
      w.negate(w2ndDeriv).div(2, prec, w2ndDeriv);
    }

    return w;
  }

}
