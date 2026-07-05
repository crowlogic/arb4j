package arb.stochastic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Minimal probability-distribution surface for arb4j-style stochastic models.
 * The density is the derivative of the distribution function, matching the
 * requested semantics for compiled probability laws.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public abstract class Distribution implements
                         AutoCloseable
{
  protected final String name;

  protected Distribution(String name)
  {
    this.name = name;
  }

  public String getName()
  {
    return name;
  }

  public abstract RealFunction densityFunction();

  public abstract RealFunction distributionFunction();

  public abstract RealFunction logDensityFunction();

  public abstract String[] parameterNames();

  public abstract void setParameters(double... parameters);

  @Override
  public void close()
  {
  }
}
