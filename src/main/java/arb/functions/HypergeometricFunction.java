package arb.functions;

import java.util.Comparator;

import arb.Integer;
import arb.Polynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.Verifiable;
import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * Represents a hypergeometric {@link Real}-valued {@link Polynomial}, that is,
 * a {@link RealPolynomial}, defined by a finite hypergeometric series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔αₖ₍ₙ₎{k=1…p}/(n!*∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
 * 
 * This class encapsulates the computation and representation of hypergeometric
 * polynomials, which are derived from the general hypergeometric series when
 * the existence of a negative integer in the numerator leads to its completion
 * after a finite number of terms.
 * <p>
 * A hypergeometric series is finite and simplifies into a {@link Polynomial}
 * when at least one of its upper parameters (α) is a negative {@link Integer}.
 * This condition ensures that the series has a finite number of non-zero terms,
 * making it possible to represent the series as a polynomial of finite degree.
 * </p>
 * <p>
 * The implementation uses parameters p and q, which are the dimensions of the
 * vectors α and β, respectively. These parameters, along with the vectors
 * themselves, define the hypergeometric series.<br>
 * <br>
 * 
 * The notation x₍n₎ represents the n-th
 * {@link Real#ascendingFactorial(long, int, Real)} of x. <br>
 * <br>
 * 
 * The series is evaluated up to a specific order N, determined by the smallest
 * non-positive integer in α, ensuring the series is finite. This class provides
 * methods to initialize the polynomial, verify the finiteness condition, and
 * evaluate the polynomial, encapsulating the complexity of handling
 * hypergeometric functions in a computational context.
 * </p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricFunction<R extends Ring<?>, N extends NullaryFunction<R>> implements
                                   NullaryFunction<R>,
                                   Verifiable
{

  public Context                  context;

  private N                       f;

  public Expression<Object, R, N> F;

  boolean                         initialized = false;

  private Integer                 N;

  public Integer                  p, q;

  public Real                     α, β;

  public HypergeometricFunction()
  {

  }

  public HypergeometricFunction(Class<R> elementType,
                                Class<N> nullaryFunctionType,
                                int p,
                                int q,
                                Expression<Object, R, N> arg)
  {
    init(elementType,
         nullaryFunctionType,
         Real.newVector(p),
         Real.newVector(q),
         arg);
  }

  public HypergeometricFunction<R, N>
         init(Class<R> elementType,
              Class<N> nullaryFunctionType,
              Real α,
              Real β,
              Expression<Object, R, N> arg)
  {
    this.α  = α;
    this.β  = β;
    context = new Context(p = new Integer(α.dim,
                                          "p"),
                          q = new Integer(β.dim,
                                          "q"),
                          α.setName("α"),
                          β.setName("β"));

    context.registerVariable("N",
                             N = new Integer());

    F = NullaryFunction.parse(elementType,
                              nullaryFunctionType,
                              "F",
                              "Σn➔zⁿ⋅∏k➔αₖ₍ₙ₎{k=1…p}/(n!⋅∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N}",
                              context);
    F = F.substitute("z",
                     arg);

    return this;
  }

  @Override
  public void

         close()
  {
    p.close();
    q.close();
    α.close();
    β.close();
    N.close();
  }

  public Integer
         determineDegree()
  {
    return α.stream()
            .filter(Real.isNegativeInteger)
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public R
         evaluate(Object nullary,
                  int order,
                  int bits,
                  R res)
  {
    if (!initialized)
    {
      initialize();
    }

    return f.evaluate(nullary,
                      order,
                      bits,
                      res);
  }

  public void
         initialize()
  {
    if (!verify())
    {
      α.printPrecision = true;
      throw new ArbException("at least one of the upper parameters must be a non-negative integer but there is none among "
                             + α);
    }

    f = F.instantiate();

    determineDegree();

    initialized = true;
  }

  /**
   * @return true if there is at least one strictly nonnegative integer in the
   *         numerator (the condition ensuring the finite number of non-zero terms
   *         in the hypergeometric series this function generates) and there are
   *         no negative integers or zero in the denominator
   */
  @Override
  public boolean
         verify()
  {
    return α.stream()
            .anyMatch(Real.isNegativeInteger);
  }

}