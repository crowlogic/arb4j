package arb.stochastic;

import arb.*;
import arb.functions.real.*;

/**
 * The distribution function of a random variable is the integral of the
 * corresponding density function
 */
public interface DistributionFunction<P extends DensityFunction> extends
                                     RealFunction
{
  /**
   * Draw a (pseudo) random sample from this density
   * 
   * @return
   */
  public default Real sample()
  {

    assert false : "TODO: implement the inverse transform sampling method";
    return null;
  }
}
