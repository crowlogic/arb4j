package arb.functions.complex;

import arb.*;
import arb.functions.*;

public class DiscRotation implements
                          Function<Real, Complex>,
                          AutoCloseable
{
  public DiscRotation(Complex t, Real h)
  {
    assert t != null;
    assert h != null;
    this.t = t;
    this.h = h;
  }

  Complex            t;

  Real               h;

  ThreadLocalComplex s = new ThreadLocalComplex(1);

  @Override
  public Complex evaluate(Real a, int order, int prec, Complex res)
  {
    Complex s = this.s.get();
    return a.mul(Constants.i, prec, s).exp(prec, s).mul(h, prec, s).add(t, prec, res);
  }

  @Override
  public void close() throws Exception
  {
    s.remove();
    t.clear();
    h.clear();
  }

  /**
   * double-wrapper for this{@link #evaluate(Real, int, int, Complex)}
   * 
   * @param angle
   * @param complex
   * @return
   */
  public Complex evaluate(double angle, Complex complex)
  {
    try ( Real Θ = new Real())
    {
      Θ.set(angle);
      return evaluate(Θ, 1, 64, complex);
    }
  }

}
