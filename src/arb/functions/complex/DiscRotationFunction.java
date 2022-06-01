package arb.functions.complex;

import arb.*;

public class DiscRotationFunction implements
                                      ComplexFunction,
                                      AutoCloseable
{
  public DiscRotationFunction(Complex t, Real h)
  {
    this.t = t;
    this.h = h;
  }

  Complex            t;

  Real               h;

  ThreadLocalComplex s = new ThreadLocalComplex(1);

  @Override
  public Complex evaluate(Complex a, int order, int prec, Complex res)
  {
    Complex s = this.s.get();
    return a.mul(Constants.i, s).exp(prec, s).mul(h, prec, s).add(t, prec, res);
  }

  @Override
  public void close() throws Exception
  {
    s.remove();
    t.clear();
    h.clear();
  }

}
