package arb.functions.polynomials;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.Verifiable;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 *
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
      assert 4 == ((Integer) F.context.getVariable("N")).getSignedValue();
      out.format("F(%d)=%s\n", point, fn);

    }
  }

  public final Context              context;

  public final Real                 α, β;

  public final Integer              p, q;

  public final Function<Real, Real> F;

  private Integer                   N;

  boolean                           initialized = false;

  @SuppressWarnings("resource")
  public HypergeometricPolynomial(int p, int q)
  {
    context = new Context(this.p = new Integer(p).setName("p"),
                          this.q = new Integer(q).setName("q"),
                          α = Real.newVector(p).setName("α"),
                          β = Real.newVector(q).setName("β"));
    context.registerVariable("N", N = new Integer());

    context.saveClasses = true;
    F                   = RealFunction.express("F",
                                               "z➔Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})n{n=0…N}",
                                               context);
  }

  @Override
  public Real evaluate(Real n, int order, int bits, Real f)
  {
    if (!initialized)
    {
      if (!verify())
      {
        throw new ArbException("at least one of the upper parameters must be a non-negative integer but there is none among "
                      + α);
      }

      α.stream().filter(αᵢ -> αᵢ.isInteger() && αᵢ.isNegative()).min((a, b) -> a.compareTo(b)).get().integerValue(N);
      initialized = true;
    }
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
