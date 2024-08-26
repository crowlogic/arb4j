package arb.functions.integer;

import arb.IntegerPolynomial;
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
public interface IntegerPolynomialNullaryFunction extends
                                                  NullaryFunction<IntegerPolynomial>
{

  public static IntegerPolynomialNullaryFunction
         express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                IntegerPolynomial.class,
                                IntegerPolynomialNullaryFunction.class,
                                functionName);
  }

  public static IntegerPolynomialNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static IntegerPolynomialNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Object, IntegerPolynomial, IntegerPolynomialNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            IntegerPolynomial.class,
                            IntegerPolynomialNullaryFunction.class,
                            false);
  }

  public static Expression<Object, IntegerPolynomial, IntegerPolynomialNullaryFunction>
         compile(String string, Context prototype)
  {
    return compile(Parser.expressionToUniqueClassname(string), string, prototype);
  }

}
