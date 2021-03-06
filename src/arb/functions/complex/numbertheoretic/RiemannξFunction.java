package arb.functions.complex.numbertheoretic;

import static java.lang.Math.max;

import arb.Complex;
import arb.functions.complex.HolomorphicFunction;

public class RiemannξFunction implements
                              HolomorphicFunction
{

  @Override
  public String toString()
  {
    return "ξ";
  }

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    order = max(0, 1);
    assert order == 1 : "TODO: implement derivative d/dx(ξ(x)) = 1/2*π^(-t/2)*Γ[1 + t]*((2 + Log[π -t*Log[π] + (t - 1)*PolyGamma[0, 1 + t/2])*ζ[t] + 2(t-1)*ζ'[t])";
    arb.arb.acb_dirichlet_xi(res, t, prec);
    return res;
  }

}
