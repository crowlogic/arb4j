package arb.functions.real;

import arb.RealRationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.expressions.RealRationalNullaryExpression;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealRationalNullaryFunction extends NullaryFunction<RealRationalFunction>
{

  public static Expression<Object, RealRationalFunction, RealRationalNullaryFunction> parse(String string)
  {
    return parse(null, string, null);
  }

  public static RealRationalNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                RealRationalFunction.class,
                                RealRationalNullaryFunction.class,
                                functionName);
  }

  public static NullaryFunction<RealRationalFunction> express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static NullaryFunction<RealRationalFunction> express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealRationalNullaryExpression parse(String functionName, String expression, Context context)
  {
    RealRationalNullaryExpression expr = new RealRationalNullaryExpression(functionName != null ? functionName : Parser.expressionToUniqueClassname(expression),
                  Object.class,
                  RealRationalFunction.class,
                  RealRationalNullaryFunction.class,
                  expression,
                  context,
                  functionName,
                  null);
    return expr.parseRoot();
  }

  public static Expression<Object, RealRationalFunction, RealRationalNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            RealRationalFunction.class,
                            RealRationalNullaryFunction.class,
                            false);
  }

}
