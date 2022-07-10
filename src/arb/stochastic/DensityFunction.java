package arb.stochastic;

import arb.functions.complex.*;
import arb.functions.real.*;

/**
 * The probability density function (PDF) of a continuous distribution is
 * defined as the derivative of the corresponding (cumulative) distribution
 * function
 * 
 *
 */
public interface DensityFunction extends
                                 RealFunction
{
  public default DistributionFunction getDistributionFunction()
  {
    return integral();
  }

  public default ComplexFunction getCharacteristicFunction()
  {
    assert false : "TODO: return the Fourier transform of this";
    return null;
  }

}
