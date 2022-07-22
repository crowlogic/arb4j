package arb.dynamical.systems;

/**
 * A dynamical system is a system in which a function describes the time
 * dependence of a point in an ambient space. Examples include the mathematical
 * models that describe the swinging of a clock pendulum, the flow of water in a
 * pipe, the random motion of particles in the air, and the number of fish each
 * springtime in a lake. The most general definition unifies several concepts in
 * mathematics such as ordinary differential equations and ergodic theory by
 * allowing different choices of the space and how time is measured. Time can be
 * measured by integers, by real or complex numbers or can be a more general
 * algebraic object, losing the memory of its physical origin, and the space may
 * be a manifold or simply a set, without the need of a smooth space-time
 * structure defined on it.
 * 
 * At any given time, a dynamical system has a state representing a point in an
 * appropriate state space. This state is often given by a tuple of real numbers
 * or by a vector in a geometrical manifold. The evolution rule of the dynamical
 * system is a function that describes what future states follow from the
 * current state. Often the function is deterministic, that is, for a given time
 * interval only one future state follows from the current state.[1][2] However,
 * some systems are stochastic, in that random events also affect the evolution
 * of the state variables.
 * 
 * In physics, a dynamical system is described as a "particle or ensemble of
 * particles whose state varies over time and thus obeys differential equations
 * involving time derivatives".[3] In order to make a prediction about the
 * system's future behavior, an analytical solution of such equations or their
 * integration over time through computer simulation is realized.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Dynamical_system">Dynamical
 *      Systemn</a>
 */
public interface DynamicalSystem
{

}
