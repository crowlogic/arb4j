package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.half;
import static arb.RealConstants.negHalf;
import static arb.RealConstants.one;
import static arb.RealConstants.oneQuarter;
import static arb.RealConstants.threeQuarters;
import static java.lang.System.out;

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

  JacobiPolynomialSequence seq  = new JacobiPolynomialSequence(negHalf,
                                                               negHalf);
  public static final int  bits = 128;

  public static final int  N    = 3;

  public static void main( String args[])
  {
    JacobiPolynomialTest test = new JacobiPolynomialTest();
    test.testA();
  }
  public  void testA()
  {
    try (
          Real threeHalves = new Real("1.5",
                                      128);
          Integer n = new Integer())
    {
      n.set("3");

      try ( RealPolynomial result = seq.A.evaluate(n, 1, bits, new RealPolynomial()))
      {
        assertEquals(45.0, result.eval(threeHalves.doubleValue()));
      }
    }

  }

  public void testE()
  {
    {
      try ( Real result = seq.E.evaluate(new Real("3",
                                                  128),
                                         1,
                                         bits,
                                         new Real()))
      {
        assertEquals(18.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

//
  public static void testB()
  {
    try ( var seq = new JacobiPolynomialSequence(half,
                                                 oneQuarter))
    {

      try ( Real result = seq.B.evaluate(one, 1, bits, new Real()))
      {
        assertEquals(0.34375, result.doubleValue());
        assertTrue(result.isExact());
      }
    }
  }

  public static void testC()
  {
    try ( var seq = new JacobiPolynomialSequence(half,
                                                 oneQuarter))
    {
      try ( Real result = seq.C.evaluate(RealConstants.one, 1, bits, new Real()))
      {
        assertEquals(2.75, result.doubleValue());
        assertTrue(result.isExact());
      }
    }
  }

  public static void testF()
  {
    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 threeQuarters);)
    {
      Integer one = new Integer("1");

      try ( Real result = seq.F.evaluate(one, 1, bits, new Real()))
      {
        assertEquals(0.5625, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testG()
  {
    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 threeQuarters))
    {
      assertEquals(-.3125, seq.G.evaluate(null, 0, 128, new Real()).doubleValue());
    }
  }

  public static void
         testP() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, SecurityException
  {

    var seq = new JacobiPolynomialSequence(negHalf,
                                           negHalf);
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

  
    {
      Integer won = new Integer("1");

      try ( RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
      {
        // P(-half,-half)=ChebyshevType1 and when n=1 it equals x/2
        Real a = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(RealConstants.half, a);
        Real b = result.evaluate(RealConstants.half, 128, new Real());
        assertEquals(RealConstants.oneQuarter, b);
      }
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
        System.out.format("P(2.1)=%s\nP(2,2=%s)\n", valAtOne, valAtTwo);
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
        out.println("p(3,x)=" + result);
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.375, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(2.625, valAtTwo.doubleValue());

      }
    }

  }
}
