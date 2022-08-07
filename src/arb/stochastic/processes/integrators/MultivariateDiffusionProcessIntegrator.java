package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

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

  M                                                               multivariateState;

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
    this.process           = process;
    this.multivariateState = state;
  }

  public EvaluationSequence step(M state, int prec, EvaluationSequence evalSeq)
  {
    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(state, prec, evalSeq);
    }
    this.multivariateState.nextIndex();
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
    println("Partitioning " + interval + " into " + n + " pieces at " + prec + " bits of precision");
    RealPartition partition = interval.realPartition(n, prec);
    multivariateState.setdt(partition.dt);
    partition.dt.sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   Real.newVector(n + 1));

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 multivariateState.getdt(sqrtδt)
                                                                                                  .sqrt(prec)),
                                             multivariateState.getRandomState(),
                                             prec);

    for (Real t : partition)
    {
      println("");
      multivariateState.setTime(t);
      step(multivariateState, prec, evaluationSequence);
      jump(multivariateState, prec, evaluationSequence);
      System.out.println(multivariateState);
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
