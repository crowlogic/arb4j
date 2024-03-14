package arb.functions.complex.numbertheoretic;

import static java.lang.Math.max;

import arb.Complex;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannξFunction implements
                              ComplexFunction
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
    arblib.acb_dirichlet_xi(res, t, prec);
    return res;
  }

}
