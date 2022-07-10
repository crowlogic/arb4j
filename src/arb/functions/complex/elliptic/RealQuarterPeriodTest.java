package arb.functions.complex.elliptic;

import arb.*;
import junit.framework.*;

public class RealQuarterPeriodTest extends
                                   TestCase
{
  public static void testLemniscateConstant()
  {
    RealQuarterPeriod rqp = new RealQuarterPeriod();
    /**
     * Also tested in ComplexFunctionTest
     */
    try ( Complex negone = new Complex(); Complex lemniscateConstant = new Complex())
    {

      lemniscateConstant.getReal().set("2.62205755429211981046483958989111941368275495 +/- 2.5597e-76", 256);
      negone.getReal().set(-1);
      Complex s = rqp.evaluate(negone, 1, 256, new Complex());
      s.mul(2, 256, s);
      s.printPrecision                  = true;
      lemniscateConstant.printPrecision = true;
      double sval = s.getReal().getMid().doubleValue();
      double lval = lemniscateConstant.getReal().getMid().doubleValue();
      assertEquals(sval, lval, Math.pow(10, -17));
    }
  }
}
