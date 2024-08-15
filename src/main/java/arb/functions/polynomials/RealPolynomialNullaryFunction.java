package arb.functions.polynomials;

import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealPolynomialNullaryFunction extends
                                               NullaryFunction<RealPolynomial>
{

  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>>
         E
         parse(String string)
  {
    return parse(null,
                 string,
                 null);
  }

  public static RealPolynomialNullaryFunction
         express(String functionName,
                 String expression,
                 Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                RealPolynomial.class,
                                RealPolynomialNullaryFunction.class,
                                functionName);
  }

  public static NullaryFunction<RealPolynomial>
         express(String expression,
                 Context context)
  {
    return express(null,
                   expression,
                   context);
  }

  public static NullaryFunction<RealPolynomial>
         express(String expression)
  {
    return express(null,
                   expression,
                   null);
  }

  @SuppressWarnings("unchecked")
  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>>
         E
         parse(String functionName,
               String expression,
               Context context)
  {
    return (E) Function.parse(functionName != null ? functionName : Parser
                                                                          .expressionToUniqueClassname(expression),
                              expression,
                              context,
                              Object.class,
                              RealPolynomial.class,
                              RealPolynomialNullaryFunction.class,
                              functionName,
                              null);
  }

  public static Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>
         compile(String functionName,
                 String expression,
                 Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            RealPolynomial.class,
                            RealPolynomialNullaryFunction.class,
                            false);
  }

}
