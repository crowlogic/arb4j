package arb.functions.polynomials.orthogonal;

import static arb.expressions.Expression.express;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.OrthogonalBasis;
import arb.Real;
import arb.domains.Domain;
import arb.expressions.RealContext;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

/**
 * The Jacobi Polynomials are orthogonal with respect to the measure
 * 
 * (1-x)^α*(1+x)^β
 * 
 * over the interval [-1,1].
 * 
 * For the Jacobi polynomials:
 * 
 * Initial condition: P₀(x) = 1
 * 
 * Initial condition: P₁(x) = d₁/2 + x*(α - β)
 * 
 * Recurrence relation: Pₙ(x) = aₙ*x*Pₙ₋₁(x) + bₙ*Pₙ₋₂(x)
 * 
 * coefficients: aₙ = cₙ (α² - β²)
 * 
 * coeffecients: bₙ = cₙ * dₙ
 * 
 * where
 * 
 * Common factor: cₙ = (dₙ - 1) / (dₙ*dₙ₋₁)
 * 
 * with
 * 
 * Common factor: dₙ = 2n + α + β
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class JacobiPolynomialSequence implements
                                      OrthogonalBasis<Real, JacobiPolynomial>,
                                      AutoCloseable
{
  public static int           bits    = 128;
  public Real                 α       = new Real();
  public Real                 β       = new Real();

  final Variables<Real>       vars    = new Variables<Real>(α.setName("α"),
                                                            β.setName("β"));

  final RealContext           context = new RealContext(vars);

  final public static boolean verbose = false;

  final public RealFunction   A       = express("A",
                                                "(2*n + α + β + 1)*(2*n + α + β + 2) / 2*(n + 1)*(n + α + β + 1)",
                                                context,
                                                verbose);

  final public RealFunction   B       = express("B",
                                                "(α^2 - β^2)*(2*n + α + β + 1)) / (2*(n + 1)*(n + α + β + 1)*(2*n + α + β)",
                                                context,
                                                verbose);

  final public RealFunction   C       = express("C",
                                                "(n + α)*(n + β)*(2*n + α + β + 2)) / ((n + 1)*(n + α + β + 1)*(2*n + α + β)",
                                                context,
                                                verbose);

  final public RealFunction   d       = express("d", "2*n+α+β", context, verbose);

  final public RealFunction   c       = express("c", "(d(n)-1)/(d(n)*d(n-1))", context, verbose);

  final public RealFunction   a       = express("a", "c(n)*(α²+β²)", context, verbose);

  final public RealFunction   b       = express("b", "c(n)*d(n)", context, verbose);

  final public RealFunction   p1      = express("d(1)/2 + x*(α - β)", context, verbose);

  public JacobiPolynomialSequence(Real a, Real b)
  {
    this.α.set(a);
    this.β.set(b);
  }

  public Real computeCoefficients(int N)
  {
    if (N < 2)
    {
      throw new IllegalArgumentException("n should be >= 2");
    }

    Real         coefficients = Real.newVector(N + 2);

    // FIXME: implement integer variables along with the integer-constants in
    // https://github.com/crowlogic/arb4j/issues/222

    RealFunction p            = express("(2 * n + a + b) / (2 * n) * z * P[n-1] - (n + a + b - 1) / n * P[n-2]",
                                        context);

    try ( Real realn = new Real())
    {
      IntStream.range(2, N + 1).forEach(n ->
      {
        p.evaluate(realn.set(n), bits, coefficients.get(n));
      });
    }

    return coefficients;
  }

  @Override
  public Iterator<JacobiPolynomial> iterator()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    assert false : "return (1-x)^a(1+x)^b";
    return null;
  }

  public static Real domain = new Real("0+/-1",
                                       bits);

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
