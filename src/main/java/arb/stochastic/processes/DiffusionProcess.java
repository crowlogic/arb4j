package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.State;

/**
 * The notation used in probability theory (and in many applications of
 * probability theory, for instance mathematical finance) is slightly different.
 * It is also the notation used in publications on numerical methods for solving
 * stochastic differential equations. <br>
 * 
 * A typical equation is of the form<br>
 * <b>dXₜ = μ(Xₜ,t)dt + σ(Xₜ,t)dBₜ</b> where Bₜ denotes a standard Brownian
 * motion (Wiener process) which is equivalent to the integral equation <br>
 * <br>
 * Xₜ₊ₛ-Xₜ=∫μ(Xᵤ,u)du + ∫σ(Xᵤ,u)dBᵤ <br>
 * 
 * characterizes the continuous-time stochastic process Xₜ as the sum of an
 * ordinary Lebesgue integral and an Itô integral. Heuristically, a helpful
 * interpretation of the stochastic differential equation is that in a small
 * time interval of length δ the stochastic process X(t) changes its value by an
 * amount that is normally distributed with expectation <b>μ(Xₜ,t)δ</b> and
 * variance <b>σ(Xₜ,t)²δ</b> and is independent of the past behavior of the
 * process. This is so because the increments of a {@link BrownianMotion} are
 * independent and normally distributed. <br>
 * <br>
 * 
 * The function this{@link #μ(int)} is referred to as the drift coefficient,
 * while this{@link #σ(int)}σ is called the diffusion coefficient. The
 * stochastic process Xₜ is called a diffusion process, and satisfies the Markov
 * property therefore is said to be Markovian.
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface DiffusionProcess<S extends State> extends
                                 StochasticProcess<S>
{
  public default S getState()
  {
    return null;
  }

  public DriftCoeffecientFunction<S> μ();

  public DiffusionCoeffecientFunction<S> σ();

}
