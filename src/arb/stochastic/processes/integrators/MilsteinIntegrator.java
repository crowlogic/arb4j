package arb.stochastic.processes.integrators;

import static arb.FloatConstants.one;

import arb.*;
import arb.Float;
import arb.stochastic.StandardGaussianDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

/**
 * Integrates a {@link DiffusionProcess} via Milstein's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ)*dt + σ(Xₜ)*dBₜ + ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2
 * </pre>
 * 
 * where σ(Xₜ)∂Xₜ is the derivative of σ relative to X, not t; and Bₜ is a
 * BrownianMotion also-known-as a WienerProcess having zero mean drift and
 * standard deviation parameter σ=√(dt) such that the variance is dt, the time
 * elapsed. This method is only applicable to processes whose drift and
 * diffusions do not *directly* depend on t. TODO: find a way to assert this, at
 * compile-time preferably. <br>
 * <br>
 * 
 * The key to the Milstein scheme is that the accuracy of the discretization is
 * increased by considering expansions of the coefficients μₜ=μ(Sₜ) and σₜ=σ(Sₜ)
 * via Itō’s lemma.
 */
public class MilsteinIntegrator extends
                                EulerIntegrator
{

  public MilsteinIntegrator(DiffusionProcess x)
  {
    super(x);
  }

  @Override
  public EvaluationSequence integrate(DiffusionProcessState state, FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    Real x = Real.newVector(n + 1);

    interval.length(prec, T);

    Partition partition = interval.partition(n, prec);
    state.dt.set(partition.δt);
    partition.δt.sqrt(prec, sqrtδt);

    StandardGaussianDistribution W                  = new StandardGaussianDistribution();

    int                          i                  = -1;
    EvaluationSequence           evaluationSequence = new EvaluationSequence(partition,
                                                                             x);

    evaluationSequence.generateRandomSamples(W, state.randomState, prec);

    try ( Real σσi = new Real();)
    {
      for (Float t : partition)
      {
        state.setTime(t);
        Real xi = x.get(++i); // xi is the i-th sample from a standard normal distribution
        xi.printPrecision = true;

        μ.evaluate(state, 1, prec, μi).mul(partition.δt, prec);
        assert μi.isFinite();
        σ.evaluate(state, 2, prec, σi).mul(xi, prec).mul(sqrtδt, prec);

        σi.mul(σi.get(1), prec, σσi).mul(partition.δt, prec).div(2, prec).mul(xi.pow(2, prec).sub(1, prec), prec);

        // TODO: add second order correction.. the derivative is in σi.get(1) .. the 2nd
        // order to be added is ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2 where
        // σ(Xₜ)∂Xₜ is the derivative of σ with relative to X, which is a function of t,
        // but this method will not work if either coefficient function depends directly
        // on t
        assert σi.isFinite();

        // xi = xi + μi * δt + σi * Z + ( dt * δσi * σi ) * ( (Zₜ)² - 1 ) / 2
        // where Z is a drawn from a standard Gaussian N(0,1) and xi is the value of Xₜ
        // at the i-th element of the partition of the interval of integration
        state.setValue(μi.add(σi, prec, xi).add(σσi, prec).add(state.value(), prec));

        if (verbose)
        {
          System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n",
                            i,
                            state.getTime().toString(7),
                            μi,
                            σi,
                            xi,
                            state);
        }
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
    return one;
  }

}
