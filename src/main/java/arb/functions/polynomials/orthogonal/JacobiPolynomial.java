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
 * Initial condition: P₁(x) = ½*(α + β + 2) + x*(α - β)
 * 
 * Recurrence relation: Pₙ(x) = aₙ*x*Pₙ₋₁(x) + bₙ*Pₙ₋₂(x)
 * 
 * Common factor: cₙ = (2ₙ + α + β - 1) / ((2ₙ + α + β)*(2ₙ - 2 + α + β))
 * 
 * coefficients: aₙ = cₙ (α² - β²)
 *  
 * coeffecients: bₙ = cₙ (2ₙ + α + β)
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
