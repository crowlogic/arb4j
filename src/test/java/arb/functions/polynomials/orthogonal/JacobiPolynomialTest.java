package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.*;
import static java.lang.System.out;

import arb.Real;
import junit.framework.TestCase;

/**
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

  public static void testA()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   half))
    {
      try ( Real result = seq.A.evaluate(one, 1, bits, new Real()))
      {
        out.println("A(1)=" + result);
        assertEquals(60.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testAChebyshev()
  {
    try ( var seq = new JacobiPolynomialSequence<>(negHalf,
                                                   negHalf);
          Real three = new Real("3",
                                128);)
    {
      try ( Real result = seq.A.evaluate(three, 1, bits, new Real()))
      {
        out.println("A(3)=" + result);
        assertEquals(252.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }

  }

  public static void testB()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   half))
    {
      try ( Real result = seq.B.evaluate(one, 1, bits, new Real()))
      {
        out.println("B(1)=" + result);
        assertEquals(0.0, result.doubleValue());
        assertTrue(result.isExact());
      }
    }
  }

  public static void testP1()
  {
    try ( var seq = new JacobiPolynomialSequence<>(half,
                                                   half))
    {
      try ( Real result = seq.p1.evaluate(one, 0, bits, new Real()))
      {
        // out.println("p1(1)=" + result);

        assertEquals(1.5, result.doubleValue());
      }
    }

  }
}
