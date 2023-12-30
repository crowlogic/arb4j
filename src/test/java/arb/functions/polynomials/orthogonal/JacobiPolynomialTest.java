package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.*;
import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import junit.framework.TestCase;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class JacobiPolynomialTest extends
                                  TestCase
{

  public static final int bits = 128;

  public static final int N    = 3;

  public static void testA()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   negHalf,
                                                   N);
          Real threeHalves = new Real("1.5",
                                      128);
          Integer n = new Integer())
    {

      try ( RealPolynomial result = seq.A.evaluate(n, 1, bits, new RealPolynomial()))
      {
        out.println("A(3,1.5)=" + result);
        assertEquals(45.0, result.eval(threeHalves.doubleValue()));
      }
    }

  }

  public static void testE()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   negHalf,
                                                   N))
    {
      try ( Real result = seq.E.evaluate(new Real("3",
                                                  128),
                                         1,
                                         bits,
                                         new Real()))
      {
        out.println("E(3)=" + result);
        assertEquals(18.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testB()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   oneQuarter,
                                                   N))
    {
      one.set(1);

      try ( Real result = seq.B.evaluate(one, 1, bits, new Real()))
      {
        out.println("B(1)=" + result);
        assertEquals(0.34375, result.doubleValue());
        assertTrue(result.isExact());
      }
    }
  }

  public static void testC()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   oneQuarter,
                                                   N))
    {
      one.set(1);
      try ( Real result = seq.C.evaluate(RealConstants.one, 1, bits, new Real()))
      {
        out.println("C(1)=" + result);
        assertEquals(2.75, result.doubleValue());
        assertTrue(result.isExact());
      }
    }
  }

  public static void testF()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   threeQuarters,
                                                   N);)
    {
      Integer one = new Integer();

      try ( Real result = seq.F.evaluate(one, 1, bits, new Real()))
      {
        out.println("F(1)=" + result);
        assertEquals(0.5625, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testG()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   threeQuarters,
                                                   N))
    {
      assertEquals(-.3125, seq.G.doubleValue());
    }
  }

  public static void testP1()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   negHalf,
                                                   N))
    {
      try ( Real result = seq.p1.evaluate(one, 0, bits, new Real()))
      {
        out.println("p1(1)=" + result);

        assertEquals(0.5, result.doubleValue());
      }
    }

  }
}
