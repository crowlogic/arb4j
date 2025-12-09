package arb.functions.real;

import arb.Real;

public class RealIdentityFunction implements
                                  RealFunction
{

  @Override
  public String typeset()
  {
    return "x";
  }


  @Override
  public String toString()
  {
    return "x";
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return res.set(t);
  }

}
