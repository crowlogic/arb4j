package arb.stochastic.processes;

import arb.Field;
import arb.Real;
import arb.functions.Function;

/**
 * The notation used in probability theory (and in many applications of
 * probability theory, for instance mathematical finance) is slightly different.
 * It is also the notation used in publications on numerical methods for solving
 * stochastic differential equations. <br>
 * 
 * A typical equation is of the form<br>
 * <b>dX(t) = μ(X(t),t)dt + σ(X(t),t)dB(t)</b> where B denotes a standard
 * Brownian motion (Wiener process) which is equivalent to the integral equation
 * <br>
 * X(t+s)-X(t)=∫μ(X(u),u)du + ∫σ(X(u),u)dB(u) <br>
 * characterizes the continuous-time stochastic process X(t) as the sum of an
 * ordinary Lebesgue integral and an Itô integral. Heuristically, a helpful
 * interpretation of the stochastic differential equation is that in a small
 * time interval of length δ the stochastic process X(t) changes its value by an
 * amount that is normally distributed with expectation <b>μ(X(t),t)δ</b> and
 * variance <b>σ(X(t),t)²δ</b> and is independent of the past behavior of the
 * process. This is so because the increments of a {@link WienerProcess} are
 * independent and normally distributed. The function this{@link #μ()} is
 * referred to as the drift coefficient, while this{@link #σ()}σ is called the
 * diffusion coefficient. The stochastic process X(t) is called a diffusion
 * process, and satisfies the Markov property therefore is said to be Markovian.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Stochastic_differential_equation">Wikipedia</a>
 *      for references
 *
 */
public interface DiffusionProcess extends
                                 StochasticProcess
{
  /**
   * 
   * @return the drift coefficient
   */
  public Real μ();

  /**
   * 
   * @return the diffusion coefficient
   */
  public Real σ();

}
