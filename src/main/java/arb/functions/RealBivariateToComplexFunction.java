package arb.functions;

import arb.Complex;
import arb.Real;
import arb.expressions.Context;

public interface RealBivariateToComplexFunction extends
                                                BivariateFunction<Real,
                                                              Complex,
                                                              RealToComplexFunction>
{
  public static RealBivariateToComplexFunction express(String expression)
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            RealBivariateToComplexFunction.class,
                            expression);
  }

  public static RealBivariateToComplexFunction express(String expression, Context context)
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            RealBivariateToComplexFunction.class,
                            null,
                            expression,
                            context);
  }
}
