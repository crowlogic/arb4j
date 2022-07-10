package arb.functions.complex.elliptic;

import arb.*;
import arb.functions.complex.*;

/**
 * K(s) is the Complete Elliptical Integral of the First Kind, ALso known as the
 * real quarter period (function)
 * 
 * @author crow
 *
 */
public class RealQuarterPeriod implements
                               ComplexFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = Math.max(1, order);
    arb.acb_elliptic_k(w, z, prec);
    for (int i = 2; i < order; i++)
    {
      z.get(i).setIndeterminate();
    }
    return w;
  }

}
