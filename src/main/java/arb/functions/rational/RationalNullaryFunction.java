package arb.functions.rational;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RationalNullaryFunction extends
                                         NullaryFunction<RationalFunction>
{

  public static Expression<Object, RationalFunction, RationalNullaryFunction> parse(String string)
  {
    return parse(null, string, null);
  }

  public static RationalNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.express(expression, context, Object.class, RationalFunction.class, RationalNullaryFunction.class, functionName);
  }

  public static RationalNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RationalNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction> parse(String functionName, String expression, Context context)
  {
    var parsed = Function.parse(null, expression, context, Object.class, RationalFunction.class, RationalNullaryFunction.class, null, null, false);

    functionName = parsed.functionName;
    parsed.updateStringRepresentation();

    if (functionName != null && context != null)
    {
      FunctionMapping<Object, RationalFunction, RationalNullaryFunction> mapping = context.registerFunctionMapping(functionName,
                                                                                                                   null,
                                                                                                                   parsed.domainType,
                                                                                                                   parsed.coDomainType,
                                                                                                                   parsed.functionClass,
                                                                                                                   true,
                                                                                                                   null,
                                                                                                                   expression);
      parsed.functionMapping   = mapping;
      mapping.expressionString = parsed.getExpression();
    }

    return parsed;
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction> parse(String string, Context prototype)
  {
    return parse(Parser.transformToAcceptableJavaIdentifier(string), string, prototype);
  }

  public default int bits()
  {
    return 128;
  }

  public default RationalFunction evaluate(RationalFunction result)
  {
    return evaluate(bits(), result);
  }

  public default RationalFunction evaluate()
  {
    return evaluate(bits(), new RationalFunction());
  }

}
