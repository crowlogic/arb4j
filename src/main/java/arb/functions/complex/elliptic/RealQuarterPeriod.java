package arb.functions.complex.elliptic;

import static arb.arblib.acb_elliptic_k;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;

/**
 * K(s) is the Complete Elliptical Integral of the First Kind, ALso known as the
 * real quarter period (function)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuarterPeriod implements
                               ComplexFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = Math.max(1, order);
    acb_elliptic_k(w, z, prec);
    for (int i = 2; i < order; i++)
    {
      z.get(i).setIndeterminate();
    }
    return w;
  }

}
