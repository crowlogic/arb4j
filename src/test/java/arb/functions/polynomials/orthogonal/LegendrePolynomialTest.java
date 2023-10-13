package arb.functions.polynomials.orthogonal;

import arb.*;
import junit.framework.TestCase;

/**
 *
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class LegendrePolynomialTest extends
                                    TestCase
{

  /**
   * simple plot test
   */
  public void testEvaluate()
  {
    try ( LegendrePolynomial polynomial = new LegendrePolynomial(2);
          Real result = polynomial.evaluate(RealConstants.one, 1, 128, new Real());)
    {
      assertEquals(RealConstants.one, result);
      assertEquals(47.0 / 2.0, polynomial.eval(4));
    }

  }

}
