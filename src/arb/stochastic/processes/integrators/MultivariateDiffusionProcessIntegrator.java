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
  static final int                                                dim           = 2;

  public final DiffusionProcessIntegrator<S, DiffusionProcess<S>> integrators[] = new DiffusionProcessIntegrator[dim];

  S                                                               state;

  Real                                                            sqrtδt        = new Real();

  private MultivariateDiffusionProcess                            process;

  public MultivariateDiffusionProcessIntegrator(MultivariateDiffusionProcess process,
                                                S state,
                                                DiffusionProcessIntegrator<S, DiffusionProcess<S>> xIntegrator,
                                                DiffusionProcessIntegrator<S, DiffusionProcess<S>> yIntegrator)
  {
    integrators[0] = xIntegrator;
    integrators[1] = yIntegrator;
    this.process   = process;
    this.state     = state;
  }

  @Override
  public EvaluationSequence step(S state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(state, prec, evalSeq);
    }
    return evalSeq;
  }

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].jump(state, prec, evalSeq);
    }
    return evalSeq;
  }

  @Override
  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {

    RealPartition partition = interval.realPartition(n, prec);
    state.setdt(partition.dt).sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   Real.newVector(n + 1));

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 state.getdt(sqrtδt).sqrt(prec)),
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
