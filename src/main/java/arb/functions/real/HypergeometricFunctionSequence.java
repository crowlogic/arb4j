package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Context;
import arb.functions.Function;

/**
 * ...
 */
public class HypergeometricFunctionSequence implements

                                            Function<Integer, RealPolynomial>
{
  public final Context context = new Context();
  public final Real    α, β;

  public HypergeometricFunctionSequence(int p, int q)
  {
    context.registerVariable("α", α = Real.newVector(p));
    context.registerVariable("β", β = Real.newVector(q));
  }

  final public Function<Integer, RealPolynomial> F = Function.express(Integer.class,
                                                                      RealPolynomial.class,
                                                                      "F",
                                                                      "n➔when(n=0,1,else,x*F(n-1)...)",
                                                                      context);

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial f)
  {
    return F.evaluate(n, order, bits, f);
  }

}
