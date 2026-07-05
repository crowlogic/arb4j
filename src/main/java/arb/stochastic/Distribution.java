package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 * A probability distribution over the real line, parameterized by named
 * {@link Real} handles registered in a {@link Context} so that the
 * distribution's defining functions — its density, its distribution function,
 * and the logarithm of its density — are compiled once by the expression
 * compiler and re-evaluated for any parameter values by mutating the handles.
 *
 * <p>
 * The {@link Context} is the single point of truth for the parameters: every
 * compiled function of the distribution reads the same handles, so setting a
 * parameter through its handle instantly reparameterizes the density, the
 * distribution function, the log-density, and every symbolic derivative
 * obtained from them via
 * {@link arb.functions.Function#jacobian(String[])}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class Distribution implements
                                   AutoCloseable
{

  /**
   * The {@link Context} holding this distribution's named parameter handles.
   */
  public final Context context;

  /**
   * Working precision, in bits, of the compiled functions.
   */
  public final int     bits;

  protected Distribution(Context context, int bits)
  {
    this.context = context;
    this.bits    = bits;
  }

  /**
   * The probability density function (for a discrete distribution, the
   * probability mass function regarded as a function of a real argument).
   */
  public abstract RealFunction densityFunction();

  /**
   * The cumulative distribution function F(y) = P(Y ≤ y).
   */
  public abstract RealFunction distributionFunction();

  /**
   * The logarithm of {@link #densityFunction()} — the per-observation
   * log-likelihood ℓ(y) whose symbolic parameter derivatives are the score.
   */
  public abstract RealFunction logDensityFunction();

  /**
   * Draw one variate; the result is written into {@code result} and returned.
   *
   * @param state  the pseudorandom state driving the draw
   * @param bits   arithmetic precision of the draw
   * @param result written and returned
   */
  public abstract Real sample(RandomState state, int bits, Real result);

  /**
   * Fill the vector {@code results} (of dimension {@code results.dim()}) with
   * independent variates.
   */
  public Real sample(RandomState state, int bits, Real results, int count)
  {
    for (int i = 0; i < count; i++)
    {
      sample(state, bits, results.get(i));
    }
    return results;
  }

  @Override
  public abstract void close();

}
