package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalFunctionTest extends
                                    TestCase
{

  public void testRationalFunctionsSetFromStringAndGetString()
  {
    String str = "3  2 5 3/8";
    try ( RationalFunction f = new RationalFunction(str))
    {
      assertEquals(str, f.toString());
    }
  }

  public void testAddRationalFunctions()
  {
    try ( var f = new RationalFunction(); var g = new RationalFunction(); var h = new RationalFunction())
    {
      f.set("3  2 5 3/8");
      g.set("1  6/7");
      f.add(g, 0, h);
      assertEquals("3  20/7 5 3/8", h.toString());
    }
  }
  
  public void testSubtractRationalFunctions()
  {
    try ( var f = new RationalFunction(); var g = new RationalFunction(); var h = new RationalFunction())
    {
      f.set("3  2 5 3/8");
      g.set("1  6/7");
      f.sub(g, 0, h);
      assertEquals("3  8/7 5 3/8", h.toString());
    }
  }

}
