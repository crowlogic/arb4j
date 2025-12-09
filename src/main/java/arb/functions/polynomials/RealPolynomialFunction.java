package arb.functions.polynomials;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealPolynomialFunction extends
                                        Function<RealPolynomial, RealPolynomial>
{

  public static Expression<RealPolynomial, RealPolynomial, RealPolynomialFunction> parse(String expression)
  {
    return Function.parse(Parser.hashString(expression),
                        expression,
                        null,
                        RealPolynomial.class,
                        RealPolynomial.class,
                        RealPolynomialFunction.class,
                        null,
                        null);
  }

  public static RealPolynomialFunction express(String expression, boolean verbose2)
  {
    return Function.instantiate(expression,
                       null,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       null);
  }

  public static RealPolynomialFunction express(String expression)
  {
    return express(expression, null);
  }

  public static RealPolynomialFunction express(String expression, Context context)
  {
    return Function.instantiate(expression,
                       context,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       null);
  }

  /**
   * Instantiates a compiled {@link Expression} and registers it with the
   * {@link Context}
   * 
   * @param functionName
   * @param expression
   * @param context
   * @return a newly generated and constructed {@link RealPolynomialFunction}
   *         which evaluates the expression
   */
  public static RealPolynomialFunction
         express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static RealPolynomialFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    RealPolynomialFunction func = Function.instantiate(expression,
                                              context,
                                              RealPolynomial.class,
                                              RealPolynomial.class,
                                              RealPolynomialFunction.class,
                                              functionName);

    return func;
  }

  public static RealPolynomialFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                       context,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       null);
  }

}
