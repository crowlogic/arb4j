package arb;

import static arb.RealConstants.*;

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
  public void testMultiply()
  {
    Complex    a = new Complex(one,
                               π);
    Complex    b = new Complex(half,
                               two);
    Quaternion A = new Quaternion(a,
                                  b);
    Complex    c = new Complex(oneQuarter,
                               threeQuarters);
    Complex    d = new Complex(πsquared,
                               sqrt2);
    Quaternion B = new Quaternion(c,
                                  d);
    Quaternion C = A.mul(B, 512, new Quaternion());

    System.out.format("A=%s\nB=%s\nC=A*B=%s\n", A, B, C);
    assertEquals(-9.8694238154832143, C.left.real.doubleValue());
    assertEquals(-17.496703857594721, C.left.imag.doubleValue());
    assertEquals(7.0517214629309924, C.right.real.doubleValue());
    assertEquals(32.545490242672915, C.right.imag.doubleValue());

  }
}
