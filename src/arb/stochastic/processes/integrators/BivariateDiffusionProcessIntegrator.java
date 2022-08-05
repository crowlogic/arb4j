package arb.stochastic.processes.integrators;

import static arb.RealConstants.*;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.*;
import arb.stochastic.processes.*;

public class BivariateDiffusionProcessIntegrator<S extends State> implements
                                                StochasticIntegrator<S, DiffusionProcess<S>>,
                                                AutoCloseable
{
  static final int                                          dim           = 2;

  public final StochasticIntegrator<S, DiffusionProcess<S>> integrators[] = new StochasticIntegrator[dim];

  S                                                         state;

  Real                                                      sqrtδt        = new Real();

  public BivariateDiffusionProcessIntegrator(BivariateDiffusionProcess<S> process,
                                             S state,
                                             AbstractStochasticIntegrator<S, DiffusionProcess<S>> xIntegrator,
                                             AbstractStochasticIntegrator<S, DiffusionProcess<S>> yIntegrator)
  {
    integrators[0] = xIntegrator;
    integrators[1] = yIntegrator;
    process        = new BivariateDiffusionProcess<>(xIntegrator.X,
                                                     yIntegrator.X);
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
    try
    {
      state.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    sqrtδt.close();
  }

}
