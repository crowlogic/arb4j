package arb.stochastic.processes.integrators;

import static arb.FloatConstants.half;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import arb.FloatConstants;
import arb.FloatInterval;
import arb.Real;
import arb.RealPartition;
import arb.stochastic.GaussianDistribution;
import arb.stochastic.processes.DiffusionCoeffecientFunction;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.DriftCoeffecientFunction;
import arb.stochastic.processes.EvaluationSequence;
import arb.Float;

/**
 * Integrates a {@link DiffusionProcess} via Euler's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ,t)dt + σ(Xₜ,t)dBₜ
 * </pre>
 * 
 * where Bₜ is a BrownianMotion also-known-as a WienerProcess having zero mean
 * drift and standard deviation parameter σ=√(dt) such that the variance is dt,
 * the time elapsed
 */
public class EulerIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                            AbstractDiffusionProcessIntegrator<D, P>
{

  private int dim;

  public EulerIntegrator(P x, D diffusionProcessState)
  {
    super(x);
    state    = diffusionProcessState;
    μ        = diffusionProcess.μ();
    σ        = diffusionProcess.σ();
    this.dim = 0;
  }

  /**
   * 
   * @param x
   * @param diffusionProcessState
   * @param dim                   the dimension index of this process in the
   *                              {@link MultivariateDiffusionProcessIntegrator}
   */
  public EulerIntegrator(P x, D diffusionProcessState, int dim)
  {
    super(x);
    state    = diffusionProcessState;
    μ        = diffusionProcess.μ();
    σ        = diffusionProcess.σ();
    this.dim = dim;
  }

  DriftCoeffecientFunction<D>     μ;
  DiffusionCoeffecientFunction<D> σ;

  @Override
  public synchronized EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    interval.length(prec, T);

    RealPartition partition = interval.realPartition(n, prec);
    state.setdt(partition.dt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   1);

    evaluationSequence.generateRandomSamples(new GaussianDistribution(zero,
                                                                      state.sqrtdt(prec, sqrtdt)),
                                             null,
                                             state.getRandomState(),
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      state.lock();
      step(state, prec, evaluationSequence);
      state.unlock();
      assert jump((DiffusionProcessState) state,
                  prec,
                  evaluationSequence) : "invalid jump, please try again with another sample";
    }

    return evaluationSequence;
  }

  @Override
  public boolean step(D state, int prec, EvaluationSequence evaluationSequence)
  {
    return step(state, prec, evaluationSequence, 1);
  }

  /**
   * 
   * @param state
   * @param prec
   * @param evaluationSequence
   * @param σorder             the order to pass to the
   *                           {@link DiffusionCoeffecientFunction}, the
   *                           {@link MilsteinIntegrator} calls this with 2, but
   *                           the EulerIntegrator only needs 1
   * @return
   */
  protected boolean step(D state, int prec, EvaluationSequence evaluationSequence, int σorder)
  {
    int  i  = state.index();
    Real xi = evaluationSequence.dimensions[dim].get(i);
    xi.printPrecision = true;

    diffusionProcess.μ().evaluate(state, 1, prec, μi);
    assert μi.isFinite();
    μi.mul(state.dt(), prec);


    assert σorder > 0;
    String stateBefore = state.toString();
    diffusionProcess.σ().evaluate(state, σorder, prec, σi);

    assert !σi.isNegative() && σi.isFinite() : "X.σ is not finite and nonnegative. σi=" + σi + " state=" + state
                  + " stateBefore=" + stateBefore;

    if (verbose)
    {
      println("i=" + "\n xi=" + xi + "\n μi=" + μi + "\n σi=" + σi);
    }
    σi.mul(xi, prec);

    if (σorder == 1)
    {
      μi.add(σi, prec, xi);
    }

    return true; // return false if variance went negative
  }

  public boolean nonNegative = false;

  @Override
  public final boolean jump(DiffusionProcessState state, int prec, EvaluationSequence evaluationSequence)
  {
    int i = state.index();
    assert i >= 0;
    Real ξ = evaluationSequence.dimensions[dim].get(i);

    ξ.add(state.value(), prec);
    if (nonNegative && ξ.isNegative())
    {
      System.err.println("calculated variance = " + ξ + " cannot be negative");
      return false;
    }
    else
    {
      state.nextIndex();
      state.setValue(ξ);

      if (verbose)
      {
        System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n", i, state.time(), μi, σi, ξ, state);
      }

      return true;
    }
  }

  @Override
  public Float weakConvergenceOrder(int dim)
  {
    return FloatConstants.one;
  }

  @Override
  public Float strongConvergenceOrder(int dim)
  {
    return half;
  }

}
