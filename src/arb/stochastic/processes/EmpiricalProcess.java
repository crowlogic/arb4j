package arb.stochastic.processes;

/**
 * An empirical process is a {@link StochasticProcess} that describes the
 * proportion of objects in a system in a given state. For a process in a
 * discrete state space a population continuous time Markov chain or Markov
 * population model is a process which counts the number of objects in a given
 * state (without rescaling). In mean field theory, limit theorems (as the
 * number of objects becomes large) are considered and generalize the central
 * limit theorem for empirical measures. Applications of the theory of empirical
 * processes arise in non-parametric statistics
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Empirical_process">Wikipedia</a>
 */
public interface EmpiricalProcess extends
                                  StochasticProcess
{

}
