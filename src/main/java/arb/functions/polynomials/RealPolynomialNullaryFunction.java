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



  @Override
  default RealPolynomial evaluate(Object t, int order, int bits, RealPolynomial res)
  {
    assert false : "RealPolynomialNullaryFunction.evaluate has yet to be implemented as of Dec 1, 2025 12:27:18 PM";
    return null;
  }

  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>> E parse(String string)
  {
    return parse(null, string, null);
  }

  public static RealPolynomialNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                RealPolynomial.class,
                                RealPolynomialNullaryFunction.class,
                                functionName);
  }

  public static NullaryFunction<RealPolynomial> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealPolynomialNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>>
         E
         parse(String functionName, String expression)
  {
    return parse(functionName, expression);
  }

  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>> E parse(String expression,
                                                                                                      Context context)
  {
    return parse(null, expression, context);
  }

  @SuppressWarnings("unchecked")
  public static <E extends Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>>
         E
         parse(String functionName, String expression, Context context)
  {
    return (E) Function.parse(functionName != null ? functionName : Parser.hashString(expression),
                              expression,
                              context,
                              Object.class,
                              RealPolynomial.class,
                              RealPolynomialNullaryFunction.class,
                              functionName,
                              null);
  }

  public static Expression<Object, RealPolynomial, RealPolynomialNullaryFunction>
         compile(String functionName, String expression, Context context)
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
