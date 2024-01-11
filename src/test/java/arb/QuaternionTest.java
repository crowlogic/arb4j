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
    
    assertEquals(-9.8694238154832143, C.left.real.doubleValue());
    assertEquals(-17.496703857594721, C.left.imag.doubleValue());
    assertEquals(7.0517214629309924, C.right.real.doubleValue());
    assertEquals(32.545490242672915, C.right.imag.doubleValue());

  }
//  
//  public void testDivision()
//  {
//    Quaternion A = new Quaternion(new Complex(one,
//                                              π),
//                                  new Complex(half,
//                                              two));
//
//    Quaternion B = new Quaternion(new Complex(oneQuarter,
//                                              threeQuarters),
//                                  new Complex(πsquared,
//                                              sqrt2));
//    
//    Quaternion C = A.div(B, bits, new Quaternion());
//
//    System.out.format("A=%s\nB=%s\nC=A/B=%s\n", A, B, C);
//    
//    assertEquals(-9.8694238154832143, C.left.real.doubleValue());
//    assertEquals(-17.496703857594721, C.left.imag.doubleValue());
//    assertEquals(7.0517214629309924, C.right.real.doubleValue());
//    assertEquals(32.545490242672915, C.right.imag.doubleValue());
//
//  }
  
}
