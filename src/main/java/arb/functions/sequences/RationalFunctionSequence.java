package arb.functions.sequences;

import arb.Integer;
import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RationalFunctionSequence extends Sequence<RationalFunction>
{
  @Override
  default Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  public static RationalFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RationalFunctionSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static RationalFunctionSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            RationalFunction.class,
                            name,
                            expression,
                            context,
                            RationalFunctionSequence.class);
  }

  public static Expression<Integer, RationalFunction, RationalFunctionSequence> parse(String className,
                                                                                      String string)
  {
    return Sequence.parse(className, RationalFunctionSequence.class, RationalFunction.class, string);
  }
}
