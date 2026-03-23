package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.measure.Measure;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public interface OrthogonalBasis<X, E> extends
                                Iterable<E>,
                                Basis<X, E>

{

  /**
   * 
   * @return the {@link Measure} to which the elements of this
   *         {@link OrthogonalBasis} are mutually orthogonal with respect to
   */
  default RealFunction orthogonalityMeasure()
  {
    return (domain, order, bits, coDomain) -> RealConstants.one;
  }

  Domain<? extends X> domainOfOrthogonality();

}
