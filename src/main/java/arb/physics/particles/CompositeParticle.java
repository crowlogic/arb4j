package arb.physics.particles;

import java.util.Collection;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CompositeParticle<X> extends
                                  Particle<X>
{
  public Collection<X> constituents();
}
