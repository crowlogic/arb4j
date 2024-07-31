package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;
import static arb.utensils.Utensils.println;
import static java.lang.System.err;
import static java.lang.System.out;

import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealPartition;
import arb.stochastic.GaussianDistribution;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.EvaluationSequence;
import arb.stochastic.processes.MultivariateDiffusionProcess;

/**
 * <pre>
 * This class performs the integration of a multivariate diffusion process,
 * which is a system of stochastic differential equations (SDEs) describing the
 * evolution of multiple random variables, by utilizing an array of univariate 
 * integrators for each dimension of the process and providing methods for 
 * stepping through the integration, jumping between states, and performing 
 * the integration over a specified interval. These univariate integrators 
 * are instances of the {@link DiffusionProcessIntegrator} class, specialized 
 * for each dimension of the multivariate process.
 * </pre>
 * 
 * @param <M> the type of multivariate diffusion process state used in the
 *            integration
 * @see DiffusionProcessIntegrator
 * @see MultivariateDiffusionProcess
 * @see MultivariateDiffusionProcessState
 * 
 */
public class MultivariateDiffusionProcessIntegrator<M extends MultivariateDiffusionProcessState> implements
                                                   AutoCloseable
{
  final int                                                         dim;

  public final DiffusionProcessIntegrator<M, DiffusionProcess<M>>[] integrators;

  M                                                                 state;

  Real                                                              sqrtδt  = new Real();

  private MultivariateDiffusionProcess<M>                           process;

  private RealMatrix                                                correlationMatrix;

  boolean                                                           verbose = false;

  @SafeVarargs
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

  @Override
  public void close()
  {
    for (var integrator : integrators)
    {
      integrator.close();
    }

    sqrtδt.close();
  }

  /**
   * <pre>
   * Integrates the stochastic process over the specified interval using a given
   * number of steps and precision. The method generates random samples from a
   * {@link GaussianDistribution} and simulates the process by stepping through
   * the interval and updating the process state at each step. Jumps are handled by
   * checking for jump conditions, and if a jump fails, random samples are
   * regenerated.
   * 
   * The method returns an {@link EvaluationSequence} containing the simulated
   * process values at each partition point of the interval.
   * 
   * The value of {@link MultivariateDiffusionProcessState#dt()} will be set to 
   * the length of the interval divided by the number of partitions.
   * </pre>
   * 
   * @param interval The {@link FloatInterval} over which the process should be
   *                 integrated.
   * @param n        The number of partitions in the interval.
   * @param bits     The precision used for calculations during the integration.
   * @return An {@link EvaluationSequence} containing the simulated process values
   *         at each partition point of the interval.
   */
  public EvaluationSequence integrate(FloatInterval interval, int n, int bits)
  {
    if (verbose)
    {
      println("Partitioning " + interval + " into " + n + " pieces at " + bits + " bits of precision");
    }
    final int     stateIndex = state.index();
    RealPartition partition  = interval.generateRealPartition(bits, false, n);
    state.setdt(partition.dt);
    partition.dt.sqrt(bits, sqrtδt);

    EvaluationSequence   evaluationSequence   = new EvaluationSequence(partition,
                                                                       process.dim());

    GaussianDistribution gaussianDistribution = new GaussianDistribution(zero,
                                                                         state.getdt(sqrtδt).sqrt(bits));
    RandomState          randomState          = state.getRandomState();
    evaluationSequence.generateRandomSamples(gaussianDistribution, correlationMatrix, randomState, bits);
    state.verify();

    for (Real t : partition)
    {
      state.setTime(t);
      boolean jumped = false;

      do
      {
        step(bits, evaluationSequence);
        if (!(jumped = jump(bits, evaluationSequence)))
        {
          if (verbose)
          {
            err.println("Jump failed: " + state + " regenerating ");
          }
          for (Real sample : evaluationSequence.dimensions)
          {
            assert false : "redo, if you really *must* use this technique";

           // sample.get(stateIndex).randomlyGenerate(gaussianDistribution, randomState, bits);
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

  /**
   * <pre>
   * Attempts to perform a jump in the stochastic process by updating the state
   * for each dimension. The method iterates through each dimension, invoking the
   * {@code
   * jump
   * } method on the corresponding integrator. If all jumps are
   * successful, the method advances the state's index. Otherwise, the state's
   * indices are reset.
   * 
   * This method is synchronized to ensure thread safety when multiple threads are
   * attempting to jump the process simultaneously.
   * </pre>
   * 
   * @param prec    The precision used for calculations during the jump.
   * @param evalSeq The {@link EvaluationSequence} containing the simulated
   *                process values.
   * @return {@code true} if the jump is successful for all dimensions,
   *         {@code false} otherwise.
   */
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

  /**
   * <pre>
   * Performs a single step in the stochastic process by updating the state for
   * each dimension. The method iterates through each integrator and calls the
   * {@code
   * step
   * } method with the current state, precision, and evaluation
   * sequence.
   * </pre>
   * 
   * @param prec    The precision used for calculations during the step.
   * @param evalSeq The {@link EvaluationSequence} containing the simulated
   *                process values.
   * @return The updated {@link EvaluationSequence} after the step has been
   *         performed for all dimensions.
   */
  public EvaluationSequence step(int prec, EvaluationSequence evalSeq)
  {
    if (verbose)
    {
      out.println(MultivariateDiffusionProcessIntegrator.class.getSimpleName() + " state=" + state);
    }
    for (var integrator : integrators)
    {
      integrator.step(state, prec, evalSeq);
    }
    return evalSeq;
  }

}
