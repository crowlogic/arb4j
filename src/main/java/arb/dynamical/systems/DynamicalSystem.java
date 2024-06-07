package arb.dynamical.systems;

import arb.Field;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.CharacteristicFunction;

/**
 * <pre>
 * A dynamical system is a mathematical concept used to describe the
 * time-dependent behavior of a system governed by a set of rules or equations.
 * It is a fundamental concept in many areas of science, including physics,
 * engineering, economics, biology, and other disciplines that involve the study
 * of systems evolving over time.
 * 
 * A dynamical system typically consists of:
 * 
 * A state space: This is the set of all possible states that the system can be
 * in. The state space can be finite or infinite, discrete or continuous, and
 * may be represented by variables or coordinates.
 * 
 * A state: A specific point in the state space that represents the current
 * condition of the system. The state can be described by a set of variables or
 * coordinates, and it fully captures the relevant information about the system
 * at a given time.
 * 
 * A rule or a set of equations: These are the mathematical relationships that
 * dictate how the state of the system changes over time. The equations can be
 * deterministic, meaning that they have a unique solution for each initial
 * state, or stochastic, meaning that the future state is determined by a
 * probability distribution.
 * 
 * Time: Time can be either continuous or discrete, and it serves as the
 * independent variable that drives the evolution of the system.
 * 
 * The behavior of a dynamical system is studied by analyzing its trajectories
 * or orbits, which are the sequences of states that the system passes through
 * over time. These trajectories can exhibit a wide range of behaviors, from
 * simple, predictable patterns like periodic oscillations to more complex,
 * chaotic behavior.
 * 
 * Dynamical systems theory provides a powerful framework for understanding and
 * predicting the behavior of systems in various fields, and it has applications
 * in areas such as control theory, optimization, statistical mechanics, and the
 * study of chaos and nonlinear dynamics.
 * </pre>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface DynamicalSystem<X extends Field<? extends X>>
{

  /**
   * <pre>
   * The characteristic function for a Gaussian (or normal) distribution with mean
   * μ and variance σ² is given by:
   * 
   * Φ(t) = e^(itμ - (σ²t²)/2)
   * 
   * where t is the argument of the characteristic function, i is the imaginary
   * unit (i.e., the square root of -1), and exp(x) denotes the exponential
   * function e^x. The characteristic function is a useful tool in probability
   * theory and statistics for analyzing the properties of a distribution, and it
   * is closely related to the Fourier transform of the probability density
   * function.
   * </pre>
   */
  CharacteristicFunction φ(Real timeToMaturity);

}
