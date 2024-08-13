package arb.functions.rational;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.expressions.RationalNullaryExpression;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RationalNullaryFunction extends NullaryFunction<RationalFunction>
{

  public static Expression<Object, RationalFunction, RationalNullaryFunction> parse(String string)
  {
    return parse(null, string, null);
  }

  public static RationalNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Object.class,
                                RationalFunction.class,
                                RationalNullaryFunction.class,
                                functionName);
  }

  public static RationalNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RationalNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static RationalNullaryExpression parse(String functionName, String expression, Context context)
  {
    RationalNullaryExpression expr = new RationalNullaryExpression(functionName != null ? functionName : Parser.expressionToUniqueClassname(expression),
                                                                   Object.class,
                                                                   RationalFunction.class,
                                                                   RationalNullaryFunction.class,
                                                                   expression,
                                                                   context,
                                                                   functionName,
                                                                   null);
    return expr.parseRoot();
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            RationalFunction.class,
                            RationalNullaryFunction.class,
                            false);
  }

}
