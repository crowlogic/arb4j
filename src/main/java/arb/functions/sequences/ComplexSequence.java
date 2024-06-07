package arb.functions.sequences;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexSequence extends
                                 Sequence<Complex>
{
  @Override
  default Complex newCoDomainInstance()
  {
    return new Complex();
  }

  public static ComplexSequence express(String expression)
  {
    return (ComplexSequence) Sequence.express(Complex.class, expression, ComplexSequence.class);
  }

  public static ComplexSequence express(String name, String expression)
  {
    return (ComplexSequence) Sequence.express(name, Complex.class, expression, ComplexSequence.class);
  }

  public static ComplexSequence express(String name, String expression, Context context)
  {
    return (ComplexSequence) Sequence.express(name, Complex.class, expression, ComplexSequence.class, context);
  }

}
