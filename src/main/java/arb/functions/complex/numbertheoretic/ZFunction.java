package arb.functions.complex.numbertheoretic;

import static java.lang.Math.max;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.arblib;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZFunction implements
                       ComplexFunction
{
  @Override
  public String toString()
  {
    return "Z";
  }

  static int prec = 128;

  @Override
  public synchronized Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = max(order, 1);

    assert w.dim >= order : String.format("wdim=%d >= order = %d", w.dim, order);
    assert prec > 0;
    assert w.size() >= order;

    arblib.acb_dirichlet_hardy_z(w, z, null, null, order, prec);
    return w;
  }

}
