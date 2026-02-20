package arb.functions.integer;

import arb.expressions.Context;
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
}
