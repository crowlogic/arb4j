package arb.functions.polynomials.orthogonal;

import arb.ComplexPolynomial;
import arb.OrthogonalBasis;
import arb.domains.Domain;
import arb.functions.complex.HolomorphicFunction;

public interface OrthogonalPolynomials extends
                                       Iterable<ComplexPolynomial>,
                                       OrthogonalBasis
{
  /**
   * The weighting function that this set of polynomials is orthogonal to
   * 
   * @return
   */
  public HolomorphicFunction getDistribution();

  /**
   * 
   * @return a Real whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getDistribution()}
   */
  public Domain getDomain();
}
