package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public interface RealNullaryFunction extends
                                     NullaryFunction<Real>
{
  public static NullaryFunction<Real> express(String functionName, String expression, Context context)
  {
    return NullaryFunction.express(Real.class, functionName, expression, context);
  }

  public static NullaryFunction<Real> express(String expression, Context context)
  {
    return NullaryFunction.express(Real.class, null, expression, context);
  }

  public static NullaryFunction<Real> express(String expression)
  {
    return NullaryFunction.express(Real.class, null, expression, null);
  }
}
