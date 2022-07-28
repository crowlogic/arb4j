package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.*;

/**
 * The {@link OrnsteinUhlenbeckProcess} is a stochastic process with
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
 * also be considered as the continuous-time analogu of the discrete-time
 * autoregressive process of order 1. process.
 * 
 * <a href=
 * "https://en.wikipedia.org/wiki/Ornstein%E2%80%93Uhlenbeck_process">Wikipedia</a>
 */
public class OrnsteinUhlenbeckProcess implements
                                      DiffusionProcess
{

  @Override
  public ProbabilityDensityFunction getDensityFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  @Override
  public ProbabilityDistributionFunction getDistributionFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  @Override
  public CharacteristicFunction getCharacteristicFunction(Real t)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  @Override
  public DriftCoeffecientFunction μ()
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

}
