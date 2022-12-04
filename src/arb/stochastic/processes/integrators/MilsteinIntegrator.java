package arb.stochastic.processes.integrators;

import static arb.FloatConstants.one;

import arb.Float;
import arb.Real;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.EvaluationSequence;

/**
 * Integrates a {@link DiffusionProcess} via Milstein's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ)*dt + σ(Xₜ)*dBₜ + ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2
 * </pre>
 * 
 * where σ(Xₜ)∂Xₜ is the derivative of σ relative to X, not t; and Bₜ is a
 * BrownianMotion also-known-as a WienerProcess having zero mean drift and
 * standard deviation parameter σ=√(dt) such that the variance is dt, the time
 * elapsed between invocations of
 * {@link DiscreteTimeDynamicalSystem}{@link #jump(DiffusionProcessState, int, EvaluationSequence)}.
 * This method is only applicable to processes whose drift and diffusions do not
 * *directly* depend on t. <br>
 * <br>
 * 
 * The key to the Milstein scheme is that the accuracy of the discretization is
 * increased by considering expansions of the coefficients μₜ=μ(Sₜ) and σₜ=σ(Sₜ)
 * via Itō’s lemma.
 */
public class MilsteinIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                               EulerIntegrator<P, D> implements
                               AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("MilsteinIntegrator[X=%s, sqrtδt=%s, state=%s]", diffusionProcess, sqrtdt, state);
  }

  @Override
  public void close()
  {
    super.close();
    σσi.close();

  }

  Real    σσi    = new Real();

  boolean warned = false;

  @Override
  public boolean step(D state, int prec, EvaluationSequence evalSequence)
  {
    step(state, prec, evalSequence, 2);

    Real xi = evalSequence.dimensions[0].get(state.index());

    // 2nd order correction
    σi.mul(σi.get(1), prec, σσi);
    assert σi.isFinite() && σi.get(1).isFinite() : "σ is not finite " + σσi + "\nσ=" + σi + " xi=" + xi;

    assert σσi.isFinite() : "σσ is not finite " + σσi + "\nσ=" + σi;
    σσi.mul(state.dt(), prec).div(2, prec).mul(xi.pow(2, prec).sub(1, prec), prec);
    if (!warned && σσi.isZero())
    {
      System.err.println("It it useless to use Milstein method on a " + diffusionProcess.getClass().getSimpleName());
      warned = true;
    }
    μi.add(σi, prec, xi).add(σσi, prec);

    // the derivative is in σi.get(1) .. the 2nd
    // order to be added is ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2 where
    // σ(Xₜ)∂Xₜ is the derivative of σ relative to X, which is a function of t,
    // but this method will not work if either coefficient function depends directly
    // on t
    return true;
  }

  public MilsteinIntegrator(P x, D state)
  {
    super(x,
          state);
    assert !μ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
    assert !σ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
  }

  public MilsteinIntegrator(P p, D d, int i)
  {
    super(p,
          d,
          i);
    assert !μ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
    assert !σ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
  }

  @Override
  public Float weakConvergenceOrder()
  {
    return one;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    return one;
  }

}
