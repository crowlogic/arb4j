package arb;

import junit.framework.TestCase;

public class QuaternionTest extends
                            TestCase
{
  public void testMultiply()
  {
    Complex    a = new Complex(RealConstants.one,
                               RealConstants.π);
    Complex    b = new Complex(RealConstants.half,
                               RealConstants.two);
    Quaternion A = new Quaternion(a,
                                  b);
    Complex    c = new Complex(RealConstants.oneQuarter,
                               RealConstants.threeQuarters);
    Complex    d = new Complex(RealConstants.πsquared,
                               RealConstants.sqrt2);
    Quaternion B = new Quaternion(c,
                                  d);
    Quaternion C = A.mul(B, 512, new Quaternion());

    assertEquals(-9.8694238154832143, C.left.real.doubleValue());
    assertEquals(-17.496703857594721, C.left.imag.doubleValue());
    assertEquals(7.0517214629309924, C.right.real.doubleValue());
    assertEquals(32.545490242672915, C.right.imag.doubleValue());
  }
}
