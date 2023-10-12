package arb.functions.polynomials.orthogonal;

import arb.*;

/**
 * the Bessel polynomials are an orthogonal sequence of polynomials defined by
 * 
 * y_n(x)=∑((n+k)!/((n-k)!k!)*(x/2)^k,k=0..n)
 */
public class BesselPolynomial extends
                              RealPolynomial implements
                              AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  @Override
  public String toString()
  {
    return String.format("BesselPolynomial[ν=%s]", n);
  }

  @Override
  public void close()
  {

  }

  public BesselPolynomial(int order)
  {
    this.n = order;

  }

  final int n;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order > 1)
    {
      throw new UnsupportedOperationException("TODO: derivatives");
    }
    assert res.size() >= order : "result size < order";
    assert false : "todo: compute y_n(x)=\\,_2F_0(-n,n+1;;-x/2)= \\left(\\frac 2 x\\right)^{-n} U\\left(-n,-2n,\\frac 2 x\\right)= \\left(\\frac 2 x\\right)^{n+1} U\\left(n+1,2n+2,\\frac 2 x \\right)";
    return res;
  }

}
