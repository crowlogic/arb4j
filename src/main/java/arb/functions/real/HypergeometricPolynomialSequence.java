package arb.functions.real;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Verifiable;
import arb.expressions.Context;
import arb.functions.Function;

/**
 * ...
 */
public class HypergeometricPolynomialSequence implements
                                              Function<Integer, RealPolynomial>,
                                              Verifiable
{

  @Override
  public void close()
  {
    p.close();
    q.close();
    α.close();
    β.close();
  }

  public static void main(String... args)
  {
    try ( var F = new HypergeometricPolynomialSequence(2,
                                                       1);
          var index = new Integer())
    {
      F.α.set(4, -4);
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

  public final Integer                           p, q;

  public final Function<Integer, RealPolynomial> F;

  @SuppressWarnings("resource")
  public HypergeometricPolynomialSequence(int p, int q)
  {
    context             = new Context(this.p = new Integer(p).setName("p"),
                                      this.q = new Integer(q).setName("q"),
                                      α = Real.newVector(p).setName("α"),
                                      β = Real.newVector(q).setName("β"));
    context.saveClasses = true;
    F                   = Function.express(Integer.class,
                                           RealPolynomial.class,
                                           "F",
                                           "n➔when(n=0,1,else,x*F(n-1)*∏α[k]₍ₙ₋₁₎{k=1…p}/((n-1)!*∏β[k]₍ₙ₋₁₎{k=1…q}))",
                                           context);
  }

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial f)
  {
    return F.evaluate(n, order, bits, f);
  }

  /**
   * @return true if there is at least one strictly nonnegative integer in the
   *         numerator (the condition ensuring the finite number of non-zero terms
   *         in the hypergeometric series this function generates)
   */
  @Override
  public boolean verify()
  {
    return α.stream().anyMatch(αᵢ -> αᵢ.isInteger() && αᵢ.isNegative());
  };

}
