package arb.functions.real;

import static java.lang.Math.*;

import arb.*;

/**
 * Dirac δ function <code>
 * δ(t)=∞ if t == 0
 *     =0 if t != 0 otherwise
 * </code>
 */
public class DiracDeltaFunction implements
                                RealFunction
{

  @Override
  public Real evaluate(Real t, int order, int prec, Real res)
  {
    order = max(1, order);
    assert order < 2;
    if (t.isZero())
    {
      res.posInf();
    }
    else
    {
      res.zero();
    }
    return res;
  }

  @Override
  public RealFunction inverse()
  {
    // TODO Auto-generated method stub
    return null;
  }

}
