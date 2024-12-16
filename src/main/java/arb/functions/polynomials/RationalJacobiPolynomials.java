package arb.functions.polynomials;

import java.util.Iterator;

import arb.Fraction;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.functions.FractionFunction;
import arb.functions.NullaryFunction;
import arb.functions.integer.FractionSequence;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.real.RealFunction;

/**
 *
 * The Jacobi polynomials are mutually orthogonal with respect to the weight
 * function
 * 
 * <pre>
 * (1-x)ᵅ(1+x)ᵝ
 * </pre>
 * 
 * over the interval [-1,1] when α,β>-1 and are recursively defined by
 * 
 * The Jacobi polynomials are also known as a
 * {@link RealPolynomialHypergeometricFunction}s
 * 
 * <pre>
 *  C(n)=2n+α+β
 *  F(n)=C(n-1)C(n)
 *  G()=α²-β²
 *  A(n,x)=(F(n)x+G)*((C(n)-1)/2)
 *  B(n)=(n+α-1)(n+β-1)*C(n)
 *  E(n)=n*C(n/2)*C(n-1)
 *  P(0,x)=1
 *  P(1,x)=(C(1)x+α-β)/2  
 *  P(n,x)=(A(n,x)*P(n-1,x)-B(n)*P(n-2,x))/E(n)∀n≥2
 * 
 * </pre>
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalJacobiPolynomials implements
                                       AutoCloseable,
                                       OrthogonalSequence<Fraction, RationalFunction>
{

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;

  }

  public static Real                     domain  = new Real("0+/-1",
                                                            128);

  public int                             bits    = 128;

  @SuppressWarnings("resource")
  public final Real                      α       = new Real().setName("α");

  @SuppressWarnings("resource")
  public final Real                      β       = new Real().setName("β");

  final public Context                   context = new Context(α,
                                                               β);

  /**
   * This must have a domain of Fraction rather than being a FractionSequence
   * which would have a domain of Integers, this is because the E function calls C
   * with non-integer n
   */
  final public FractionFunction          C       = FractionFunction.express("C", "n➔2*n+α+β", context);

  final public FractionSequence          F       = FractionSequence.express("F", "n➔C(n-1)*C(n)", context);

  final public NullaryFunction<Fraction> G       = NullaryFunction.express(Fraction.class, "G", "α²-β²", context);

  final public RationalFunctionSequence  A       =
                                           RationalFunctionSequence.express("A", "n➔(F(n)*x+G())*(C(n)-1)/2", context);

  final public FractionSequence          E       = FractionSequence.express("E", "n➔n*C(n/2)*C(n-1)", context);

  final public FractionSequence          B       = FractionSequence.express("B", "n➔(n+α-1)*(n+β-1)*C(n)", context);

  final public RationalFunctionSequence  P       =
                                           RationalFunctionSequence.express("P",
                                                                            "n➔when(n=0,1,n=1,(C(1)*x-β+α)/2,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))",
                                                                            context);

  protected RealFunction                 orthogonalityMeasure;

  public RationalJacobiPolynomials(Real a, Real b)
  {
    bits = Math.max(128, Math.max(a.bits(), b.bits()));
    this.α.set(a);
    this.β.set(b);

  }

  @Override
  public void close()
  {
    α.close();
    β.close();
    domain.close();
  }

  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    P.evaluate(t, order, bits, res);
    res.refreshPointers();
    return res;
  }

  @SuppressWarnings("resource")
  public static Fraction negOne = new Fraction().set(-1, 1);

  @SuppressWarnings("resource")
  public static Fraction one    = new Fraction().set(1, 1);

  @Override
  public Domain<Fraction> domainOfOrthogonality()
  {
    return new Domain<Fraction>()
    {
      @Override
      public boolean contains(Fraction point)
      {
        return point.compareTo(negOne) >= 0 && point.compareTo(one) <= 0;
      }
    };
  }

  @Override
  public RealFunction orthogonalityMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔(1-x)^α*(1+x)^β", context);
    }
    return orthogonalityMeasure;
  }

  @Override
  public Iterator<RationalFunction> iterator()
  {
    return new SequenceIterator<>(this);
  }

  @Override
  public RationalFunction enumerate(int i, int j)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}