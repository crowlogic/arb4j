package arb.functions.rational;

import arb.ComplexRationalFunction;
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
public interface ComplexRationalNullaryFunction extends
                                                NullaryFunction<ComplexRationalFunction>
{

  public static Expression<Object, ComplexRationalFunction, ComplexRationalNullaryFunction>
         parse(String string)
  {
    return parse(null, string, null);
  }

  public static ComplexRationalNullaryFunction
         express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                ComplexRationalFunction.class,
                                ComplexRationalNullaryFunction.class,
                                functionName);
  }

  public static ComplexRationalNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static ComplexRationalNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Object, ComplexRationalFunction, ComplexRationalNullaryFunction>
         parse(String functionName, String expression, Context context)
  {
    return Function.parse(functionName != null ? functionName
                                               : Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          Object.class,
                          ComplexRationalFunction.class,
                          ComplexRationalNullaryFunction.class,
                          functionName,
                          null);
  }

  public static Expression<Object, ComplexRationalFunction, ComplexRationalNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName != null ? functionName
                                                 : Parser.expressionToUniqueClassname(expression),
                            expression,
                            context,
                            Object.class,
                            ComplexRationalFunction.class,
                            ComplexRationalNullaryFunction.class,
                            false);
  }

}
