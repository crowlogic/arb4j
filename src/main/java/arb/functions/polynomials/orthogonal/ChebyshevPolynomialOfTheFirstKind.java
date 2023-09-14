package arb.functions.polynomials.orthogonal;

import arb.*;

public class ChebyshevPolynomialOfTheFirstKind extends
                                 RealPolynomial implements
                                 AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("ChebyshevPolynomialOfTheFirstKind[ν=%s]", n);
  }

  @Override
  public void close()
  {
    n.close();
  }

  /**
   * 
   * @param n the real order of the Chebyshev poly
   */
  public ChebyshevPolynomialOfTheFirstKind(Real n)
  {
    this.n = n;
  }

  final Real n;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order > 1)
    {
      throw new UnsupportedOperationException("TODO: derivatives");
    }
    assert res.size() >= order : "result size < order";
    arblib.arb_hypgeom_chebyshev_t(res, n, t, bits);
    return res;
  }

}
