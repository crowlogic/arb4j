package arb.functions.real;

import arb.expressions.Expression;
import arb.functions.Function;

/*
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealFunctional<K, F extends Function<? extends K, RealFunction>> implements
                           Function<K, RealFunction>
{
  private F instance;

  public RealFunctional(Expression<? extends K, RealFunction, ? extends F> expression)
  {
    this.instance = expression.instantiate();
  }

  @Override
  public String toString()
  {
    return instance.toString();
  }

  @Override
  public RealFunction evaluate(K t, int order, int bits, RealFunction res)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}