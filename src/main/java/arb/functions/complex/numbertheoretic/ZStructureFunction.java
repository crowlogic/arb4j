package arb.functions.complex.numbertheoretic;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.RealConstants;
import arb.expressions.RealContext;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

public class ZStructureFunction implements
                                RealFunction
{
  private static final String EXPRESSION = "a-b*J0(t*λ)";

  @Override
  public String toString()
  {
    return getClass().getSimpleName() + "[" + EXPRESSION + "]";
  }

  Variables<Real> vars = new Variables<>();

  RealContext context = new RealContext(vars);
  
  public Real             a    = new Real();
  public Real             b    = new Real();
  public Real             λ    = new Real();

  public ZStructureFunction()
  {
    super();
    vars.put("a", a.set(RealConstants.one));
    vars.put("b", b.set(RealConstants.one));
    vars.put("λ", λ.set(RealConstants.one));
    kernel = express(EXPRESSION, context);
  }

  final public RealFunction kernel;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return kernel.evaluate(t, order, bits, res);
  }

}
