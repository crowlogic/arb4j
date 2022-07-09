package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.characteristicfunctions.*;
import arb.stochastic.densities.*;

/**
 * A Gaussian "white noise" process of specified mean and standard deviation
 * 
 *
 */
public class GaussianProcess implements
                             LévyProcess
{

  public GaussianProcess(Real μ, Real σ)
  {
    super();
    this.p = new GaussianProbabilityDensity(μ,
                                            σ);
    φ      = new GaussianCharacteristicFunction(μ,
                                                σ);
  }

  public GaussianProbabilityDensity     p;

  public GaussianCharacteristicFunction φ;

  @Override
  public ProbabilityDensity getProbabilityDensity()
  {
    return p;
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction()
  {
    return φ;
  }

}
