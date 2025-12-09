package arb.functions.complex;

import arb.Real;
import arb.functions.real.RealFunction;
import arb.functions.real.RiemannSiegelThetaFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HardyThetaInversionTest
                                     extends
                                     TestCase
{
  public static void testInversionSpecializedRealFunctionIm() throws InterruptedException
  {
    int precision   = 128;
    int seriesOrder = 10;

    var theta = new RiemannSiegelThetaFunction();

    testInversion(precision,
                  seriesOrder,
                  theta);
  }
  
  public static void testInversionRSThetaNode() throws InterruptedException
  {
    int precision   = 128;
    int seriesOrder = 10;

    var theta = RealFunction.express("ϑ(t)");

    testInversion(precision,
                  seriesOrder,
                  theta);
  }

  protected static void testInversion(int precision, int seriesOrder, RealFunction theta)
  {
    if (seriesOrder < 2)
    {
      System.err.println("seriesOrder must be at least 2, setting to 2");
      seriesOrder = 2;
    }

    try ( var point = Real.valueOf(50); Real centerPoint = Real.valueOf(40); Real targetThetaValue = Real.newVector(2); Real result = new Real();)
    {
      invert(theta,
             precision,
             seriesOrder,
             point,
             centerPoint,
             targetThetaValue,
             result);

    }

//    ShellFunctions.plot(7,100,1000,inverter);
//    Thread.sleep(100000000);  }
  }

  protected static void invert(RealFunction theta, int precision, int seriesOrder, Real point, Real centerPoint, Real targetThetaValue, Real result)
  {
    try ( HardyThetaInversion inverter = new HardyThetaInversion(theta,
                                                                 centerPoint,
                                                                 seriesOrder,
                                                                 precision))
    {
      inverter.θ.evaluate(point,
                          2,
                          128,
                          targetThetaValue);
      System.out.format("θ(%s)=%s\n",
                        point,
                        targetThetaValue.get(0));

      inverter.evaluate(targetThetaValue.get(0),
                        1,
                        precision,
                        result);

      Real invPoint = inverter.θ.evaluate(result,
                                          2,
                                          128,
                                          Real.newVector(2));
      System.out.format("θ^(-1)(%s)=%s\n",
                        invPoint.get(0),
                        result);
    }
  }
}
