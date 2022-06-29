package arb.functions.complex.elliptic;

import arb.functions.complex.Shift;
import arb.functions.complex.WickRotation;
import arb.operators.CompositionOperator;

/**
 * The imaginary quarter perioid i*K'(s) is the Wick rotation of the derivative
 * of the Complete Elliptical Integral of the First Kind, ALso known as the real
 * quarter period (function)
 * 
 * @author crow
 */
public class ImaginaryQuarterPeriod extends
                                    Shift<CompositionOperator<RealQuarterPeriod, WickRotation>>
{

  public ImaginaryQuarterPeriod()
  {
    super(new CompositionOperator(new RealQuarterPeriod(),
                                         new WickRotation(false)));
  }

}
