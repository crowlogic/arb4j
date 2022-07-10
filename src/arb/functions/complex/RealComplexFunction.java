package arb.functions.complex;

import arb.*;
import arb.functions.real.*;

public class RealComplexFunction<R extends RealFunction> implements
                                ComplexFunction
{
  public RealComplexFunction(R r)
  {
    this.r = r;
  }

  R r;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    r.evaluate(z.getReal(), order, prec, w.getReal());
    return w;
  }

}
