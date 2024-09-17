package arb.functions.real;

import arb.Real;
import arb.expressions.Expression;

public class RealFunctional implements
                            RealFunction
{
  private RealFunction instance;

  public RealFunctional(Expression<Real, Real, RealFunction> expression)
  {
    this.instance = expression.instantiate();
  }

  @Override
  public Real evaluate(Real x, int order, int bits, Real result)
  {
    return instance.evaluate(x, order, bits, result);
  }

  @Override
  public String toString()
  {
    return instance.toString();
  }
}