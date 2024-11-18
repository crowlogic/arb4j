package arb.functions.real;

import java.util.ArrayList;

import arb.Float;
import arb.FloatInterval;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The {@link FunctionSampler} class performs the sampling of real functions.
 * <p>
 * The FunctionSampler class provides utilities to manage a collection of real
 * functions and to resample these functions over a certain domain.
 * <p>
 * This class is typically used in scenarios where you need to regularly
 * resample a set of functions over a fixed or changing interval, typically when
 * the parameters of the function are changed and new values are needed
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionSampler implements
                             AutoCloseable
{
  public static final int              precision   = 128;

  public final ArrayList<RealFunction> functions   = new ArrayList<>();

  public FloatInterval                 domain;

  public int                           sampleCount = 0;

  public int                           resolution  = 100;

  public FunctionSampler(FloatInterval domain)
  {
    this.domain = domain;
  }

  public FunctionSampler(FloatInterval domain, Float dt)
  {
    this.domain = domain;
    try ( Float length = domain.length(128, new Float()))
    {
      Float samplesPerUnit = length.div(dt, 128);
      this.resolution = (int) samplesPerUnit.doubleValue();
    }
  }

  /**
   * Default construct with a domain of -10..10
   */
  public FunctionSampler()
  {
    this(new FloatInterval(-10,
                           10));
  }


  @Override
  public void close()
  {
    functions.forEach(RealFunction::close);
  }
}
