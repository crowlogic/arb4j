package arb.functions.real;

import static arb.expressions.Expression.instantiate;

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
  public static RealNullaryFunction express(String functionName, String expression, Context context)
  {
    return instantiate(expression, context, Void.class, Real.class, RealNullaryFunction.class, functionName);
  }

  public static NullaryFunction<Real> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static NullaryFunction<Real> express(String expression)
  {
    return express(null, expression, null);
  }
}
