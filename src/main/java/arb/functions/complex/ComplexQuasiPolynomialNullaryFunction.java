package arb.functions.complex;

import arb.ComplexPolynomial;
import arb.ComplexQuasiPolynomial;
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
public interface ComplexQuasiPolynomialNullaryFunction extends NullaryFunction<ComplexQuasiPolynomial>
{

  public static Expression<Object, ComplexQuasiPolynomial, ComplexQuasiPolynomialNullaryFunction>
         parse(String string)
  {
    return parse(null, string, null);

  }

  public static ComplexQuasiPolynomialNullaryFunction
         express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                ComplexPolynomial.class,
                                ComplexQuasiPolynomialNullaryFunction.class,
                                functionName);
  }

  public static NullaryFunction<ComplexQuasiPolynomial> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static NullaryFunction<ComplexQuasiPolynomial> express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Object, ComplexQuasiPolynomial, ComplexQuasiPolynomialNullaryFunction>
         parse(String functionName, String expression, Context context)
  {
    return Function.parse(functionName != null ? functionName : Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          Object.class,
                          ComplexQuasiPolynomial.class,
                          ComplexQuasiPolynomialNullaryFunction.class,
                          functionName,
                          null);
  }

  public static Expression<Object, ComplexQuasiPolynomial, ComplexQuasiPolynomialNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            ComplexQuasiPolynomial.class,
                            ComplexQuasiPolynomialNullaryFunction.class,
                            false);
  }

}
