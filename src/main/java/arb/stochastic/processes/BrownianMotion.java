package arb.stochastic.processes;

import static arb.RealConstants.zero;

import java.lang.ref.Cleaner.Cleanable;

import arb.Real;
import arb.stochastic.CharacteristicFunction;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.RealProbabilityDensityFunction;

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
public class BrownianMotion implements
                            GaussianProcess,
                            AutoCloseable,
                            Cleanable
{

  Real σ;

  public BrownianMotion(Real σ)
  {
    this.σ = σ;
  }

  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (state, order, precision, result) ->
    {
      assert order <= 2;
      if (order >= 2)
      {
        // the derivative of the constant 0 is zero
        result.get(1).zero();
      }
      return result.set(zero);
    };
  }

  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, precision, result) ->
    {
      assert order <= 2;
      Real sqrtdt = state.sqrtdt(precision, result.get(0));
      assert sqrtdt.isFinite() : "√dt=" + sqrtdt;
      sqrtdt.mul(σ, precision, result);
      if (order >= 2)
      {
        // the derivative of the constant σ is zero
        result.get(1).zero();
      }
      return result;
    };
  }

  @Override
  public void clean()
  {
    close();

  }

  @Override
  public void close()
  {
    σ.close();
  }

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
  @Override
  public CharacteristicFunction φ(Real timeToMaturity)
  {
    assert false : "todo";
    return null;
  }

  @Override
  public RealProbabilityDensityFunction getDensityFunction()
  {
    assert false : "todo";
    return null;
  }

  @Override
  public ProbabilityDistributionFunction getDistributionFunction()
  {
    assert false : "todo";
    return null;
  }

}
