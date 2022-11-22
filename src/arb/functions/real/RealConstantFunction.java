package arb.functions.real;

import arb.Real;

public class RealConstantFunction implements
                          RealFunction
{
  public RealConstantFunction(Real c)
  {
    this.c = c;
  }

  Real c;

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    if (order >= 1)
    {
      w.set(c);
    }
    for (int i = 2; i <= order; i++)
    {
      w.get(i).zero();
    }
    return w;
  }

  @Override
  public RealFunction inverse()
  {
    // TODO Auto-generated method stub
    return null;
  }

}