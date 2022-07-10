package arb.functions.real;

import arb.*;
import junit.framework.*;

public class AbsoluteValueTest extends
                               TestCase
{
  @SuppressWarnings("resource")
  public static void testAbsReal()
  {
    AbsoluteValue<Real> absValFunc = new AbsoluteValue<>();
    Real negOne = new Real().one();
    negOne.negate(negOne);
    
    Real abs = absValFunc.evaluate(negOne, 1, 128, new Real());
    assertEquals( 1, abs.doubleValue(), 0 );    
  }
  
  @SuppressWarnings("resource")
  public static void testAbsComplex()
  {
    AbsoluteValue<Complex> absValFunc = new AbsoluteValue<>();
    Complex negOne = new Complex().one();
    negOne.negate(negOne);
    
    Real abs = absValFunc.evaluate(negOne, 1, 128, new Real());
    assertEquals( 1, abs.doubleValue(), 0 );
    
  }

}
