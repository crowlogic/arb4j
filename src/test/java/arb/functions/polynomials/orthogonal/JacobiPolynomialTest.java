package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.half;
import static java.lang.System.out;

import arb.Real;
import arb.RealConstants;
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

  public static void testD()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.d.evaluate(RealConstants.one, 0, 128, new Real()))
      {
        out.println("p1(1)=" + result);
      }
    }

  }
  
  public static void testP1()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(half,
                                                                      half))
    {
      try ( Real result = seq.p1.evaluate(RealConstants.one, 0, 128, new Real()))
      {
        out.println("p1(1)=" + result);
      }
    }

  }
}
