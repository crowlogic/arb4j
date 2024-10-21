package arb.functions.polynomials.orthogonal.real;

import java.util.Iterator;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.functions.integer.RealPolynomialSequence;
import arb.functions.integer.RealSequence;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.polynomials.RealPolynomialSequenceIterator;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;

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
public class RealJacobiPolynomials implements
                               AutoCloseable,
                               RealOrthogonalPolynomialSequence
{

  public static Real                  domain  = new Real("0+/-1",
                                                         128);

  public int                          bits    = 128;

  @SuppressWarnings("resource")
  public final Real                   α       = new Real().setName("α");

  @SuppressWarnings("resource")
  public final Real                   β       = new Real().setName("β");

  final public Context                context = new Context(α,
                                                            β);

  final public RealFunction           C       = RealFunction.express("C", "n➔2*n+α+β", context);

  final public RealSequence           F       = RealSequence.express("F", "n➔C(n-1)*C(n)", context);

  final public RealNullaryFunction    G       = RealNullaryFunction.express("G", "α²-β²", context);

  final public RealPolynomialSequence A       = RealPolynomialSequence.express("A", "n➔(F(n)*x+G())*(C(n)-1)/2", context);

  final public RealSequence           E       = RealSequence.express("E", "n➔n*C(n/2)*C(n-1)", context);

  final public RealSequence           B       = RealSequence.express("B", "n➔(n+α-1)*(n+β-1)*C(n)", context);

  final public RealPolynomialSequence P       = RealPolynomialSequence.express("P", "n➔when(n=0,1,n=1,(C(1)*x-β+α)/2.0,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))", context);

  private RealFunction                orthogonalityMeasure;

  public RealJacobiPolynomials(Real a,
                           Real b)
  {
    bits = Math.max(128, Math.max(a.bits(), b.bits()));
    this.α.set(a);
    this.β.set(b);

  }

  @Override
  public void
         close()
  {
    α.close();
    β.close();
    domain.close();
  }

  @Override
  public RealPolynomial
         evaluate(Integer t,
                  int order,
                  int bits,
                  RealPolynomial res)
  {
    return P.evaluate(t, order, bits, res);
  }

  @Override
  public Domain<Real>
         domainOfOrthogonality()
  {
    return domain;
  }

  @Override
  public RealFunction
         orthogonalityMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔(1-x)^α*(1+x)^β", context);
    }
    return orthogonalityMeasure;
  }

  @Override
  public Iterator<RealPolynomial>
         iterator()
  {
    return new RealPolynomialSequenceIterator(this);
  }

  @Override
  public RealPolynomial enumerate(int i, int j)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
