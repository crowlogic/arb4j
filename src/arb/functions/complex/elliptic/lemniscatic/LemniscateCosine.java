package arb.functions.complex.elliptic.lemniscatic;

import arb.Complex;
import arb.functions.complex.HolomorphicFunction;
import arb.geometry.curves.PlaneCurve;

/**
 * cl(z)=LemniscateCosine(z)
 * 
 * TODO: implement and use to provide the {@link PlaneCurve#getArcLength()}
 * function
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Lemniscate_elliptic_functions">LemniscateEllipticFunctions@Wikipedia</a>
 */
public class LemniscateCosine implements
                              HolomorphicFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    throw new UnsupportedOperationException("TODO: implement ");

  }

}
