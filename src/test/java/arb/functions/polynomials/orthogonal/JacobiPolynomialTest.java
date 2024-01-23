package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.negHalf;

import java.lang.reflect.InvocationTargetException;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import junit.framework.TestCase;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class JacobiPolynomialTest extends
                                  TestCase
{

  public static final int bits = 128;

  public static final int N    = 3;

  public static void
         testP() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, SecurityException
  {

    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf))
    {

      Integer won = new Integer("1");

      try ( RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
      {
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(RealConstants.half, valAtOne);
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());

        assertEquals(RealConstants.one, valAtTwo);

      }

    }

  }

  public static void testP0()
  {

    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf))
    {
      Integer won = new Integer("0");

      try ( RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
      {
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(RealConstants.one, valAtOne);
        Real valAtPi = result.evaluate(RealConstants.π, 128, new Real());
        assertEquals(RealConstants.one, valAtPi);
      }
    }

  }

  public void testP1()
  {

    try ( Integer won = new Integer("1"); JacobiPolynomialSequence seq = new JacobiPolynomialSequence(negHalf,
                                                                                                      negHalf);
          RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
    {
      // P(-half,-half)=ChebyshevType1 and when n=1 it equals x/2
      Real a = result.evaluate(RealConstants.one, 128, new Real());
      assertEquals(RealConstants.half, a);
      Real b = result.evaluate(RealConstants.half, 128, new Real());
      assertEquals(RealConstants.oneQuarter, b);

    }

  }

  public static void testP2()
  {
    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf))
    {
      Integer too = new Integer("2");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.375, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(2.625, valAtTwo.doubleValue());

      }
    }

  }

  public static void testP3()
  {

    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf))
    {
      Integer too = new Integer("3");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.3125, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(8.125, valAtTwo.doubleValue());

      }
    }

  }

  public static void testP4()
  {

    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf))
    {
      Integer too = new Integer("4");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.2734375, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(26.5234375, valAtTwo.doubleValue());

      }
    }

  }
}
