package arb.functions.complex.numbertheoretic;

import static arb.expressions.Expression.express;

import arb.Real;
import arb.RealConstants;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

public class ZVarianceStructure implements
                                RealFunction
{
  private static final String EXPRESSION = "a-b*J₀(λ*t)";

  @Override
  public String toString()
  {
    return getClass().getSimpleName() + "[" + EXPRESSION + "]";
  }

  private Variables<Real> vars = new Variables<>();

  public Real             a    = new Real(), b = new Real(), λ = new Real();

  public ZVarianceStructure()
  {
    super();
    vars.put("a", a.set(RealConstants.one));
    vars.put("b", b.set(RealConstants.one));
    vars.put("λ", λ.set(RealConstants.one));
    kernel = express(EXPRESSION, vars);
  }

  final public RealFunction kernel;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return kernel.evaluate(t, order, bits, res);
  }

}
