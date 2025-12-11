package arb.functions.integer;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealSequenceSequence extends
                                      Sequence<RealSequence>
{

  public static RealSequenceSequence express(String expression)
  {
    return (RealSequenceSequence) Sequence.express(RealSequence.class,
                                                   expression,
                                                   RealSequenceSequence.class);
  }

  public static RealSequenceSequence express(String name, String expression)
  {
    return (RealSequenceSequence) Sequence.express(name,
                                                   RealSequence.class,
                                                   expression,
                                                   RealSequenceSequence.class);
  }

  public static RealSequenceSequence express(String name, String expression, Context context)
  {
    return (RealSequenceSequence) Sequence.express(name,
                                                   RealSequence.class,
                                                   expression,
                                                   RealSequenceSequence.class,
                                                   context);
  }

  static RealSequenceSequence express(String expression, Context context)
  {
    return (RealSequenceSequence) Sequence.express(null,
                                                   RealSequence.class,
                                                   expression,
                                                   RealSequenceSequence.class,
                                                   context);
  }

}