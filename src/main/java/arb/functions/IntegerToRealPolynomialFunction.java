package arb.functions;

import static arb.expressions.Expression.instantiate;

import arb.Integer;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerToRealPolynomialFunction extends
                                                 Function<Integer, RealPolynomial>
{

  public static IntegerToRealPolynomialFunction express(String functionName, String expression, Context context)
  {
    return instantiate(expression,
                       context,
                       Integer.class,
                       RealPolynomial.class,
                       IntegerToRealPolynomialFunction.class,
                       functionName);
  }

  public static IntegerToRealPolynomialFunction express(String expression)
  {
    return instantiate(expression,
                       null,
                       Integer.class,
                       RealPolynomial.class,
                       IntegerToRealPolynomialFunction.class,
                       null);
  }

  public static IntegerToRealPolynomialFunction express(String expression, Context context)
  {
    return instantiate(expression,
                       context,
                       Integer.class,
                       RealPolynomial.class,
                       IntegerToRealPolynomialFunction.class,
                       null);
  }

}