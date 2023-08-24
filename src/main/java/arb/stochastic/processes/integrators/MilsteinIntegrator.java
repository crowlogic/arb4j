package arb.stochastic.processes.integrators;

import static arb.FloatConstants.one;

import arb.*;
import arb.Float;
import arb.stochastic.processes.*;

/**
 * <pre>
 * This class provides an implementation for integrating a
 * {@link DiffusionProcess} using Milstein's method, which is a higher-order
 * numerical integration scheme for stochastic differential equations (SDEs).
 * 
 * Milstein's method considers expansions of the coefficients μₜ=μ(Sₜ) and
 * σₜ=σ(Sₜ) via Itō’s lemma to achieve improved accuracy over the simpler
 * Euler's method. This class is designed for processes with drift and diffusion
 * coefficients that do not directly depend on time (t).
 * 
 * dXₜ = μ(Xₜ)*dt + σ(Xₜ)*dBₜ + ( (dBₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2
 * 
 * The class provides methods for stepping through the integration process,
 * computing the second-order correction, and determining the weak and strong
 * convergence orders for the integration scheme.
 * 
 * 
 * Note: The Milstein method is not applicable for processes with coefficients
 * that directly depend on time (t). If such a process is encountered, a warning
 * will be issued.
 * </pre>
 */
public class MilsteinIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                               EulerIntegrator<P, D> implements
                               AutoCloseable,
                               Verifiable
{

  public MilsteinIntegrator(P x, D diffusionProcessState, int dim, boolean nonnegative)
  {
    super(x,
          diffusionProcessState,
          dim,
          nonnegative);
  }

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
    xiSquared.close();
    milsteinCorrection.close();

  }

  Real    σσi                = new Real();

  boolean warned             = false;

  // Calculate the Milstein correction term
  Real    milsteinCorrection = Real.newVector(2); // Instantiate a new Real object to

  Real    xiSquared          = new Real();

  @Override
  protected boolean step(D state, int prec, EvaluationSequence evaluationSequence, int σorder)
  {
    assert σorder > 0;

    int  i = state.index();
    Real ξ = evaluationSequence.dimensions[dim].get(i);
    ξ.printPrecision = true;

    diffusionProcess.μ().evaluate(state, 1, prec, μi).setRad(MagnitudeConstants.zeroMag);
    assert μi.isFinite();
    μi.mul(state.dt(), prec);

    String stateBefore = state.toString();
    diffusionProcess.σ().evaluate(state, σorder, prec, σi).setRad(MagnitudeConstants.zeroMag);

    assert !σi.isNegative() && σi.isFinite() : "X.σ is not finite and nonnegative. σi=" + σi + " state=" + state
                  + " stateBefore=" + stateBefore;

    if (verbose)
    {
      System.out.println("i=" + "\n xi=" + ξ + "\n μi=" + μi + "\n σi=" + σi);
    }

    xiSquared.set(ξ).mul(ξ, prec).sub(state.dt(), prec);

    σi.mul(ξ, prec).div(2, prec).mul(xiSquared, prec);

    if (σorder >= 0)
    {
      μi.add(σi, prec, ξ);
    }

    return true; // return false if variance went negative
  }

  public MilsteinIntegrator(P x, D state)
  {
    super(x,
          state);
    assert !μ.dependsOnAbsoluteTime()
                  && !σ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
  }

  public MilsteinIntegrator(P p, D d, int i)
  {
    super(p,
          d,
          i);
    assert !μ.dependsOnAbsoluteTime()
                  && !σ.dependsOnAbsoluteTime() : "the Milstein method does not work for coeffecients that depend directly on the value of t";
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

  /**
   * @return true if neither this{@link #σ} nor this{@link #μ}
   *         {@link DiffusionCoeffecientFunction#dependsOnAbsoluteTime()}
   */
  @Override
  public boolean verify()
  {
    return !μ.dependsOnAbsoluteTime() && !σ.dependsOnAbsoluteTime();
  }

}
