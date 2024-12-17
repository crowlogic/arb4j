package arb.functions.integer;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexFunctionSequence extends
                                         Sequence<ComplexFunction>
{
  public static ComplexFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static ComplexFunctionSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static ComplexFunctionSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            ComplexFunction.class,
                            ComplexFunctionSequence.class,
                            name,
                            expression,
                            context);
  }

  public static Expression<Integer, ComplexFunction, ComplexFunctionSequence> parse(String className, String string)
  {
    return Sequence.parse(className, ComplexFunctionSequence.class, ComplexFunction.class, string);
  }
}
