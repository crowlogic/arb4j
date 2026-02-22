package arb.functions.integer;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexSequenceSequence extends
                                         Sequence<ComplexSequence>
{

  public static ComplexSequenceSequence express(String expression)
  {
    return Sequence.express(ComplexSequence.class, expression, ComplexSequenceSequence.class);
  }

  public static ComplexSequenceSequence express(String name, String expression)
  {
    return Sequence.express(name, ComplexSequence.class, expression, ComplexSequenceSequence.class);
  }

  public static ComplexSequenceSequence express(String name, String expression, Context context)
  {
    return Sequence.express(name,
                            ComplexSequence.class,
                            expression,
                            ComplexSequenceSequence.class,
                            context);
  }

  static ComplexSequenceSequence express(String expression, Context context)
  {
    return Sequence.express(null,
                            ComplexSequence.class,
                            expression,
                            ComplexSequenceSequence.class,
                            context);
  }

}