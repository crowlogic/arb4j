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

  public boolean          verbose = false;

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param S        upon entry it should be a Real vector of length n
   * @return the time delta this{@link #dt} between points of S
   */
  @Override
  public EvaluationSequence integrate(FloatInterval interval, int prec, int n, DiffusionProcessState state)
  {
    DriftCoeffecientFunction     μ     = X.μ();
    DiffusionCoeffecientFunction σ     = X.σ();
    Real                         x     = Real.newVector(n + 1);

    Float                        start = interval.getA();
    try ( Float T = interval.length(prec, new Float()); Real Z = new Real(); Real μi = new Real();
          Real σi = new Real(); Real sqrtδt = new Real();)
    {
      Partition partition = interval.partition(n, prec);
      μi.printPrecision = true;
      σi.printPrecision = true;
      GaussianProcess W = new GaussianProcess(zero,
                                              partition.δt);

      int             i = -1;
      for (Float t : partition)
      {
        Real xi = x.get(++i);
        xi.printPrecision = true;
        state.setTime(t);

        μ.evaluate(state, 1, prec, μi);
        σ.evaluate(state, 1, prec, σi);
        W.sample(prec, randomState, Z);

        // coords.value = xi = μi * δt + σi * Z where Z is a draw from W=N(0,√(δt))
        μi.mul(partition.δt, prec, μi).add(σi.mul(Z, prec, σi), prec, xi);
        state.setValue(xi);

        if (verbose)
        {
          System.out.format("i=%d μi=%s σi=%s Z=%s xi=%s\n", i, μi, σi, Z, xi);
        }
      }

      return new EvaluationSequence(partition,
                                    x);
    }
  }
}
