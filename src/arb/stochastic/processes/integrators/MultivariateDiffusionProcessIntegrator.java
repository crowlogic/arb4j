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
      assert false : "TODO: add multivarite support to EvaluationSequence";                    
      integrators[i].jump(multivariateState.getState(i), prec, evalSeq);
    }
    return evalSeq;
  }

  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    process.validate();
    println("Partitioning " + interval + " into " + n + " pieces at " + prec + " bits of precision");
    RealPartition partition = interval.partition(n, prec);
    multivariateState.setdt(partition.dt);
    partition.dt.sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,1);

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 multivariateState.getdt(sqrtδt)
                                                                                                  .sqrt(prec)),
                                             multivariateState.getRandomState(),
                                             prec);

    for (Real t : partition)
    {
      println("");
      multivariateState.setTime(t);
      multivariateState.lock();
      process.validate();
      step(prec, evaluationSequence);
      multivariateState.unlock();

      process.validate();
      System.out.println("after step " + multivariateState);

      jump(prec, evaluationSequence);
      System.out.println("after jump " + multivariateState);

      process.validate();
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
