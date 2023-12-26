package arb.functions.polynomials;

import static arb.expressions.Expression.instantiate;

import arb.RealPolynomial;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

public interface RealPolynomialFunction extends
                                        Function<RealPolynomial, RealPolynomial>
{
  public static boolean verbose = false;

  public static RealPolynomialFunction express(String expression, boolean verbose2)
  {
    return instantiate(expression,
                       null,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       verbose2);
  }

  public static RealPolynomialFunction express(String expression)
  {
    return express(expression, null);
  }

  public static RealPolynomialFunction express(String expression, Context context)
  {
    return instantiate(expression,
                       context,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       false);
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
  public static RealPolynomialFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static RealPolynomialFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    RealPolynomialFunction func = instantiate(expression,
                                              context,
                                              RealPolynomial.class,
                                              RealPolynomial.class,
                                              RealPolynomialFunction.class,
                                              verbose);

    context.registerFunction(functionName, func);

    return func;
  }

  public static RealPolynomialFunction express(String expression, Context context, boolean verbose)
  {
    return instantiate(expression,
                       context,
                       RealPolynomial.class,
                       RealPolynomial.class,
                       RealPolynomialFunction.class,
                       verbose);
  }

}
