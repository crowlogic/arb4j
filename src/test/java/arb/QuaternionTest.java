package arb;

import static arb.RealConstants.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class QuaternionTest extends
                            TestCase
{
  final public static int bits = 128;

  public void testMultiply()
  {
    try ( Quaternion A = new Quaternion(new Complex(one,
                                                    π),
                                        new Complex(half,
                                                    two)))
    {
      Quaternion B = new Quaternion(new Complex(oneQuarter,
                                                threeQuarters),
                                    new Complex(πsquared,
                                                sqrt2));

      Quaternion C = A.mul(B, bits, new Quaternion());

      assertEquals(-9.8694238154832143, C.left.re().doubleValue());
      assertEquals(-17.496703857594721, C.left.im().doubleValue());
      assertEquals(7.0517214629309924, C.right.re().doubleValue());
      assertEquals(32.545490242672915, C.right.im().doubleValue());
    }

  }

  public void testInverse()
  {
    try ( Quaternion A = new Quaternion(new Complex(one,
                                                    π),
                                        new Complex(half,
                                                    two)))
    {
      Quaternion C = A.multiplicativeInverse(bits, new Quaternion());

      assertEquals(0.06613929660275705, C.left.re().doubleValue());
      assertEquals(-0.20778272832081793, C.left.im().doubleValue());
      assertEquals(-0.033069648301378526, C.right.re().doubleValue());
      assertEquals(-0.1322785932055141, C.right.im().doubleValue());
    }

  }

  public void testNorm()
  {
    try ( Quaternion A = new Quaternion(new Complex(one,
                                                    π),
                                        new Complex(half,
                                                    two)))
    {
      Real norm = A.norm2(128, new Real());
      assertEquals(15.119604401089358, norm.doubleValue());
    }

  }

  public void testDivision()
  {
    try ( Quaternion A = new Quaternion(new Complex(one,
                                                    π),
                                        new Complex(half,
                                                    two)))
    {
      Quaternion B = new Quaternion(new Complex(oneQuarter,
                                                threeQuarters),
                                    new Complex(πsquared,
                                                sqrt2));

      Quaternion C = A.div(B, bits, new Quaternion());

      assertEquals(0.1036588997640670229376249035765398268756, C.left.re().doubleValue());
      assertEquals(0.1906100209168533630202319028395221259323, C.left.im().doubleValue());
      assertEquals(-0.06799403475980033119355437454190412122191, C.right.re().doubleValue());
      assertEquals(-0.3153473972383108388719953679651615723469, C.right.im().doubleValue());
    }

  }

}
