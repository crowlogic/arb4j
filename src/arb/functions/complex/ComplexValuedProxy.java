package arb.functions.complex;

import arb.*;
import arb.functions.*;

public class ComplexValuedProxy<D extends Real> implements
                               Function<D, Complex>
{
  Function<D, Real> wrappedFunction;

  public ComplexValuedProxy(Function<D, Real> wrappedFunction)
  {
    this.wrappedFunction = wrappedFunction;
  }

  @Override
  public Complex evaluate(D t, int order, int prec, Complex res)
  {
    wrappedFunction.evaluate(t, order, prec, res.getReal());
    return res;
  }

}
