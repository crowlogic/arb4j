package arb.stochastic.processes;

import static arb.RealConstants.*;

import arb.*;
import arb.Float;

public class StochasticEulerIntegrator implements
                                       StochasticIntegrator
{
  private RandomState randomState;

  public StochasticEulerIntegrator(DiffusionProcess x, RandomState randomState)
  {
    X                = x;
    this.randomState = randomState;
  }

  public DiffusionProcess X;

  public Real             dt;

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param S        upon entry it should be a Real vector of length n
   * @return the time delta this{@link #dt} between points of S
   */
  @Override
  public Partition integrate(FloatInterval interval, int prec, int n, DiffusionProcessCoordinates coords)
  {
    DriftCoeffecientFunction     μ     = X.μ();
    DiffusionCoeffecientFunction σ     = X.σ();

    Float                        start = interval.getA();
    try ( Float T = interval.length(prec, new Float()); Real μi = new Real(); Real σi = new Real();)
    {
      Partition       partition = interval.partition(n, prec);
      GaussianProcess W         = new GaussianProcess(zero,
                                                      partition.δt);

      int             i         = 0;
      for (Float t : partition)
      {
        coords.setTime(t);
        μ.evaluate(coords, 1, prec, μi);
        σ.evaluate(coords, 1, prec, σi);

        // W.sample(prec, randomState, Xi, X);
      }

      return partition;
    }
  }
}
