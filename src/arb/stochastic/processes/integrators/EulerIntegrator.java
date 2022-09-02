package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.prec;
import static arb.FloatConstants.half;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import arb.Float;
import arb.FloatConstants;
import arb.FloatInterval;
import arb.OrderedPair;
import arb.RandomState;
import arb.Real;
import arb.RealPartition;
import arb.stochastic.GaussianDistribution;
import arb.stochastic.processes.DiffusionCoeffecientFunction;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.DriftCoeffecientFunction;
import arb.stochastic.processes.EvaluationSequence;
import arb.stochastic.processes.OrnsteinUhlenbeckProcess;

/**
 * Integrates a {@link DiffusionProcess} via Euler's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ,t)dt + σ(Xₜ,t)dBₜ
 * </pre>
 * 
 * where Bₜ is a BrownianMotion also-known-as a WienerProcess having zero mean
 * drift and standard deviation parameter σ=√(dt) such that the variance is dt,
 * the time elapsed
 */
public class EulerIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                            AbstractDiffusionProcessIntegrator<D, P>
{

  public static final class KeyHandler implements
                                       KeyListener
  {
    @Override
    public void keyTyped(KeyEvent e)
    {

    }

    @Override
    public void keyPressed(KeyEvent e)
    {
      switch (e.getKeyCode())
      {
      case KeyEvent.VK_ESCAPE:
        System.exit(1);
      }

    }

    @Override
    public void keyReleased(KeyEvent e)
    {

    }
  }

  public static void main(String args[])
  {

    OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(new Real("1.5",
                                                                             128),
                                                                    new Real("2",
                                                                             128),
                                                                    new Real("0.1",
                                                                             128));
    try ( var integrator = new EulerIntegrator(process,
                                               new DiffusionProcessState(new Real("3",
                                                                                  128),
                                                                         new RandomState(31337))))
    {

      var path = integrator.integrate(new FloatInterval(0,
                                                        5),
                                      750,
                                      prec);

      for (OrderedPair<Real, Real> sample : path)
      {
        //spotPriceData.add(sample.a.doubleValue(), sample.b.doubleValue());
      }

      //print(integrator.getClass().getSimpleName(), spotPriceData);

      println("mean=" + path.values[0].mean(128, new Real()));
    }

  }

  private int dim;

  public EulerIntegrator(P x, D diffusionProcessState)
  {
    super(x);
    state    = diffusionProcessState;
    μ        = diffusionProcess.μ();
    σ        = diffusionProcess.σ();
    this.dim = 0;
  }

  public EulerIntegrator(P x, D diffusionProcessState, int dim)
  {
    super(x);
    state    = diffusionProcessState;
    μ        = diffusionProcess.μ();
    σ        = diffusionProcess.σ();
    this.dim = dim;
  }

  DriftCoeffecientFunction<D>     μ;
  DiffusionCoeffecientFunction<D> σ;

  @Override
  public synchronized EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    interval.length(prec, T);

    RealPartition partition = interval.realPartition(n, prec);
    state.setdt(partition.dt);

    evaluationSequence = new EvaluationSequence(partition,
                                                1);

    evaluationSequence.generateRandomSamples(new GaussianDistribution(zero,
                                                                      state.sqrtdt(prec, sqrtdt)),
                                             state.getRandomState(),
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      state.lock();
      step(state, prec, evaluationSequence);
      state.unlock();
      assert jump((DiffusionProcessState) state,
                  prec,
                  evaluationSequence) : "invalid jump, please try again with another sample";
    }

    return evaluationSequence;
  }

  @Override
  public boolean step(D state, int prec, EvaluationSequence evaluationSequence)
  {
    return step(state, prec, evaluationSequence, 1);
  }

  /**
   * 
   * @param state
   * @param prec
   * @param evaluationSequence
   * @param σorder             the order to pass to the
   *                           {@link DiffusionCoeffecientFunction}, the
   *                           {@link MilsteinIntegrator} calls this with 2, but
   *                           the EulerIntegrator only needs 1
   * @return
   */
  protected boolean step(D state, int prec, EvaluationSequence evaluationSequence, int σorder)
  {
    int  i  = state.index();
    Real xi = evaluationSequence.values[dim].get(i);
    xi.printPrecision = true;

    diffusionProcess.μ().evaluate(state, 1, prec, μi);
    μi.mul(state.dt(), prec);
    assert μi.isFinite();

    diffusionProcess.σ().evaluate(state, σorder, prec, σi);
    assert !σi.isNegative() && σi.isFinite() : "X.σ is not finite and nonnegative. state=" + state;

    if (verbose)
    {
      println("i=" + " xi=" + xi + " μi=" + μi + " σi=" + σi);
    }
    σi.mul(xi, prec);

    if (σorder == 1)
    {
      μi.add(σi, prec, xi);
    }

    return true; // return false if variance went negative
  }

  public boolean             nonNegative = false;
  private EvaluationSequence evaluationSequence;

  @Override
  public final boolean jump(DiffusionProcessState state, int prec, EvaluationSequence evaluationSequence)
  {
    int i = state.index();
    assert i >= 0;
    Real xi = evaluationSequence.values[dim].get(i);

    xi.add(state.value(), prec);
    if (nonNegative && xi.isNegative())
    {
      System.err.println("calculated variance = " + xi + " cannot be negative");
      return false;
    }
    else
    {
      state.nextIndex();
      state.setValue(xi);

      if (verbose)
      {
        System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n", i, state.time(), μi, σi, xi, state);
      }

      return true;
    }
  }

  @Override
  public Float weakConvergenceOrder(int dim)
  {
    return FloatConstants.one;
  }

  @Override
  public Float strongConvergenceOrder(int dim)
  {
    return half;
  }

}
