package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;

public class RealContext extends
                         Context<Real, RealFunction>
{

  public RealContext(Variables<Real> vars)
  {
    super(vars);
  }

}
