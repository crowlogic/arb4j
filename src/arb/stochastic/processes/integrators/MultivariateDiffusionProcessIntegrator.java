package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.RealPartition;
import arb.stochastic.GaussianDistribution;
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

  public EvaluationSequence step(int prec, EvaluationSequence evalSeq)
  {

    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(multivariateState, prec, evalSeq);
    }
    return evalSeq;

  }

  public EvaluationSequence jump(int prec, EvaluationSequence evalSeq)
  {
    multivariateState.nextIndex();
    for (int i = 0; i < dim; i++)
    {
      integrators[i].jump(multivariateState.getState(i), prec, evalSeq);
    }
    return evalSeq;
  }

  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    println("Partitioning " + interval + " into " + n + " pieces at " + prec + " bits of precision");
    RealPartition partition = interval.realPartition(n, prec);
    multivariateState.setdt(partition.dt);
    partition.dt.sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,process.dim());

    evaluationSequence.generateRandomSamples(new GaussianDistribution(zero,
                                                                                 multivariateState.getdt(sqrtδt)
                                                                                                  .sqrt(prec)),
                                             multivariateState.getRandomState(),
                                             prec);

    for (Real t : partition)
    {
      multivariateState.setTime(t);
      multivariateState.lock();
      step(prec, evaluationSequence);
      multivariateState.unlock();

      jump(prec, evaluationSequence);
      System.out.println("jump " + multivariateState);
      System.out.println("this " + this.process );      
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
