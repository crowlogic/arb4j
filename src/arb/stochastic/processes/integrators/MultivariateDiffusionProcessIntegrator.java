package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;
import static java.lang.System.err;

import java.util.Arrays;

import arb.*;
import arb.stochastic.GaussianDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.MultivariateDiffusionProcess;

public class MultivariateDiffusionProcessIntegrator<M extends MultivariateDiffusionProcessState> implements
                                                   AutoCloseable
{
  final int                                                       dim;

  public final DiffusionProcessIntegrator<M, DiffusionProcess<M>> integrators[];

  M                                                               state;

  Real                                                            sqrtδt = new Real();

  private MultivariateDiffusionProcess                            process;

  private GaussianDistribution                                    gaussian;

  private RealMatrix correlationMatrix;

  public MultivariateDiffusionProcessIntegrator(MultivariateDiffusionProcess process,
                                                M state,
                                                RealMatrix correlationMatrix,
                                                DiffusionProcessIntegrator<M, DiffusionProcess<M>>... integrators)
  {
    dim              = process.dim();
    this.integrators = new DiffusionProcessIntegrator[dim];
    for (int i = 0; i < dim; i++)
    {
      this.integrators[i] = integrators[i];
    }
    this.correlationMatrix = correlationMatrix;
    this.process = process;
    this.state   = state;
  }

  public EvaluationSequence step(int prec, EvaluationSequence evalSeq)
  {

    for (int i = 0; i < dim; i++)
    {
      integrators[i].step(state, prec, evalSeq);
    }
    return evalSeq;

  }

  public boolean jump(int prec, EvaluationSequence evalSeq)
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
    println("Partitioning " + interval + " into " + n + " pieces at " + prec + " bits of precision");
    RealPartition partition = interval.realPartition(n, prec);
    state.setdt(partition.dt);
    partition.dt.sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   process.dim() + 1);

    gaussian = new GaussianDistribution(zero,
                                        state.getdt(sqrtδt).sqrt(prec));
    evaluationSequence.generateRandomSamples(gaussian, state.getRandomState(), prec);
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
          Arrays.asList(evaluationSequence.values)
                .forEach(sample -> sample.get(state.index())
                                         .randomlyGenerate(gaussian, state.getRandomState(), prec));

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
    for (int i = 0; i < dim; i++)
    {
      integrators[i].close();
    }
    sqrtδt.close();
  }

}
