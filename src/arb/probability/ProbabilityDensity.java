package arb.probability;

import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

public interface ProbabilityDensity extends
                                    RealFunction
{
  public default ComplexFunction getCharacteristicFunction()
  {
    throw new UnsupportedOperationException( "TODO: return the Fourier transform of this");
  }
  
}
