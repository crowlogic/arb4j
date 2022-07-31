package arb.stochastic.processes.integrators;

import static arb.FloatConstants.half;
import static arb.FloatConstants.one;
import static arb.RealConstants.*;

import arb.*;
import arb.Float;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

public class EulerIntegrator extends
                                       AbstractStochasticIntegrator implements
                                       StochasticIntegrator
{
  public EulerIntegrator(DiffusionProcess x)
  {
    super(x);
  }

  @Override
  public synchronized EvaluationSequence
         integrate(DiffusionProcessState state, FloatInterval interval, int n, RandomState randomState, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    Real x = Real.newVector(n + 1);

    interval.length(prec, T);

    Partition partition = interval.partition(n, prec);
    state.dt.set(partition.δt);

    GaussianProbabilityDistribution W                  = new GaussianProbabilityDistribution(zero,
                                                                                             partition.δt.sqrt(prec,
                                                                                                               sqrtδt));

    int                             i                  = -1;
    EvaluationSequence              evaluationSequence = new EvaluationSequence(partition,
                                                                                x);

    evaluationSequence.values.stream().parallel().forEach(value -> W.sample(prec, randomState, value));

    for (Float t : partition)
    {
      Real xi = x.get(++i);
      xi.printPrecision = true;
      state.setTime(t);

      μ.evaluate(state, 1, prec, μi).mul(partition.δt, prec);
      assert μi.isFinite();
      σ.evaluate(state, 1, prec, σi).mul(xi, prec);
      assert σi.isFinite();

      // coords.value = xi = previous(xi) + μi * δt + σi * Z where Z is a draw from
      // W=N(0,√(δt))
      state.setValue(μi.add(σi, prec, xi).add(state.value(), prec));

      if (verbose)
      {
        System.out.format("i=%s time=%s μi=%s σi=%s Z=%s xi=%s\n state=%s\n",
                          i,
                          state.getTime().toString(7),
                          μi,
                          σi,
                          Z,
                          xi,
                          state);
      }
    }

    return evaluationSequence;

  }

  @Override
  public Float weakConvergenceOrder()
  {
    return one;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    return half;
  }

}
