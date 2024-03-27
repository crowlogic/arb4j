package arb.functions.polynomials;

import java.util.Comparator;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.functions.real.RealPolynomialNullaryFunction;

/**
 * Represents a hypergeometric polynomial, defined by a terminating
 * hypergeometric series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
 * 
 * This class encapsulates the computation and representation of hypergeometric
 * polynomials, which are derived from the general hypergeometric series when
 * certain conditions lead to its termination after a finite number of terms.
 * <p>
 * A hypergeometric series terminates and simplifies into a polynomial when at
 * least one of its upper parameters (α) is a non-positive integer. This
 * condition ensures that the series has a finite number of non-zero terms,
 * making it possible to represent the series as a polynomial of finite degree.
 * </p>
 * <p>
 * The implementation uses parameters p and q, which are the dimensions of
 * vectors α and β, respectively. These parameters, along with the vectors
 * themselves, define the hypergeometric series. The series is evaluated up to a
 * specific order N, determined by the smallest non-positive integer in α,
 * ensuring the series terminates. This class provides methods to initialize the
 * polynomial, verify the terminating condition, and evaluate the polynomial,
 * encapsulating the complexity of handling hypergeometric functions in a
 * computational context.
 * </p>
 * <p>
 * Note: The verify method checks for the presence of at least one non-positive
 * integer in α, a condition necessary for the hypergeometric series to
 * terminate.
 * </p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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

    F =
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
     .min(Comparator.naturalOrder())
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
