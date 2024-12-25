package arb.functions;

import arb.Fraction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NullaryFractionFunction extends
                                         NullaryFunction<Fraction>
{

  public static NullaryFractionFunction express(String string)
  {
    return NullaryFunction.express(Fraction.class, NullaryFractionFunction.class, string);
  }

  public static Expression<Object, Fraction, NullaryFractionFunction> parse(String string)
  {
    return NullaryFunction.parse(Fraction.class, NullaryFractionFunction.class, string);
  }

}
