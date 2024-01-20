package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;
import java.util.Iterator;

import arb.Integer;
import arb.OrthogonalBasis;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.expressions.Variables;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 *
 * The Jacobi polynomials are recursively defined by
 * 
 * <pre>
 *  C(n) = 2n + α + β
 *  
 *  F(n) = C(n-1) ⋅ C(n)
 *  
 *  G = α² - β²
 *  
 *  A(n, x) = (F(n) ⋅ x + G) ⋅ ((C(n) - 1) / 2)
 *  
 *  B(n) = (n + α - 1)(n + β - 1)C(n)
 *  
 *  E(n) = n ⋅ C(n/2) ⋅ C(n - 1)
 *  
 *  P(0,x) = 1
 *  
 *  P(1,x) = (C(1) ⋅ x + α - β) / 2
 *  
 *  P(n, x) = (A(n, x) ⋅ P(n - 1, x) - B(n) ⋅ P(n - 2, x)) / E(n) ∀ n ≥ 2
 * </pre>
 * 
 * The polynomials P(n,x) are mutually orthogonal with respect to the weight
 * function
 * 
 * (1 - x)^α * (1 + x)^β
 * 
 * over the interval [-1, 1].<br>
 * <br>
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author Stephen Crowley
 */
public class JacobiPolynomialSequence implements
                                      OrthogonalBasis<Real, RealPolynomial>,
                                      AutoCloseable
{
  public int                                     bits    = 128;
  public Real                                    α       = new Real().setName("α");
  public Real                                    β       = new Real().setName("β");
  final public Real                              G       = new Real().setName("G");
  final Variables                                vars    = new Variables(α,
                                                                         β,
                                                                         G);

  final Context                                  context = new Context(vars);

  final public static boolean                    verbose = false;

  boolean dynamic = true;
//  
//  final public C                                 C       = new C();
//
//  final public F                                 F       = new F();
//
//  final public E                                 E       = new E();
//
//  final public P                                 P       = new P();
//
//  final public A                                 A       = new A();
//  final public B                                 B       = new B();
//  
  /**
   * The C function is called with n/2 by the E function therefore its expressed
   * as RealFunction, that is, a Function from ℝ to ℝ
   */
  final public RealFunction                      C       = RealFunction.express("C", "2*n+α+β", context, verbose);

  final public Function<Integer, Real>           F       = Function.express(Integer.class,
                                                                            Real.class,
                                                                            "F",
                                                                            "n➔C(n-1)*C(n)",
                                                                            context,
                                                                            verbose);
  final public Function<Integer, RealPolynomial> A       = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "A",
                                                                            "n➔(F(n)*x + G)*(C(n) - 1)/2",
                                                                            context,
                                                                            verbose);

  final public RealFunction                      E       = RealFunction.express("E",
                                                                                "n➔n*C(n/2)*C(n-1)",
                                                                                context,
                                                                                verbose);

  final public RealFunction                      B       = RealFunction.express("B",
                                                                                "n➔(n+α-1)*(n+β-1)*C(n)",
                                                                                context,
                                                                                verbose);

  final public Function<Integer, RealPolynomial> P       = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "P",
                                                                            "n➔when(n=0,1,n=1,(C(1)*x-β+α)/2,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))",
                                                                            context,
                                                                            verbose);

  public JacobiPolynomialSequence(Real a, Real b)
  {
    bits = Math.max(128, Math.max(a.bits(), b.bits()));
    a.pow(2, bits, α).sub(b.pow(2, bits, β), bits, G);
    this.α.set(a);
    this.β.set(b);

  }

  @Override
  public Iterator<RealPolynomial> iterator()
  {
    assert false : "TODO";
    return null;
  }

  public final RealFunction        orthogonalMeasure = RealFunction.express("w",
                                                                            "x➔(1-x)^α*(1+x)^β",
                                                                            context,
                                                                            verbose);
  public ArrayList<RealPolynomial> cache             = new ArrayList<>();

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    return orthogonalMeasure;
  }

  public static Real domain = new Real("0+/-1",
                                       128);

  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

  @Override
  public void close()
  {
    α.close();
    β.close();
    domain.close();
    G.close();
  }

}
