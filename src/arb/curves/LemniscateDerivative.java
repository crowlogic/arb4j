package arb.curves;

import static java.lang.Math.max;

import arb.*;
import arb.exceptions.NotIntegrableException;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;

public class LemniscateDerivative implements
                                  Function<Real, Complex>
{

  @Override
  public Function<Real, Complex> integral() throws NotIntegrableException
  {
    return new Lemniscate();
  }

  @Override
  public Complex evaluate(Real z, int order, int prec, Complex w)
  {
    order = max(1, order);
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 1;
    try ( Complex cz = new Complex())
    {
      cz.getReal().set(z);
      arb.f_lemniscate_derivative(w, cz, null, order, prec);
    }
    return w;
  }

}
