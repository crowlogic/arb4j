package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.half;
import static arb.RealConstants.one;

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

  public static void testD()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.d.evaluate(one, 0, bits, new Real()))
      {
        // out.println("d(1)=" + result);

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
