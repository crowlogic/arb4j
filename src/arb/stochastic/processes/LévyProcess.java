package arb.stochastic.processes;

import arb.stochastic.*;

/**
 * A {@link LévyProcess}, named after Paul Lévy, is a stochastic process with
 * <b>independent, stationary increments</b>: it represents the motion of a
 * point whose <i>successive displacements are random</i>, in which
 * <u>displacements in pairwise disjoint time intervals are independent</u>, and
 * <b>displacements in different time intervals of the same length have
 * identical probability distributions</b>. A Lévy process may thus be viewed as
 * the continuous-time analog of a random walk.
 * 
 * The most well known examples of Lévy processes are the Wiener process, often
 * called the Brownian motion process, and the Poisson process. Further
 * important examples include the Gamma process, the Pascal process, and the
 * Meixner process. Aside from Brownian motion with drift, all other proper
 * (that is, not deterministic) Lévy processes have discontinuous paths. All
 * Lévy processes are additive processes
 * 

 */
public interface LévyProcess<P extends DensityFunction, F extends DistributionFunction, C extends CharacteristicFunction<P>>
                            extends
                            StochasticProcess<P, F, C>
{

}
