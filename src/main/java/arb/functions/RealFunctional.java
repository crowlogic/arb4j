package arb.functions;

import arb.Real;
import arb.functions.real.RealFunction;

public interface RealFunctional extends
                                Functional<Real, Real, RealFunction>
{
  public static RealFunctional express(String expression)
  {
    return Functional.express(Real.class, RealFunction.class, RealFunctional.class, expression);
  }
}
