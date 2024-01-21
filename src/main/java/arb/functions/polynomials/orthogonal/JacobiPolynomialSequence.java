package arb.functions.polynomials.orthogonal;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;

import arb.Integer;
import arb.OrthogonalBasis;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.expressions.Variables;
import arb.functions.A;
import arb.functions.B;
import arb.functions.C;
import arb.functions.E;
import arb.functions.F;
import arb.functions.Function;
import arb.functions.G;
import arb.functions.P;
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
 *  G() = α² - β²
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
  public final Real                              α       = new Real().setName("α");
  public final Real                              β       = new Real().setName("β");
  final Variables                                vars    = new Variables(α,
                                                                         β);

  final Context                                  context = new Context(vars);

  final public static boolean                    verbose = false;

  boolean                                        dynamic = true;

  final public C                                 aC      = new C();

  final public F                                 aF      = new F();

  final public E                                 aE      = new E();

  final public P                                 aP      = new P();

  final public A                                 aA      = new A();
  final public B                                 aB      = new B();

  final public G                                 aG      = new G();

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

  final public Function<Void, Real>              G       = Function.express(Void.class,
                                                                            Real.class,
                                                                            "G",
                                                                            "α²-β²",
                                                                            context,
                                                                            verbose);
  
  final public Function<Integer, RealPolynomial> A       = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "A",
                                                                            "n➔(F(n)*x + G())*(C(n) - 1)/2",
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
    try
    {
      P.getClass().getField("α").set(P, aP.α = α.set(a));
      P.getClass().getField("β").set(P, aP.β = β.set(b));
      P.getClass().getMethod("initializeContext").invoke(P);
    }
    catch (IllegalArgumentException | IllegalAccessException | NoSuchFieldException | SecurityException
                  | InvocationTargetException | NoSuchMethodException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
//    aP.β = β.set(b);
//    aP.initializeContext();
//    aA.initializeContext();
//    aB.initializeContext();
//    aC.initializeContext();
//    aE.initializeContext();
//    aF.initializeContext();
//    aG.initializeContext();
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
  }

}
