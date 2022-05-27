package arb.functions.complex.elliptic;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

/**
 * The imaginary quarter perioid i*K'(s) is the Wick rotation of the derivative
 * of the Complete Elliptical Integral of the First Kind, ALso known as the real
 * quarter period (function)
 * 
 * @author crow
 */
public class ImaginaryQuarterPeriod implements
                                    ComplexFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    throw new UnsupportedOperationException("TODO: Return i*K'(z) where K is the RealQuarterPeriod");
  }

}
