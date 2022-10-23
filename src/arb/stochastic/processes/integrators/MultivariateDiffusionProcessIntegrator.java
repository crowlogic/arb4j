package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;
import static java.lang.System.err;

import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealPartition;
import arb.stochastic.GaussianDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.EvaluationSequence;
import arb.stochastic.processes.MultivariateDiffusionProcess;

public class MultivariateDiffusionProcessIntegrator<M extends MultivariateDiffusionProcessState> implements
                                                   AutoCloseable
{
  final int                                                         dim;

  public final DiffusionProcessIntegrator<M, DiffusionProcess<M>>[] integrators;

  M                                                                 state;

  Real                                                              sqrtδt = new Real();

  private MultivariateDiffusionProcess<M>                           process;

  private RealMatrix                                                correlationMatrix;

  public MultivariateDiffusionProcessIntegrator(MultivariateDiffusionProcess<M> process,
                                                M state,
                                                RealMatrix correlationMatrix,
                                                DiffusionProcessIntegrator<M, DiffusionProcess<M>>... integrators)
  {
    dim                    = process.dim();
    this.integrators       = integrators;
    this.correlationMatrix = correlationMatrix;
    this.process           = process;
    this.state             = state;
  }



  public EvaluationSequence step(int prec, EvaluationSequence evalSeq)
  {
    for (var integrator : integrators)
    {
      integrator.step(state, prec, evalSeq);
    }
    return evalSeq;

  }

  public synchronized boolean jump(int prec, EvaluationSequence evalSeq)
  {
    boolean jumped = true;
    for (int i = 0; i < dim && jumped; i++)
    {
      if (!integrators[i].jump(state.getState(i), prec, evalSeq))
      {
        jumped = false;
      }
    }
    if (jumped)
    {
      state.nextIndex();
    }
    else
    {
      state.resetIndices();
    }
    return jumped;
  }

  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    if (verbose)
    {
      println("Partitioning " + interval + " into " + n + " pieces at " + prec + " bits of precision");
    }
    RealPartition partition = interval.realPartition(n, prec);
    state.setdt(partition.dt);
    partition.dt.sqrt(prec, sqrtδt);

    EvaluationSequence   evaluationSequence = new EvaluationSequence(partition,
                                                                     process.dim());

    GaussianDistribution gaussian           = new GaussianDistribution(zero,
                                                                       state.getdt(sqrtδt).sqrt(prec));
    RandomState          randomState        = state.getRandomState();
    evaluationSequence.generateRandomSamples(gaussian, correlationMatrix, randomState, prec);
    state.verify();

    for (Real t : partition)
    {
      state.setTime(t);
      boolean jumped = false;

      do
      {
        state.lock();
        step(prec, evaluationSequence);
        state.unlock();
        if (!(jumped = jump(prec, evaluationSequence)))
        {
          err.println("Jump failed: " + state + " regenerating ");
          for (Real sample : evaluationSequence.values)
          {
            sample.get(state.index()).randomlyGenerate(gaussian, randomState, prec);
          }

        }
      }
      while (!jumped);
      if (verbose)
      {
        System.out.println("jump " + state);
        System.out.println("this " + this.process + "\n");
      }
    }

    return evaluationSequence;
  }

  boolean verbose = false;

  @Override
  public void close()
  {
    for (var integrator : integrators)
    {
      integrator.close();
    }

    sqrtδt.close();
  }

}
