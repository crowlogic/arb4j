package arb.stochastic.processes.continuoustime;

import static arb.RealConstants.*;

import arb.Real;
import arb.stochastic.*;

/**
 * 
 * 
 * The Wiener process W(t) is an integrated {@link WhiteNoise} characterized by
 * the following properties:<br>
 * 
 * 1. W(0) = 0<br>
 * 
 * 2. W has independent increments: for every t > 0 the future increments
 * W(t+u)-W(t)∀u≥0 are <b>independent</b> of the past values {W(s):s≤t}<br>
 * 
 * 3. W has Gaussian increments: W(t+u)−W(t) is normally distributed with mean 0
 * and variance u, standard deviation σ=√u, with W(t+u)−W(t)∼N(0,u)<br>
 * 
 * 4. W has continuous paths: W(t) is continuous in t<br>
 * 
 * <br>
 * An alternative characterisation of the Wiener process is the so-called
 * <b>Lévy characterisation</b> that says that the Wiener process is an almost
 * surely continuous martingale with W(0) = 0 and quadratic variation [W(t),
 * W(t)] = t (which means that W(t)² − t is also a martingale).
 *
 * @author Norbert Wiener
 * 
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Wiener_process">Wikipedia</a>
 */
public class WienerProcess implements
                           GaussianProcess<GaussianDensityFunction, GaussianProbabilityDistribution, GaussianCharacteristicFunction>
{

  private Real σ;

  public WienerProcess(Real σ)
  {
    this.σ = σ;
  }

  @Override
  public GaussianDensityFunction getDensityFunction(Real t)
  {
    assert false : "2do";
    return null;
  }

  @Override
  public GaussianCharacteristicFunction getCharacteristicFunction(Real t)
  {
    assert false : "2do";
    return null;
  }

  @Override
  public GaussianProbabilityDistribution getDistributionFunction(Real t)
  {
    assert false : "TODO: implement";
    return null;
  }

  @Override
  public DriftCoeffecientFunction μ()
  {
    return (state, order, precision, result) ->
    {
      return result.set(zero);
    };
  }

  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return (state, order, precision, result) ->
    {
      Real dt = state.dt();
      assert dt.isFinite() : "dt=" + dt;
      return dt.sqrt(precision, result).mul(σ, precision);
    };
  }

}
