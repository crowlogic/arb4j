package arb.functions.complex.numbertheoretic;

import static arb.RealConstants.one;
import static arb.expressions.Expression.express;

import arb.Real;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

public class ZStructureFunction implements
                                RealFunction
{
  private static final String EXPRESSION = "a-b*J₀(λ*t)";

  @Override
  public String toString()
  {
    return getClass().getSimpleName() + "[" + EXPRESSION + "]";
  }

  private Variables<Real> vars = new Variables<>();

  public Real             a    = new Real();
  public Real             b    = new Real();
  public Real             λ    = new Real();

  public ZStructureFunction()
  {
    super();
    vars.put("a", a.set(one));
    vars.put("b", b.set(one));
    vars.put("λ", λ.set(one));
    kernel = express(EXPRESSION, vars);
  }

  final public RealFunction kernel;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return kernel.evaluate(t, order, bits, res);
  }

}
