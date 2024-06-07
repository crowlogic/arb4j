package arb.functions.complex;

import arb.ComplexPolynomial;
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
public interface ComplexPolynomialNullaryFunction extends
                                                  NullaryFunction<ComplexPolynomial>
{

  public static Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> parse(String string)
  {
    return parse(null, string, null);

  }

  public static ComplexPolynomialNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                ComplexPolynomial.class,
                                ComplexPolynomialNullaryFunction.class,
                                functionName);
  }

  public static NullaryFunction<ComplexPolynomial> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static NullaryFunction<ComplexPolynomial> express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>
         parse(String functionName, String expression, Context context)
  {
    return Function.parse(functionName != null ? functionName : Parser.expressionToUniqueClassname(expression),
                        expression,
                        context,
                        Object.class,
                        ComplexPolynomial.class,
                        ComplexPolynomialNullaryFunction.class,
                        functionName,
                        null);
  }

  public static Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            ComplexPolynomial.class,
                            ComplexPolynomialNullaryFunction.class,
                            false);
  }

}
