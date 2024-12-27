package arb.theorems;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.physics.particles.forces.Boson;
import arb.physics.particles.matter.Fermion;

/**
 * The spin–statistics theorem proves that the observed relationship between the
 * intrinsic spin of a particle (angular momentum not due to the orbital motion)
 * and the quantum particle statistics of collections of such particles is a
 * consequence of the mathematics of quantum mechanics. In units of the reduced
 * Planck constant ħ, all particles that move in 3 dimensions have either
 * integer spin and obey Bose-Einstein statistics or half-integer spin and obey
 * Fermi-Dirac statistics.[1][2] Spin-statistics connection
 * 
 * All known particles obey either Fermi-Dirac statistics or Bose-Einstein
 * statistics. A particle's intrinsic spin always predicts the statistics of a
 * collection of such particles and vice versa:[3]
 * 
 * Integral spin particles are bosons with Bose-Einstein statistics
 * Half-integral spin particle are fermions with Fermi-Dirac statistics.
 * 
 * A spin-statistics theorem shows that the mathematical logic of quantum
 * mechanics predicts or explains this physical result.[4]
 * 
 * The statistics of indistinguishable particles is among the most fundamental
 * of physical effects. The Pauli exclusion principle -- that every occupied
 * quantum state contains at most one fermion -- controls the formation of
 * matter. The basic building blocks of matter such as protons, neutrons, and
 * electrons are all fermions. Conversely, particles such as the photon, which
 * mediate forces between matter particles, are all bosons.[citation needed] A
 * spin-statistics theorem attempts explain the origin of this fundamental
 * dichotomy.[5]: 4
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(Fermion.class)
@AppliesTo(Boson.class)
public interface SpinStatisticsTheorem extends
                                       RegularTheorem
{

}
