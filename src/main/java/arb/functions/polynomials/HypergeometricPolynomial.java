package arb.functions.polynomials;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Verifiable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * TODO: handle https://github.com/crowlogic/arb4j/issues/347 nested nAry functions
 */
public class HypergeometricPolynomial implements
                                              RealFunction,
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
    try ( var F = new HypergeometricPolynomial(2,
                                                       1);
          var point = new Real())
    {
      F.α.set(4, -4);
      F.β.set(0.5);

      Real fn = F.F.evaluate(point.set(3.4), 0, 128, new Real());

      out.format("F(%d)=%s\n", point, fn);

    }
  }

  public final Context              context;

  public final Real                 α, β;

  public final Integer              p, q;

  public final Function<Real, Real> F;

  @SuppressWarnings("resource")
  public HypergeometricPolynomial(int p, int q)
  {
    context             = new Context(this.p = new Integer(p).setName("p"),
                                      this.q = new Integer(q).setName("q"),
                                      α = Real.newVector(p).setName("α"),
                                      β = Real.newVector(q).setName("β"));
    context.saveClasses = true;
    F                   = RealFunction.express("F", "z➔Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/n!*∏k➔β[k]₍ₙ₎{k=1…q}{n=0…N}", context);
  }

  @Override
  public Real evaluate(Real n, int order, int bits, Real f)
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
