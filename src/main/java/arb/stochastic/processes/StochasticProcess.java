package arb.stochastic.processes;

import arb.Real;
import arb.dynamical.systems.ContinuousTimeDynamicalSystem;
import arb.dynamical.systems.State;
import arb.stochastic.*;

/**
 * <pre>
 * A stochastic process is a mathematical concept used to describe a collection
 * of random variables indexed by time or another parameter, representing the
 * evolution of a system subject to random events or uncertainties. In a
 * stochastic process, the state of the system at any given time is not solely
 * determined by its previous state but also by some random element or noise,
 * making the future behavior of the system unpredictable to some extent.
 * 
 * Stochastic processes can be used to model a wide range of phenomena in
 * various fields, such as physics, engineering, finance, biology, and social
 * sciences. Some common examples of stochastic processes include stock prices,
 * the position of a randomly moving particle, or the growth of a population
 * subject to random births and deaths.
 * 
 * There are several types of stochastic processes, depending on the nature of
 * the variables involved and the way they evolve over time. Some key types
 * include:
 * 
 * Discrete-time and continuous-time processes: In a discrete-time stochastic
 * process, the random variables are indexed by discrete time steps (e.g., daily
 * stock prices). In a continuous-time process, the random variables are indexed
 * by a continuous time parameter (e.g., the position of a particle in Brownian
 * motion).
 * 
 * Discrete-state and continuous-state processes: In a discrete-state process,
 * the random variables can only take on a finite or countable set of values
 * (e.g., the number of customers in a queue). In a continuous-state process,
 * the random variables can take on any value in a continuous range (e.g., the
 * position of a randomly moving particle).
 * 
 * Markov processes: A Markov process is a special type of stochastic process in
 * which the future state of the system depends only on its current state and
 * not on its history. This property is called the Markov property or
 * memorylessness.
 * 
 * Independent and dependent processes: In an independent stochastic process,
 * the random variables are statistically independent, meaning that the value of
 * one variable does not influence the value of another variable. In a dependent
 * process, the random variables exhibit some degree of statistical dependence
 * or correlation.
 * 
 * Stochastic processes are analyzed using various mathematical tools and
 * techniques, including probability theory, statistical inference, and
 * stochastic calculus. The study of stochastic processes is crucial for
 * understanding and predicting the behavior of systems in the presence of
 * uncertainty, randomness, or noise.
 * </pre>
 */
public interface StochasticProcess<S extends State>
                                  extends
                                  ContinuousTimeDynamicalSystem<S>
{
  public ProbabilityDensityFunction getDensityFunction();

  public ProbabilityDistributionFunction getDistributionFunction();

  /**
   * 
   * @return the dimension of this process
   */
  public default int dim()
  {
    return 1;
  }

  public default CharacteristicFunction φ(Real timeToMaturity)
  {
    assert false : "todo";
    return null;
  }

}
