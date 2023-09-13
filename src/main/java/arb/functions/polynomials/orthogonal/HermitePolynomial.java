package arb.functions.polynomials.orthogonal;

import arb.*;
import arb.functions.real.RealFunction;

public class HermitePolynomial extends
                               RealPolynomial implements
                               AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("HermitePolynomial[ν=%s]", nu);
  }

  @Override
  public void close()
  {
    nu.close();
  }

  public HermitePolynomial(int order)
  {
    this.nu = new Real();
    nu.set(order);
  }

  final Real nu;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order > 1)
    {
      throw new UnsupportedOperationException("TODO: derivatives");
    }
    assert res.size() >= order : "result size < order";
    arblib.arb_hypgeom_hermite_h(res, nu, t, bits);
    return res;
  }

}
