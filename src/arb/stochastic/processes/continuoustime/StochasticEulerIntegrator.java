package arb.stochastic.processes.continuoustime;

import static arb.RealConstants.zero;

import java.lang.ref.Cleaner.Cleanable;

import arb.*;
import arb.Float;
import arb.stochastic.GaussianProbabilityDistribution;

public class StochasticEulerIntegrator extends
                                       AbstractStochasticIntegrator implements
                                       StochasticIntegrator,
                                       AutoCloseable,
                                       Cleanable
{
  public StochasticEulerIntegrator(DiffusionProcess x, RandomState randomState)
  {
    super();
    X                = x;
    this.randomState = randomState;
  }

  Float T      = new Float();
  Real  Z      = new Real();
  Real  μi     = new Real();
  Real  σi     = new Real();
  Real  sqrtδt = new Real();

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

    interval.length(prec, T);

    Partition partition = interval.partition(n, prec);
    state.dt.set(partition.δt);
    μi.printPrecision = true;
    σi.printPrecision = true;
    GaussianProbabilityDistribution W = new GaussianProbabilityDistribution(zero,
                                                                            partition.δt.sqrt(prec, sqrtδt));

    int                             i = -1;
    for (Float t : partition)
    {
      Real xi = x.get(++i);
      xi.printPrecision = true;
      state.setTime(t);

      μ.evaluate(state, 1, prec, μi).mul(partition.δt, prec);
      assert μi.isFinite();
      σ.evaluate(state, 1, prec, σi).mul(W.sample(prec, randomState, Z), prec);
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

    return new EvaluationSequence(partition,
                                  x);

  }

  @Override
  public void evolve()
  {

  }

  @Override
  public void clean()
  {
    close();
  }

  @Override
  public void close()
  {
    T.close();
    Z.close();
    μi.close();
    σi.close();
    sqrtδt.close();
  }
}
