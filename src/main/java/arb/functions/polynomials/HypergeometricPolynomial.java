package arb.functions.polynomials;

import java.util.function.Predicate;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Verifiable;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.functions.real.RealPolynomialNullaryFunction;

/**
 *
 */
public class HypergeometricPolynomial implements
                                      RealPolynomialNullaryFunction,
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

  public final Context                       context;

  public final Real                          α, β;

  public final Integer                       p, q;

  public final RealPolynomialNullaryFunction F;

  private Integer                            N;

  boolean                                    initialized = false;

  @SuppressWarnings("resource")
  public HypergeometricPolynomial(int p, int q)
  {
    context = new Context(this.p = new Integer(p).setName("p"),
                          this.q = new Integer(q).setName("q"),
                          α = Real.newVector(p).setName("α"),
                          β = Real.newVector(q).setName("β"));
    context.registerVariable("N", N = new Integer());

    context.saveClasses = true;
//    F                   = new F();
//    context.injectVariableReferences(F);
    F                   =
      RealPolynomialNullaryFunction.express("F",
                                            "Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}",
                                            context);
  }

  @Override
  public RealPolynomial evaluate(Void nullary, int order, int bits, RealPolynomial f)
  {
    if (!initialized)
    {
      if (!verify())
      {
        throw new ArbException("at least one of the upper parameters must be a non-negative integer but there is none among "
                               + α);
      }

      determinePolynomialOrder();

      initialized = true;
    }
    return F.evaluate(null, order, bits, f);
  }


  public void determinePolynomialOrder()
  {
    α.stream()
     .filter(Real.isNegativeInteger)
     .min((a, b) -> a.compareTo(b))
     .get()
     .integerValue(N)
     .neg()
     .add(1);
  }

  /**
   * @return true if there is at least one strictly nonnegative integer in the
   *         numerator (the condition ensuring the finite number of non-zero terms
   *         in the hypergeometric series this function generates)
   */
  @Override
  public boolean verify()
  {
    return α.stream().anyMatch(Real.isNegativeInteger);
  }

}
