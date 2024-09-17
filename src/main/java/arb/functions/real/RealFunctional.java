package arb.functions.real;

import arb.Real;
import arb.expressions.Expression;
import arb.functions.Function;

public class RealFunctional<K> implements
                            Function<K,RealFunction>
{
  private RealFunction instance;

  public RealFunctional(Expression<Real, Real, RealFunction> expression)
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