package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.RealPartition;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.MultivariateDiffusionProcess;

public class MultivariateDiffusionProcessIntegrator<M extends MultivariateDiffusionProcessState> implements
                                                   AutoCloseable
{
  final int                                                       dim;

  public final DiffusionProcessIntegrator<M, DiffusionProcess<M>> integrators[];

  M                                                               state;

  Real                                                            sqrtδt = new Real();

  private MultivariateDiffusionProcess                            process;

  public MultivariateDiffusionProcessIntegrator(MultivariateDiffusionProcess process,
                                                M state,
                                                DiffusionProcessIntegrator<M, DiffusionProcess<M>>... integrators)
  {
    dim              = process.dim();
    this.integrators = new DiffusionProcessIntegrator[dim];
    for (int i = 0; i < dim; i++)
    {
      this.integrators[i] = integrators[i];
    }
    this.process = process;
    this.state   = state;
  }

  public EvaluationSequence step(M state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(state, prec, evalSeq);
    }
    return evalSeq;
  }

  public EvaluationSequence jump(M state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].jump(state.getState(i), prec, evalSeq);
    }
    return evalSeq;
  }

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
  public void close()
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].close();
    }
    sqrtδt.close();
  }

}
