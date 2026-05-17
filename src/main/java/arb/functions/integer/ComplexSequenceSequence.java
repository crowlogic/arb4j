package arb.functions.integer;

import javax.annotation.Nullable;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;

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
    return Sequence.express(name, ComplexSequence.class, expression, ComplexSequenceSequence.class, context);
  }

  static ComplexSequenceSequence express(String expression, Context context)
  {
    return Sequence.express(null, ComplexSequence.class, expression, ComplexSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexSequence, ComplexSequenceSequence> compile(@Nullable String name, String string2, Context context)
  {
    return Sequence.compile(ComplexSequence.class, name, ComplexSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexSequence, ComplexSequenceSequence> compile(String name, Context context)
  {
    return compile(null, name, context);
  }

}