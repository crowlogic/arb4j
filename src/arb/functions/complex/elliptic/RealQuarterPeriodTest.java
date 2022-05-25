package arb.functions.complex.elliptic;

import arb.*;
import junit.framework.*;

public class RealQuarterPeriodTest extends
                                   TestCase
{
  public static void testLemniscateConstant()
  {
    RealQuarterPeriod rqp = new RealQuarterPeriod();
    Complex s = rqp.evaluate(new Complex().set(Constants.ZERO.getReal(), Constants.ONE), 1, 256, new Complex() );
    
    System.out.println("s="+ s );
  }
}
