package arb;

import static java.lang.System.out;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
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
  public void testAssertSimpleToString()
  {
    IntegerPolynomial p = new IntegerPolynomial();
    p.set(3);
    assertEquals("3",p.toString());
  }
  
  public void testAdd()
  {
   assert false : "do"; 
  }

  public void testSub()
  {
    assert false : "do";     
  }

  
  public void testMul()
  {
    assert false : "do";     
  }

  
  public void testDiv()
  {
    assert false : "do";     
  }

  
}
