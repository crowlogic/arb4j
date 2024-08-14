package arb.functions.polynomials;

import java.util.Comparator;
import java.util.function.Predicate;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

/**
 * FIXME: generify this class along with
 * {@link RealPolynomialHypergeometricFunction} and then implement an
 * IntererPolynomialHypergeometricFunction (generically)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexPolynomialHypergeometricFunction implements
                                                     ComplexPolynomialNullaryFunction,
                                                     Verifiable
{

  public Context                                                                 context;

  private ComplexPolynomialNullaryFunction                                       f;

  public Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> F;

  boolean                                                                        initialized                     =
                                                                                             false;

  public Integer                                                                 N;

  public Integer                                                                 p, q;

  public Complex                                                                 α, β;

  public static final Predicate<
  ? super Complex>                                                               complexNegativeIntegerPredicate =
                                                                                                                 z -> Real.isNegativeInteger.test(z.re())
                                                                                                                      && z.im()
                                                                                                                          .isZero();

  public ComplexPolynomialHypergeometricFunction()
  {

  }

  public ComplexPolynomialHypergeometricFunction(int p,
                                                 int q,
                                                 Expression<Object, ComplexPolynomial,
                                                 ComplexPolynomialNullaryFunction> arg)
  {
    this(Complex.newVector(p),
         Complex.newVector(q),
         arg);
  }

  public ComplexPolynomialHypergeometricFunction(Complex α,
                                                 Complex β,
                                                 Expression<Object, ComplexPolynomial,
                                                 ComplexPolynomialNullaryFunction> arg)
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

    F = ComplexPolynomialNullaryFunction.parse("F",
                                               "Σn➔zⁿ⋅∏k➔αₖ₍ₙ₎{k=1…p}/(n!⋅∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N}",
                                               context)
                                        .substitute("z",
                                                    arg);
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

  @SuppressWarnings("resource")
  public Integer
         determineDegree()
  {
    return α.stream()
            .filter(complexNegativeIntegerPredicate)
            .map(q -> q.re())
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public ComplexPolynomial
         evaluate(Object nullary,
                  int order,
                  int bits,
                  ComplexPolynomial res)
  {
    if (!initialized)
    {
      initialize();
    }

    f.evaluate(nullary,
               order,
               bits,
               res);
    return res;
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
            .anyMatch(complexNegativeIntegerPredicate);
  }

}