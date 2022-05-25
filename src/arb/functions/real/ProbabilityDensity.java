package arb.functions.real;

import arb.functions.complex.ComplexFunction;

public interface ProbabilityDensity extends
                                    RealFunction
{
  public default ComplexFunction getCharacteristicFunction()
  {
    throw new UnsupportedOperationException( "TODO: return the Fourier transform of this");
  }
  
}
