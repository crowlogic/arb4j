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
 * which means that it is a {@link GaussianProcess}, a {@link MarkovProcess#},
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
 * The stochastic differential equation it satisifies is
 * 
 * <pre>
 *   dXₜ = θ*(μ-Xₜ)dt+σdWₜ
 * </pre>
 * 
 * where the parameters are this{@link #θ}, this{@link #μ}, and this{@link #σ}
 *  /**
   * Test 
 * <a href=
 * "https://en.wikipedia.org/wiki/Ornstein%E2%80%93Uhlenbeck_process">Wikipedia</a>
 */
public class OrnsteinUhlenbeckProcess implements
                                      DiffusionProcess,
                                      AutoCloseable,
                                      Cleanable
{
  @Override
  public String toString()
  {
    return String.format("OrnsteinUhlenbeckProcess[mean μ=%s, μ-reversion rate θ=%s, stdev σ=%s]", μ, θ, σ);
  }

  /**
   * mean-reversion rate
   */
  public Real θ = new Real();

  /**
   * ergodic long-term asymptotic limiting mean around which the values of the
   * process vary
   */
  public Real μ = new Real();

  /**
   * standard deviation, the square root of the variance of this process
   */
  public Real σ = new Real();

  public OrnsteinUhlenbeckProcess(Real θ, Real μ, Real σ)
  {
    super();
    this.θ = θ;
    this.μ = μ;
    this.σ = σ;
  }

  /**
   * @return θ*(μ-Xₜ)
   */
  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (state, order, prec, result) ->
    {
      assert order <= 2;
      return θ.mul(μ.sub(state.value, prec, result), prec, result);
    };
  }

  /**
   * @return σ
   */
  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, prec, result) ->
    {
      assert order <= 2;
      return result.set(σ);
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
    θ.close();
    μ.close();
    σ.close();
  }

}
