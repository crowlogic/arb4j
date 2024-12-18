package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealNullaryFunctional extends
                                       NullaryFunctional<Real, Real, RealFunction>
{

  @Override
  default RealFunction evaluate(int bits)
  {
    return evaluate(null, 0, bits, null);
  }

  @Override
  public default RealFunction evaluate()
  {
    return evaluate(null, 0);
  }

  public static RealNullaryFunctional express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealNullaryFunctional express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealNullaryFunctional express(String name, String expression, Context context)
  {
    return Function.express(Object.class, RealFunction.class, RealNullaryFunctional.class, name, expression, context);
  }

}
