package arb.stochastic.processes.integrators;

import static arb.RealConstants.zero;

import arb.*;
import arb.Float;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.*;

public class BivariateDiffusionProcessIntegrator<S extends DiffusionProcessState, X extends DiffusionProcess<S>, I extends StochasticIntegrator<S, X>>
                                                extends
                                                OrderedPair<I, I> implements
                                                StochasticIntegrator<S, X>, AutoCloseable
{

  private X process;

  S         state;

  Real      sqrtδt = new Real();

  public BivariateDiffusionProcessIntegrator(BivariateDiffusionProcess<S> process,
                                             S state,
                                             I xIntegrator,
                                             I yIntegrator)
  {
    super(xIntegrator,
          yIntegrator);
    process    = new BivariateDiffusionProcess<>(xIntegrator.X(),
                                                 yIntegrator.X());
    this.state = state;
  }

  @Override
  public EvaluationSequence step(S state, int prec, EvaluationSequence evalSeq)
  {
    a.step(state, prec, evalSeq);
    b.step(state, prec, evalSeq);
    return evalSeq;
  }

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq)
  {
    a.jump(state, prec, evalSeq);
    b.jump(state, prec, evalSeq);
    return evalSeq;
  }

  @Override
  public EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {

    RealPartition partition = interval.realPartition(n, prec);
    state.dt.set(partition.dt).sqrt(prec, sqrtδt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   Real.newVector(n +1));

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 state.dt.sqrt(prec, sqrtδt)),
                                             state.randomState,
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      step(state, prec, evaluationSequence);
      jump(state, prec, evaluationSequence);
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
  public X X()
  {
    return process;
  }

  @Override
  public void close()
  {
    state.close();
    sqrtδt.close();
  }

}
