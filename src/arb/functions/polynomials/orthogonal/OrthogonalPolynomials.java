package arb.functions.polynomials.orthogonal;

import arb.*;
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
  public HolomorphicFunction getMassDistribution();

  /**
   * 
   * @return a Real whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getMassDistribution()}
   */
  public Real getDomain();
}
