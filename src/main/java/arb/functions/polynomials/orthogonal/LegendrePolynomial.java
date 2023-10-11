package arb.functions.polynomials.orthogonal;

import arb.*;

public class LegendrePolynomial extends
                                RealPolynomial implements
                                AutoCloseable
{

  public LegendrePolynomial(int order)
  {
    this.n = order;

  }

  final int n;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order < 0 || order > 2)
    {
      throw new UnsupportedOperationException("only 0 <= order <= 2 supported");
    }
    assert res.size() >= order : "result size < order";
    Real resPrime = res.size() > 1 ? res.get(1) : null;
    arblib.arb_hypgeom_legendre_p_ui(res, resPrime, n, t, bits);
    return res;
  }
}
