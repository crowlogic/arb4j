package arb.stochastic.processes;

import arb.Real;
import arb.RealConstants;
import arb.stochastic.*;

/**
 * A {@link BrownianBridge} is a continuous-time {@link StochasticProcess}
 * denoted by B(t) whose {@link ProbabilityDistributionFunction} is the conditional
 * (probability) distribution of a standard {@link WienerProcess} W(t) which is
 * synonymous with the mathematical model of {@link BrownianMotion}) subject to
 * the condition (when standardized) that W(T) = 0, so that the process is
 * pinned to the same value at both t = 0 and t = T. More precisely:<br>
 * 
 * B t := ( W(t) ∣ W(T) = 0 ) , t∈[0,T]
 * 
 * The expected value of the bridge is zero, with variance <b>t*(T−t)/T</b>
 * implying that the most uncertainty is in the middle of the bridge, with zero
 * uncertainty at the nodes. The covariance of B(s) and B(t) is
 * <b>min(s,t)−s*t/T</b> or <b>s(T − t)/T if s < t</b>. The increments in a
 * Brownian bridge are therefore not independent.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Brownian_bridge">Wikipedia</a><br>
 * 
 *      <a href="doc-files/BrownianExcursions.pdf">Probability laws related to
 *      the Jacobi theta and Riemann zeta functions, and Brownian
 *      excursions</a><br>
 *      and<br>
 *      <a href="doc-files/TheRiemannZetaFunctionAndProbabilityTheory.pdf">The
 *      Riemann zeta function and probability theory</a>
 */
public class BrownianBridge implements
                            StochasticProcess
{

  @Override
  public RealProbabilityDensityFunction getDensityFunction(Real t)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ProbabilityDistributionFunction getDistributionFunction(Real t)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction(Real t)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public int dim()
  {
    return 1;
    
  }


}
