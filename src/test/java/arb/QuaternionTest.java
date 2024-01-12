package arb;

import static arb.RealConstants.half;
import static arb.RealConstants.one;
import static arb.RealConstants.oneQuarter;
import static arb.RealConstants.sqrt2;
import static arb.RealConstants.threeQuarters;
import static arb.RealConstants.two;
import static arb.RealConstants.π;
import static arb.RealConstants.πsquared;

import junit.framework.TestCase;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class QuaternionTest extends
                            TestCase
{
  final public static int bits = 128;

  public void testMultiply()
  {
    Quaternion A = new Quaternion(new Complex(one,
                                              π),
                                  new Complex(half,
                                              two));

    Quaternion B = new Quaternion(new Complex(oneQuarter,
                                              threeQuarters),
                                  new Complex(πsquared,
                                              sqrt2));

    Quaternion C = A.mul(B, bits, new Quaternion());

    System.out.format("A=%s\nB=%s\nC=A*B=%s\n", A, B, C);

    assertEquals(-9.8694238154832143, C.left.re().doubleValue());
    assertEquals(-17.496703857594721, C.left.im().doubleValue());
    assertEquals(7.0517214629309924, C.right.re().doubleValue());
    assertEquals(32.545490242672915, C.right.im().doubleValue());

  }

  public void testInverse()
  {
    Quaternion A = new Quaternion(new Complex(one,
                                              π),
                                  new Complex(half,
                                              two));

    Quaternion C = A.multiplicativeInverse(bits, new Quaternion());

    assertEquals(0.06613929660275705, C.left.re().doubleValue());
    assertEquals(-0.20778272832081793, C.left.im().doubleValue());
    assertEquals(-0.033069648301378526, C.right.re().doubleValue());
    assertEquals(-0.1322785932055141, C.right.im().doubleValue());

  }

  public void testNorm()
  {
    Quaternion A    = new Quaternion(new Complex(one,
                                                 π),
                                     new Complex(half,
                                                 two));
    Real       norm = A.norm2(128, new Real());
    assertEquals(15.119604401089358, norm.doubleValue());

  }

  public void testMulInv()
  {
    Quaternion A = new Quaternion(new Complex(oneQuarter,
                                              threeQuarters),
                                  new Complex(πsquared,
                                              sqrt2));
    Quaternion norm = A.multiplicativeInverse(bits, new Quaternion());
    System.out.println("norm=" + norm);

  }

  public void testDivision()
  {
    Quaternion A = new Quaternion(new Complex(one,
                                              π),
                                  new Complex(half,
                                              two));

    Quaternion B = new Quaternion(new Complex(oneQuarter,
                                              threeQuarters),
                                  new Complex(πsquared,
                                              sqrt2));

    System.out.format("A=%s\nB=%s\n", A, B);

    Quaternion C = A.div(B, bits, new Quaternion());

    System.out.format("A=%s\nB=%s\nC=A/B=%s\n", A, B, C);

    assertEquals(0.1036588997640670229376249035765398268756, C.left.re().doubleValue());
    assertEquals(0.1906100209168533630202319028395221259323, C.left.im().doubleValue());
    assertEquals(-0.06799403475980033119355437454190412122191, C.right.re().doubleValue());
    assertEquals(-0.3153473972383108388719953679651615723469, C.right.im().doubleValue());

  }

}
