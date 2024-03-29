package arb.functions.complex.elliptic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.TaylorShift;
import arb.functions.complex.WickRotation;
import arb.operators.CompositionOperator;

/**
 * The imaginary quarter perioid i*K'(s) is the Wick rotation of the derivative
 * of the Complete Elliptical Integral of the First Kind, ALso known as the real
 * quarter period (function)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ImaginaryQuarterPeriod extends
                                    TaylorShift<CompositionOperator<RealQuarterPeriod, WickRotation>>
{

  public ImaginaryQuarterPeriod()
  {
    super(new CompositionOperator<RealQuarterPeriod, WickRotation>(new RealQuarterPeriod(),
                                                                   new WickRotation(false)));
  }

}
