package arb.dynamical.systems;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * An orbit is a collection of points related by the evolution function of the
 * {@link DynamicalSystem}. It can be understood as the subset of
 * {@link PhaseSpace} covered by the trajectory of the dynamical system under a
 * particular set of initial conditions, as the system evolves. <br>
 * 
 * As phase space trajectory is uniquely determined for any given set of phase
 * space coordinates, it is not possible for different orbits to intersect in
 * phase space, therefore the set of all orbits of a dynamical system is a
 * partition of the phase space. <br>
 * 
 * Understanding the properties of orbits by using topological methods is one of
 * the objectives of the modern theory of dynamical systems.
 * 
 * For discrete-time dynamical systems, the orbits are sequences; for real
 * dynamical systems, the orbits are {@link Curve}s; and for holomorphic
 * dynamical systems, the orbits are {@link RiemannSurface}.<br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Orbit<X extends Field<? extends X>, DS extends DynamicalSystem<X>> extends
                      PhaseSpace<DS>
{

}
