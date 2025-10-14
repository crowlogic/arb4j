package arb.stochastic.processes;

import arb.Complex;
import arb.RealConstants;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import junit.framework.TestCase;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ZProcessTest extends
                          TestCase
{

  public void testZProcessGainFunction()
  {

    ZProcess                       Zprocess            = new ZProcess();
    RealBivariateToComplexFunction gainFunction        = Zprocess.gainFunction();
    RealToComplexFunction          gainAtHalfFrequency = gainFunction.evaluate(RealConstants.half,
                                                                               128);
    Complex                        gainAtPointInTime   =
                                                     gainAtHalfFrequency.eval(13.2, new Complex());
    assertEquals(0.30528588689168384, gainAtPointInTime.getReal().doubleValue());
    assertEquals(-0.5271154726635167, gainAtPointInTime.getImag().doubleValue());
  }

}
