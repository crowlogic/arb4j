package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;

import arb.*;
import arb.Float;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.*;

public class MultivariateDiffusionProcessIntegrator<S extends MultivariateDiffusionProcessState> implements
                                                   DiffusionProcessIntegrator<S, DiffusionProcess<S>>,
                                                   AutoCloseable
{
  static final int                                                                                        dim           = 2;

  public final DiffusionProcessIntegrator<DiffusionProcessState, DiffusionProcess<DiffusionProcessState>> integrators[] = new DiffusionProcessIntegrator[dim];

  S                                                                                                       state;

  Real                                                                                                    sqrtδt        = new Real();

  public MultivariateDiffusionProcessIntegrator(MultivariateDiffusionProcess process,
                                                S state,
                                                AbstractDiffusionProcessIntegrator<DiffusionProcessState, DiffusionProcess<DiffusionProcessState>> xIntegrator,
                                                AbstractDiffusionProcessIntegrator<DiffusionProcessState, DiffusionProcess<DiffusionProcessState>> yIntegrator)
  {
    integrators[0] = xIntegrator;
    integrators[1] = yIntegrator;
    process        = new MultivariateDiffusionProcess(xIntegrator.X,
                                                      yIntegrator.X);
    this.state     = state;
  }

  @Override
  public EvaluationSequence step(S state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(state.get(i), prec, evalSeq);
    }
    return evalSeq;
  }

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].jump(state.get(i), prec, evalSeq);
    }
    return evalSeq;
  }

  @Override
  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {

    RealPartition partition = interval.realPartition(n, prec);
    state.setδt(partition.dt).sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   Real.newVector(n + 1));

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 state.getδt(sqrtδt).sqrt(prec)),
                                             state.getRandomState(),
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      step(state, prec, evaluationSequence);
      jump(state, prec, evaluationSequence);
      System.out.println(state);
    }

    return evaluationSequence;
  }

  @Override
  public Float weakConvergenceOrder(int dim)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public Float strongConvergenceOrder(int dim)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public void close()
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].close();
    }
    sqrtδt.close();
  }

}
