package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public interface RealNullaryFunction extends
                                     NullaryFunction<Real>
{
  public static RealNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                       context,
                       Object.class,
                       Real.class,
                       RealNullaryFunction.class,
                       functionName);
  }

  public static RealNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }
}
