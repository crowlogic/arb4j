package arb.operators;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

public class UnitaryTimeChange implements
                               RealFunction
{

  final Context context = new Context();

  public UnitaryTimeChange(RealFunction f, RealFunction ψ)
  {
    super();

    context.registerFunction("f", f);
    context.registerFunction("ψ", ψ);
    u = RealFunction.parse("U:t->sqrt(diff(ψ(t),t))*f(ψ(t))", context);
    Ufunc = u.instantiate();
  }

  final RealFunction Ufunc;
  private Expression<Real, Real, RealFunction> u;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return Ufunc.evaluate(t, order, bits, res);
  }

}
