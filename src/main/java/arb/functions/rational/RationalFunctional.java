package arb.functions.rational;

import arb.RationalFunction;
import arb.expressions.*;
import arb.functions.Function;

public interface RationalFunctional extends
                                    Function<RationalFunction, RationalFunction>
{

  public static Expression<RationalFunction, RationalFunction, RationalFunctional> parse(String string)
  {
    return parse(null, string, null);
  }

  public static RationalFunctional express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                RationalFunction.class,
                                RationalFunction.class,
                                RationalFunctional.class,
                                functionName);
  }

  public static RationalFunctional express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RationalFunctional express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<RationalFunction, RationalFunction, RationalFunctional> parse(String functionName, String expression, Context context)
  {
    if (functionName == null)
    {
      functionName = Parser.hashString(expression);
    }
    var expr = new Expression<RationalFunction, RationalFunction, RationalFunctional>(functionName,
                                                                                      RationalFunction.class,
                                                                                      RationalFunction.class,
                                                                                      RationalFunctional.class,
                                                                                      expression,
                                                                                      context,
                                                                                      functionName,
                                                                                      null);
    return expr.parse(true);
  }

  public static Expression<RationalFunction, RationalFunction, RationalFunctional>
         compile(String functionName, String expression, Context context)
  {
    return Parser.parse(functionName,
                        expression,
                        context,
                        RationalFunction.class,
                        RationalFunction.class,
                        RationalFunctional.class,
                        false);
  }

  public static Expression<RationalFunction, RationalFunction, RationalFunctional>
         compile(String string, Context prototype)
  {
    return compile(Parser.hashString(string), string, prototype);
  }

  public default int bits()
  {
    return 128;
  }

}
