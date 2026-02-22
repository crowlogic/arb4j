package arb.functions.integer;

import arb.expressions.Context;
import arb.functions.ComplexFunctional;

public interface ComplexFunctionalSequence extends
                                           Sequence<ComplexFunctional>
{
  public static ComplexFunctionalSequence express(String expression)
  {
    return Sequence.express(ComplexFunctional.class, expression, ComplexFunctionalSequence.class);
  }

  public static ComplexFunctionalSequence express(String expression, Context context)
  {
    return Sequence.express(ComplexFunctional.class,
                            expression,
                            ComplexFunctionalSequence.class,
                            context);
  }
}
