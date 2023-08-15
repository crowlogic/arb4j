package arb.functions.polynomials.orthogonal;

import arb.OrthogonalBasis;
import arb.domains.Domain;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.RealFunction;

public interface OrthogonalPolynomialSequence<R extends RealFunction> extends
                                             Iterable<RealFunction>,
                                             OrthogonalBasis
{
  /**
   * The weighting function that this set of polynomials is orthogonal to
   * 
   * @return
   */
  public HolomorphicFunction getOrthogonalMeasure();

  /**
   * 
   * @return a Real whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getOrthogonalMeasure()}
   */
  public Domain getDomain();
}
