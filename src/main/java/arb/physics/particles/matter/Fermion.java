package arb.physics.particles.matter;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.physics.BinaryOccupationBasis;
import arb.physics.particles.Particle;
import arb.physics.particles.forces.Boson;
import arb.space.topological.Space;

/**
 * {@link Particle}s that occupy {@link Space} and therefore obey the Pauli
 * exclusion principle which is that only one particle can occupy a point of
 * space at a time. This is contratry to that of the other possible types of
 * particles known as {@link Boson}s which are particles that mediate the
 * transfer of forces and therefore are known as force-carrying particles
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Fermion extends
                         Particle<BinaryOccupationBasis>
{

}
