package arb.functions.real;

import static arb.expressions.Expression.instantiate;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealPolynomialNullaryFunction extends
                                               NullaryFunction<RealPolynomial>
{

  public static RealPolynomialNullaryFunction express(String functionName, String expression, Context context)
  {
    return instantiate(expression, context, Void.class, RealPolynomial.class, RealPolynomialNullaryFunction.class, functionName);
  }

  public static NullaryFunction<RealPolynomial> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static NullaryFunction<RealPolynomial> express(String expression)
  {
    return express(null, expression, null);
  }
}
