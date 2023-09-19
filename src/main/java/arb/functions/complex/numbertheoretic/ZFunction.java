package arb.functions.complex.numbertheoretic;

import static java.lang.Math.max;

import arb.Complex;
import arb.arblib;
import arb.functions.complex.HolomorphicFunction;

public class ZFunction implements
                       HolomorphicFunction
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
