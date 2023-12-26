package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.stream.IntStream;

import arb.*;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.expressions.Variables;
import arb.functions.MultivariateFunction;
import arb.functions.real.RealFunction;

/**
 * The Jacobi polynomials are recursively defined by
 * 
 * <pre>
 * Initial Conditions:
 * 
 *   Pfunc(0,x) = 1
 *   Pfunc(1,x) = (C(1)x+α-β)/2
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
 *   P[n] = (x * A(n) * P(n-1,x) - B(n) * P(n-2,x)) / E(n)
 * </pre>
 * 
 * The polynomials P(n) are mutually orthogonal with respect to the weight
 * function
 * 
 * (1 - x)^α * (1 + x)^β
 * 
 * over the interval [-1, 1].
 * 
 * <pre>
 * 
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class JacobiPolynomialSequence<J extends JacobiPolynomial<? extends JacobiPolynomial<?>>> implements
                                     OrthogonalBasis<Real, J>,
                                     AutoCloseable
{
  public int                              bits    = 128;
  public Real                             α       = new Real().setName("α");
  public Real                             β       = new Real().setName("β");
  public Real                             n       = new Real().setName("n");
  final public Real                       G       = new Real().setName("G");
  final public RealMatrix                 O;
  final public ArrayList<RealPolynomial>  P;
  final Variables                         vars    = new Variables(α,
                                                                  β,
                                                                  n,
                                                                  G);

  final Context                           context = new Context(vars);

  final public static boolean             verbose = false;

  final public RealFunction               C       = RealFunction.express("C", "n➔2*n+α+β", context, verbose);

  final public RealFunction               F       = RealFunction.express("F", "n➔C(n-1)*C(n)", context, verbose);

  final public RealFunction               A       = RealFunction.express("A",
                                                                         "(n,x)➔(F(n)*x + G)*(C(n)/2 - ½)",
                                                                         context,
                                                                         verbose);

  final public RealFunction               E       = RealFunction.express("E", "n➔n*C(n/2)*C(n-1)", context, verbose);

  final public RealFunction               B       = RealFunction.express("B",
                                                                         "n➔(n+α-1)*(n+β-1)*C(n)",
                                                                         context,
                                                                         verbose);

  final public RealFunction               p1      = RealFunction.express("p1", "x➔(C(1)*x-β+α)/2", context, verbose);

  final public MultivariateFunction<Real> Pfunc   = MultivariateFunction.express("P",
                                                                                 "(n,z)➔(A(n) * z * P(n-1,z) - B(n) * P(n-2,z)) / 2",
                                                                                 context,
                                                                                 true);

  public int                              N;

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
    n.close();
    O.close();
    P.forEach(RealPolynomial::close);
  }

}
