package arb.functions.real;

import static java.lang.System.out;

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

  public static void main(String... args)
  {
    HypergeometricFunctionSequence F  = new HypergeometricFunctionSequence(3,
                                                                           1);
    RealPolynomial                 F0 = F.evaluate(new Integer(0), 0, 128, new RealPolynomial());
    out.println("F0=" + F0);
    RealPolynomial F1 = F.evaluate(new Integer(1), 0, 128, new RealPolynomial());
    out.println("F1=" + F1);
  }

  public final Context                           context;

  public final Real                              α, β;

  public final Function<Integer, RealPolynomial> F;

  public static final String                     Fdef = "n➔when(n=0,1,else,x*F(n-1))";

  public HypergeometricFunctionSequence(int p, int q)
  {
    context = new Context(α = Real.newVector(p).setName("α"),
                          β = Real.newVector(q).setName("β"));
    F       = Function.express(Integer.class, RealPolynomial.class, "F", Fdef, context);
  }

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial f)
  {
    return F.evaluate(n, order, bits, f);
  }

}
