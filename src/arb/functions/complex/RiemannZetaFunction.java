package arb.functions.complex;

import arb.Complex;

public class RiemannZetaFunction implements
                                 ComplexFunction
{

  @Override
  public String toString()
  {
    return "ζ";
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= w.size();
    assert prec > 0;
    try ( Complex r = Complex.newVector(order))
    {
      arb.arb.acb_dirichlet_zeta_jet(r, z, 0, order, prec);
      w.set(r);
    }
    return w;
  }

}
