package arb.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.ComplexFunction;
import arb.arb;

public class LemniscateDerivative implements
                                  ComplexFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = max(1, order);
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 1;
    arb.f_lemniscate_derivative(w, z, null, order, prec);
    return w;
  }

}
