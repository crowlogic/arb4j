package arb.functions.polynomials.orthogonal;

import arb.*;
import arb.domains.*;
import arb.functions.complex.*;

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
