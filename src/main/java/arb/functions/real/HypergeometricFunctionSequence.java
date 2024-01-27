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
    try ( var F = new HypergeometricFunctionSequence(3,
                                                     1);
          var index = new Integer())
    {
      F.α.set(1, 4, -4);
      F.β.set(0.5);

      for (int n = 0; n < 5; n++)
      {
        RealPolynomial fn = F.F.evaluate(index.set(n), 0, 128, new RealPolynomial());
        out.format("F(%d,x)=%s\n", n, fn);
      }
    }
  }

  public final Context                           context;

  public final Real                              α, β;

  public final Function<Integer, RealPolynomial> F;

  public static final String                     Fdef = "n➔when(n=0,1,else,x*F(n-1)*(∏α₍ₖ₎(k=1…p)/∏β₍ₖ₎(k=1…q))";

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
