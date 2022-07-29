package arb.stochastic.processes;

import static arb.RealConstants.zero;

import arb.*;
import arb.Float;

public class StochasticEulerIntegrator extends
                                       AbstractStochasticIntegrator implements
                                       StochasticIntegrator
{
  public StochasticEulerIntegrator(DiffusionProcess x, RandomState randomState)
  {
    super();
    X                = x;
    this.randomState = randomState;
  }

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
    DriftCoeffecientFunction     μ = X.μ();
    DiffusionCoeffecientFunction σ = X.σ();
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    Real                         x = Real.newVector(n + 1);

    try ( Float T = interval.length(prec, new Float()); Real Z = new Real(); Real μi = new Real();
          Real σi = new Real();)
    {
      Partition partition = interval.partition(n, prec);
      μi.printPrecision = true;
      σi.printPrecision = true;
      WienerProcess W = new WienerProcess(partition.δt);

      int           i = -1;
      for (Float t : partition)
      {
        Real xi = x.get(++i);
        xi.printPrecision = true;
        state.setTime(t);

        μ.evaluate(state, 1, prec, μi);
        σ.evaluate(state, 1, prec, σi);
        W.sample(state.dt(), prec, randomState, Z);

        // coords.value = xi = previous(xi) + μi * δt + σi * Z where Z is a draw from
        // W=N(0,√(δt))
        μi.mul(partition.δt, prec, μi);
        σi.mul(Z, prec, σi);
        state.setValue(μi.add(σi, prec, xi).add(state.value(), prec));

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
