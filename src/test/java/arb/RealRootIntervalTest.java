package arb;

import static java.lang.System.out;

import junit.framework.TestCase;

@SuppressWarnings(
{ "unused" })
public class RealRootIntervalTest extends
                                  TestCase
{

  public void testGetReal()
  {
    double           adouble  = 5;
    double           bdouble  = 10;

    RealRootInterval interval = new RealRootInterval(adouble,
                                                     bdouble);
    try ( Real real = new Real())
    {
      real.set(interval, 128);
      Real deal = interval.getReal(128, new Real());
      assertEquals(7.5, real.doubleValue(), Math.pow(bdouble, -30));
      assertEquals(2.50000000372529029846191406250, real.getRad().doubleValue(), 0);
    }

  }
}
