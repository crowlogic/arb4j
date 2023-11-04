package arb.functions.polynomials.orthogonal;

import arb.RealPolynomial;

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
 * coeffecients: bₙ = cₙ (2ₙ + α + β)
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
public class JacobiPolynomial extends
                              RealPolynomial
{

  public JacobiPolynomial(JacobiPolynomials sequence, int n)
  {
    this.sequence = sequence;
    this.n        = n;
  }

  final JacobiPolynomials sequence;

  final int               n;

}
