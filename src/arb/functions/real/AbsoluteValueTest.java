package arb.functions.real;

import arb.Real;
import junit.framework.TestCase;

public class AbsoluteValueTest extends
                               TestCase
{
  public static void testAbs()
  {
    AbsoluteValue<Real> realAbs = new AbsoluteValue<>();
    Real negOne = new Real().one();
    negOne.negate(negOne);
    Real abs = realAbs.evaluate(negOne, 1, 128, new Real());
    System.out.println( "abs=" + abs );
    
  }
}
