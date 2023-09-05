package arb.functions.polynomials.orthogonal;

import arb.Real;
import arb.arblib;
import arb.functions.real.RealFunction;

public class ChebyshevPolynomial implements
                                 RealFunction
{

  @Override
  public String toString()
  {
    return String.format("ChebyshevPolynomial[ν=%s]", n);
  }

  @Override
  public void close()
  {
    n.close();
  }

  public ChebyshevPolynomial(Real n)
  {
    this.n = new Real();
    this.n.set(n);
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
