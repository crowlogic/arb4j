package arb.functions.complex.elliptic;

import arb.functions.complex.TaylorShift;
import arb.functions.complex.WickRotation;
import arb.operators.Composition;

/**
 * The imaginary quarter perioid i*K'(s) is the Wick rotation of the derivative
 * of the Complete Elliptical Integral of the First Kind, ALso known as the real
 * quarter period (function)
 * 
 * @author crow
 */
public class ImaginaryQuarterPeriod extends
                                    TaylorShift<Composition<RealQuarterPeriod, WickRotation>>
{

  public ImaginaryQuarterPeriod()
  {
    super(new Composition(new RealQuarterPeriod(),
                          new WickRotation(false)));
  }

}
