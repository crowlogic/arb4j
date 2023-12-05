package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.half;
import static arb.RealConstants.one;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.ASM10_EXPERIMENTAL;

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
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.A.evaluate(one, 1, bits, new Real()))
      {
        out.println("A(1)=" + result);
        assertEquals(60.0, result.doubleValue());
        assertTrue( result.isExact() );
      }
    }

  }
  
  public static void testB()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.B.evaluate(one, 1, bits, new Real()))
      {
        out.println("B(1)=" + result);
       // assertEquals(60.0, result.doubleValue());
       // assertTrue( result.isExact() );
      }
    }

  }

  public static void testC()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.C.evaluate(one, 1, bits, new Real()))
      {
        out.println("C(1)=" + result);
       // assertEquals(60.0, result.doubleValue());
       // assertTrue( result.isExact() );
      }
    }

  }
  
  public static void testa()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.a.evaluate(one, 1, bits, new Real()))
      {
        out.println("a(1)=" + result);

        assertEquals(0.33333333333333333333333333333, result.doubleValue());
      }
    }

  }

  public static void testb()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.b.evaluate(one, 1, bits, new Real()))
      {
        out.println("b(1)=" + result);

        assertEquals(2.0, result.doubleValue());
      }
    }

  }

  public static void testc()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.c.evaluate(one, 1, bits, new Real()))
      {
        out.println("c(1)=" + result);

        assertEquals(0.666666666666666666666666, result.doubleValue());
      }
    }

  }

  public static void testd()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.d.evaluate(one, 1, bits, new Real()))
      {
        out.println("d(1)=" + result);

        assertEquals(3.0, result.doubleValue());
      }
    }

  }

  public static void testP1()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
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
