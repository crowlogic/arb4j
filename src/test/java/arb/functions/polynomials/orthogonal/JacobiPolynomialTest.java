package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.*;
import static java.lang.System.out;

import arb.Real;
import arb.RealConstants;
import junit.framework.TestCase;

/**
 * https://github.com/crowlogic/arb4j/issues/254
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
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
                                      128);)
    {
      seq.n.set(3);
      try ( Real result = seq.A.evaluate(threeHalves, 1, bits, new Real()))
      {
        out.println("A(3,1.5)=" + result);
        assertEquals(45.0, result.doubleValue());
      }
    }

  }

  public static void testE()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   negHalf,
                                                   N);
          Real three = new Real("3",
                                128);)
    {
      try ( Real result = seq.E.evaluate(three, 1, bits, new Real()))
      {
        out.println("E(3)=" + result);
        assertEquals(5.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testB()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   RealConstants.oneQuarter,
                                                   N))
    {
      try ( Real result = seq.B.evaluate(one, 1, bits, new Real()))
      {
        out.println("B(1)=" + result);
        assertEquals(0.0, result.doubleValue());
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
      try ( Real result = seq.C.evaluate(one, 1, bits, new Real()))
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
                                                   N))
    {
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
      assertEquals(0, seq.G.doubleValue());
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
