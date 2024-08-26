package arb.functions.integer;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerSequence extends
                                 Sequence<Integer>
{
  @Override
  default Class<Integer> coDomainType()
  {
    return Integer.class;
  }

  public static IntegerSequence express(String expression)
  {
    return Function.instantiate(expression, null, Integer.class, Integer.class, IntegerSequence.class, null);
  }

  public static IntegerSequence express(String expression, Context context)
  {
    return Function.instantiate(expression, context, Integer.class, Integer.class, IntegerSequence.class, null);
  }

  public static Expression<Integer, Integer, IntegerSequence> compile(String expression, Context context)
  {
    return Compiler.compile(expression, context, Integer.class, Integer.class, IntegerSequence.class, null);
  }
}
