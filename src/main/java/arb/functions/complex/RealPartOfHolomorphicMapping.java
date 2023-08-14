package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.RealToComplexFunction;

public class RealPartOfHolomorphicMapping implements
                                      RealToComplexFunction
{
  @Override
  public String toString()
  {
    return f.toString();
  }

  HolomorphicFunction f;

  public RealPartOfHolomorphicMapping(HolomorphicFunction c)
  {
    f = c;
  }

  @Override
  public Complex evaluate(Real x, int order, int prec, Complex res)
  {
    try ( Complex y = new Complex();)
    {
      y.re().set(x);
      return f.evaluate(y, order, prec, res);
    }
  }

}