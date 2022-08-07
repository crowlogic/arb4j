package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;

import arb.Real;
import arb.stochastic.*;

/**
 * The {@link OrnsteinUhlenbeckProcess} is a {@link StochasticProcess} with
 * applications in financial mathematics and the physical sciences. Its original
 * application in physics was as a model for the velocity of a massive Brownian
 * particle under the influence of friction. It is named after Leonard Ornstein
 * and George Eugene Uhlenbeck.
 * 
 * The Ornstein–Uhlenbeck process is a stationary {@link GaussMarkovProcess},
 * which means that it is a {@link GaussianProcess}, a {@link MarkovProcess},
 * and is temporally homogeneous. In fact, it is the <b>only</b> nontrivial
 * process that satisfies these three conditions, up to allowing linear
 * transformations of the space and time variables. Over time, the process tends
 * to drift towards its mean function: such a process is called mean-reverting.
 * 
 * The process can be considered to be a modification of the random walk in
 * continuous time, or {@link WienerProcess}, in which the properties of the
 * process have been changed so that there is a tendency of the walk to move
 * back towards a central location, with a greater attraction when the process
 * is further away from the center. The {@link OrnsteinUhlenbeckProcess} can
 * also be considered as the continuous-time analog of the discrete-time
 * autoregressive process of order 1. process.
 * 
 * The stochastic differential equation it satisfies is
 * 
 * <pre>
 * dXₜ = λ * (θ - Xₜ) * dt + σ * dWₜ
 * </pre>
 * 
 * where the parameters are this{@link #λ}, this{@link #θ}, and this{@link #σ}
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Ornstein%E2%80%93Uhlenbeck_process">Wikipedia</a>
 */
public class OrnsteinUhlenbeckProcess implements
                                      DiffusionProcess<DiffusionProcessState>,
                                      MarkovProcess,
                                      StationaryProcess,
                                      AutoCloseable,
                                      Cleanable
{
  @Override
  public RealProbabilityDensityFunction getTransitionProbabilityDensity()
  {
    assert false : "TODO: implement and return {\\displaystyle P(x,t\\mid x',t')={\\sqrt {\\frac {\\theta }{2\\pi D(1-e^{-2\\theta (t-t')})}}}\\exp \\left[-{\\frac {\\theta }{2D}}{\\frac {(x-x'e^{-\\theta (t-t')})^{2}}{1-e^{-2\\theta (t-t')}}}\\right]}";
    return null;
  }

  @Override
  public String toString()
  {
    return String.format("OrnsteinUhlenbeckProcess[ergodic mean θ=%s, mean-reversion rate λ=%s, stdev σ=%s]",
                         θ,
                         λ,
                         σ);
  }

  /**
   * mean-reversion rate
   */
  public Real λ = new Real();

  /**
   * ergodic long-term asymptotic limiting mean around which the values of the
   * process vary
   */
  public Real θ = new Real();

  /**
   * standard deviation, the square root of the variance of this process
   */
  public Real σ = new Real();

  /**
   * 
   * @param λ mean-reversion rate
   * @param θ ergodic mean
   * @param σ standard deviation, square root of variance
   */
  public OrnsteinUhlenbeckProcess(Real λ, Real θ, Real σ)
  {
    super();
    this.λ = λ;
    this.θ = θ;
    this.σ = σ;
  }

  /**
   * @return [λ*(θ-Xₜ) , -λ ]
   */
  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (state, order, prec, result) ->
    {
      assert order <= 2;
      λ.mul(θ.sub(state.value, prec, result), prec, result);
      if (order >= 2)
      {
        result.get(1).set(λ).neg();
      }
      return result;
    };
  }

  /**
   * @return [σ, 0]
   */
  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, prec, result) ->
    {
      assert order <= 2;
      result.set(σ);
      if (order >= 2)
      {
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
    λ.close();
    θ.close();
    σ.close();
  }

}
