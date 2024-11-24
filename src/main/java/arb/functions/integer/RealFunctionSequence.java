package arb.functions.integer;

import arb.Integer;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealFunctionSequence extends
                                      Sequence<RealFunction>
{
  public static RealFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealFunctionSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealFunctionSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class, RealFunction.class, RealFunctionSequence.class, name, expression, context);
  }

  public static Expression<Integer, RealFunction, RealFunctionSequence> parse(String className, String string)
  {
    return Sequence.parse(className, RealFunctionSequence.class, RealFunction.class, string);
  }
}
