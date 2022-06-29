package arb.probability;

import arb.functions.real.RealFunction;

public interface ContinuousRandomVariable extends
                                RealFunction
{
  public default ProbabilityDensity getDensity()
  {
    throw new UnsupportedOperationException("TODO: " + getClass() + " needs to implement this function");
  }
}
