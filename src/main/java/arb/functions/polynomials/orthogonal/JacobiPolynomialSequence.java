package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.stream.IntStream;

import arb.*;
import arb.Integer;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.expressions.Variables;
import arb.functions.Function;
import arb.functions.IntegerToRealPolynomialFunction;
import arb.functions.MultivariateFunction;
import arb.functions.real.RealFunction;

/**
 * The Jacobi polynomials are recursively defined by
 * 
 * <pre>
 * Initial Conditions: both α,β>-1 fixed
 * 
 *   P(0,x) = 1
 *   P(1,x) = (C(1)*x-β+α)/2
 * 
 * Coefficient Functions:
 * 
 *   C(n) = 2n + α + β
 *   F(n) = C(n-1)*C(n)
 *   G = α²-β²
 *   A(n) = ( F(n)*x + G )*(C(n)-1)/2
 *   B(n) = (n + α - 1) * (n + β - 1) * C(n)
 *   E(n) = n * C(n/2) * C(n - 1)
 *   
 * Recurrence Relation for n >= 2:
 * 
 *  P(n,x)=(A(n) * x * P(n-1,x) - B(n) * P(n-2,x)) / 2
 *  
 * </pre>
 * 
 * The polynomials P(n,x) are mutually orthogonal with respect to the weight
 * function
 * 
 * (1 - x)^α * (1 + x)^β
 * 
 * over the interval [-1, 1].<br><br>
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
public class JacobiPolynomialSequence<J extends JacobiPolynomial<? extends JacobiPolynomial<?>>> implements
                                     OrthogonalBasis<Real, J>,
                                     AutoCloseable
{
  public int                                     bits    = 128;
  public Real                                    α       = new Real().setName("α");
  public Real                                    β       = new Real().setName("β");
  final public Real                              G       = new Real().setName("G");
  final public RealMatrix                        O;
  final public ArrayList<RealPolynomial>         P;
  final Variables                                vars    = new Variables(α,
                                                                         β,
                                                                         G);

  final Context                                  context = new Context(vars);

  final public static boolean                    verbose = false;

  final public Function<Integer, Real>           C       = Function.express(Integer.class,
                                                                            Real.class,
                                                                            "C",
                                                                            "n➔2*n+α+β",
                                                                            context,
                                                                            verbose);

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
                                                                            true);

  final public Function<Integer, Real>           E       = Function.express(Integer.class,
                                                                            Real.class,
                                                                            "E",
                                                                            "n➔n*C(n/2)*C(n-1)",
                                                                            context,
                                                                            verbose);

  final public Function<Integer, Real>           B       = Function.express(Integer.class,
                                                                            Real.class,
                                                                            "B",
                                                                            "n➔(n+α-1)*(n+β-1)*C(n)",
                                                                            context,
                                                                            verbose);

  final public RealFunction                      p1      = RealFunction.express("p1",
                                                                                "x➔(C(1)*x-β+α)/2",
                                                                                context,
                                                                                verbose);

  final public Function<Integer, RealPolynomial> Pfunc   = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "P",
                                                                            "n➔(A(n) * z * P(n-1,z) - B(n) * P(n-2,z)) / 2",
                                                                            context,
                                                                            true);

  public int                                     N;

  public JacobiPolynomialSequence(Real a, Real b, int N)
  {
    this.N = N;
    bits   = Math.max(128, Math.max(a.bits(), b.bits()));
    a.pow(2, bits, α).sub(b.pow(2, bits, β), bits, G);
    this.α.set(a);
    this.β.set(b);
    O = RealMatrix.newMatrix(N + 2, N + 2);
    P = new ArrayList<>(N + 2);
    for (int i = 0; i < N + 2; i++)
    {
      RealPolynomial p = new RealPolynomial(O.getRowPointer(i),
                                            false);
      p.setLength(i);
      P.set(i, p);
      System.out.format("p[%d]=%s\n", i, p);
    }
  }

  public Real compute()
  {
    try ( Real realn = new Real())
    {
      IntStream.range(2, N + 1).forEach(n ->
      {
        // Pfunc.evaluate(realn.set(n), bits, P.get(n));
      });
    }

    return null;// P
  }

  @Override
  public Iterator<J> iterator()
  {
    assert false : "TODO";
    return null;
  }

  public final RealFunction orthogonalMeasure = RealFunction.express("x➔(1-x)^α*(1+x)^β", context, verbose);

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
    O.close();
    P.forEach(RealPolynomial::close);
  }

}
