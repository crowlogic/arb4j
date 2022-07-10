package arb.probability.densities;

import arb.*;
import arb.functions.complex.*;
import arb.functions.real.*;

public interface ProbabilityDensity extends
                                    RealFunction
{
  public default ComplexFunction getCharacteristicFunction()
  {
    throw new UnsupportedOperationException("TODO: return the Fourier transform of this");
  }

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
