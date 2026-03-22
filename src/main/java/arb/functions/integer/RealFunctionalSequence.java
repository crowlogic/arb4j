package arb.functions.integer;

import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealFunctional;

public interface RealFunctionalSequence extends
                                        Sequence<RealFunctional>
{
  public static RealFunctionalSequence express(String exp)
  {
    return Sequence.express(RealFunctional.class, exp, RealFunctionalSequence.class);
  }

  public static RealFunctionalSequence express(String exp, Context context)
  {
    return Sequence.express(RealFunctional.class, exp, RealFunctionalSequence.class, context);
  }

  public static Expression<Integer, RealFunctional, RealFunctionalSequence> parse(String exp)
  {
    return parse(exp, null);
  }

  public static Expression<Integer, RealFunctional, RealFunctionalSequence> parse(String exp, Context context)
  {
    return Sequence.parse(RealFunctionalSequence.class, RealFunctional.class, exp);
  }
}
