package arb;

import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerPolynomialTest
                                   extends
                                   TestCase
{
  public void testAdd()
  { 

    try ( Integer three = new Integer(3); Integer four = new Integer(4); Integer seven = new Integer(7); )
    {
      three.add(four,  seven);
      assertEquals("7", seven.toString());
      //p.add(p, p);
    }
  }
}
