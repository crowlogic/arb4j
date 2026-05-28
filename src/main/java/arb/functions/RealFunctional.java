package arb.functions;

import arb.Real;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

public interface RealFunctional extends
                                Functional<Real, Real, RealFunction>
{
  public static RealFunctional express(String expression)
  {
    return Functional.express(Real.class, RealFunction.class, RealFunctional.class, expression);
  }
  
  public static RealFunctional express(String expression, Context context )
  {
    return Functional.express(Real.class, RealFunction.class, RealFunctional.class, expression, context);
  }

  public default RealFunction eval(double x)
  {
    return evaluate(Real.valueOf(x), 64);
  }
}
