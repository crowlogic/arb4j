package arb.functions.complex;

import arb.Complex;

public class Translation implements
                         HolomorphicFunction
{
  public Translation(Complex t0)
  {
    this.t0 = t0;
  }

  public Complex t0;

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    assert res.size() <= order;
    if (order <= 1)
    {
      t0.add(t, prec, res);
    }
    if (order >= 2)
    {
      res.get(1).one();
    }
    for (int i = 2; i < order; i++)
    {
      res.get(i).zero();
    }
    return res;
  }

}
