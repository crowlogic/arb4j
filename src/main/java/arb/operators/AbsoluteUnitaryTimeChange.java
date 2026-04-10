package arb.operators;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

/**
 * U:t->√(|∂ψ(t)/∂t|)*f(ψ(t)) <br>
 * <br>
 * TODO: make an Operator which would
 * be a Function<RealFunction,RealFunction> which would map a function to the
 * function unitarily composed with another function<br>
 * 
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class AbsoluteUnitaryTimeChange implements
                                       RealFunction
{

  final Context context = new Context();

  public AbsoluteUnitaryTimeChange(RealFunction f, RealFunction ψ)
  {
    super();

    context.registerFunction("f", f);
    context.registerFunction("ψ", ψ);
    u     = RealFunction.parse("U:t->√(|∂ψ(t)/∂t|)*f(ψ(t))", context);
    Ufunc = u.instantiate();
  }

  final RealFunction                           Ufunc;
  private Expression<Real, Real, RealFunction> u;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return Ufunc.evaluate(t, order, bits, res);
  }

}
