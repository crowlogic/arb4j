package arb.curves;

import arb.*;
import arb.functions.real.RealFunction;

public class LemniscateArcLength implements
                                 RealFunction
{
  public Lemniscate lemniscate;

  public LemniscateArcLength(Lemniscate lemniscate)
  {
    this.lemniscate = lemniscate;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    try ( Complex q = new Complex();)
    {
      q.getReal().set(z);
      arb.acb_elliptic_f(q, q, ComplexConstants.negOne, 0, prec);
      assert q.getImag().isZero();
      w.set(q.getReal());
      return w.mul(lemniscate.scale, prec, w);
    }
  }

  @Override
  public RealFunction inverse()
  {
    // TODO Auto-generated method stub
    return null;
  };

}
