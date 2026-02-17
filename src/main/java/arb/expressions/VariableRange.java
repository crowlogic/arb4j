package arb.expressions;

import arb.Real;

/**
 * Represents a closed interval constraint [lower, upper] on a variable.
 */
public class VariableRange implements
                           AutoCloseable
{
  public final Real    lower;
  public final Real    upper;
  public final boolean lowerInclusive;
  public final boolean upperInclusive;

  public VariableRange(Real lower, boolean lowerInclusive, Real upper, boolean upperInclusive)
  {
    this.lower          = lower;
    this.lowerInclusive = lowerInclusive;
    this.upper          = upper;
    this.upperInclusive = upperInclusive;
  }

  /**
   * @return the ceiling of the upper bound as an int, which determines the
   *         maximum integer order n for Caputo derivatives.
   */
  public int ceilOfUpper()
  {
    return (int) Math.ceil(upper.doubleValue());
  }

  @Override
  public void close()
  {
    lower.close();
    upper.close();
  }
}