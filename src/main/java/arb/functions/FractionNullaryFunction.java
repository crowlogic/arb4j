package arb.functions;

import arb.Fraction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface FractionNullaryFunction extends
                                         NullaryFunction<Fraction>
{

  public static FractionNullaryFunction express(String string)
  {
    return NullaryFunction.express(Fraction.class, FractionNullaryFunction.class, string);
  }

  public static Expression<Object, Fraction, FractionNullaryFunction> parse(String string)
  {
    return NullaryFunction.parse(Fraction.class, FractionNullaryFunction.class, string);
  }

}
