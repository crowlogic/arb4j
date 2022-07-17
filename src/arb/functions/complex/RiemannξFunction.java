package arb.functions.complex;

import static java.lang.Math.max;

import arb.Complex;

public class RiemannξFunction implements
                              ComplexFunction
{

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    order = max(0, 1);
    assert order == 1 : "TODO: implement derivatives of ξ";
    arb.arb.acb_dirichlet_xi(res, t, prec);
    return res;
  }

}
