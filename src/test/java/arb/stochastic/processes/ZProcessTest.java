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
    System.loadLibrary("arblib");
    ZProcess                       Zprocess            = new ZProcess();
    RealBivariateToComplexFunction gainFunction        = Zprocess.gainFunction();
    RealToComplexFunction          gainAtHalfFrequency = gainFunction.evaluate(RealConstants.half,
                                                                               128);
    Complex                        gainAtPointInTime   =
                                                     gainAtHalfFrequency.eval(13.2, new Complex());
    assertEquals(0.12587432650685262, gainAtPointInTime.getReal().doubleValue());
    assertEquals(-0.5959914833141249, gainAtPointInTime.getImag().doubleValue());
  }

}
