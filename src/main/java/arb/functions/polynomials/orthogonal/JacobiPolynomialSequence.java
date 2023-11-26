package arb.functions.polynomials.orthogonal;

import java.util.*;
import java.util.stream.IntStream;

import arb.*;
import arb.domains.Domain;
import arb.expressions.*;
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
 * Initial condition: P₁(x) = ½*(α + β + 2) + x*(α - β)
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
                                      OrthogonalBasis<Real, JacobiPolynomial>
{
  public static int     bits    = 128;
  public Real           α       = new Real();
  public Real           β       = new Real();

  final Variables<Real> vars    = new Variables<Real>(α.setName("α"),
                                                      β.setName("β"));

  final RealContext     context = new RealContext(vars);

  final RealFunction    d       = Expression.express("d", "2*n+α+β", context);

  final RealFunction    p1      = Expression.express("d(1)/2 + x*(α - β)", context, true);

  public JacobiPolynomialSequence(Real a, Real b)
  {
    this.α = a;
    this.β = b;
  }

  public List<Real> computeCoefficients(int n)
  {
    if (n < 2)
    {
      throw new IllegalArgumentException("n should be >= 2");
    }

    List<Real> coefficients = new ArrayList<>();
    coefficients.add(RealConstants.one); // P_0^(alpha, beta)(z) coefficient
    coefficients.add(RealConstants.zero); // P_1^(alpha, beta)(z) coefficient

    Variables<Real> vars = new Variables<>();
    vars.put("a", α);
    vars.put("b", β);
    Real realn = new Real();
    vars.put("n", realn);
    RealContext  context       = new RealContext(vars);

    String       expressionStr = "(2 * n + a + b) / (2 * n) * z * P(n-1, a, b, z) - (n + a + b - 1) / n * P(n-2, a, b, z)";
    RealFunction expression    = Expression.express(expressionStr, context);

    try ( Real z = new Real())
    {
      IntStream.range(2, n + 1).forEach(i ->
      {
        realn.set(i);
        Real coefficient = expression.evaluate(realn, bits, z);
        coefficients.add(coefficient);
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

  @Override
  public Domain<Real> getDomain()
  {
    assert false : "TODO";
    return null;
  }

}
