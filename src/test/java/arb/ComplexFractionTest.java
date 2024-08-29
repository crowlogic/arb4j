package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFractionTest extends
                                 TestCase
{
  @SuppressWarnings("resource")
  public void testArraySet()
  {
    ComplexFraction f = new ComplexFraction();
    ComplexFraction a = new ComplexFraction().set("7⁄8");
    ComplexFraction b = new ComplexFraction().set("1⁄4+ⅈ");
    f.set(a, b);
    assertEquals("[(7⁄8)+(0)i, (1⁄4)+(1)i]",f.toString());
  }
  
  @SuppressWarnings("resource")
  public void testArraySetAndBecome()
  {
    ComplexFraction f = new ComplexFraction();
    ComplexFraction a = new ComplexFraction().set("7⁄8");
    ComplexFraction b = new ComplexFraction().set("1⁄4+ⅈ");
    f.set(a, b);
    assertEquals("[(7⁄8)+(0)i, (1⁄4)+(1)i]",f.toString());
    ComplexFraction g = new ComplexFraction().become(f);
    assertEquals("[(7⁄8)+(0)i, (1⁄4)+(1)i]",g.toString());    
    assertEquals( 16, Fraction.BYTES);
   //f.realPart.res
    //g.resize(1);
  }

  

  @SuppressWarnings("resource")
  public void testSet()
  {
    ComplexFraction a = new ComplexFraction().set("7/8");
    ComplexFraction b = new ComplexFraction().set("1/4");
    assertFalse(a.equals(b));
    b.set(a);
    assertTrue(a + "!=" + b, a.equals(b));
    assertTrue(a.getNumerator() + " != " + b.getNumerator(),
               b.getNumerator().equals(a.getNumerator()));
    assertTrue(b.getDenominator().equals(a.getDenominator()));

  }

  @SuppressWarnings("resource")
  public void testDiv()
  {
    ComplexFraction a      = new ComplexFraction("7⁄8+2*ⅈ");
    ComplexFraction b      = new ComplexFraction("1⁄4+ⅈ");
    ComplexFraction aOverB = a.div(b, new ComplexFraction());
    assertEquals("(71⁄34)+(-6⁄17)i", aOverB.toString());
  }

  @SuppressWarnings("resource")
  public void testAdd()
  {
    ComplexFraction a      = new ComplexFraction("7⁄8+2*ⅈ");
    ComplexFraction b      = new ComplexFraction("1⁄4+ⅈ");
    ComplexFraction aOverB = a.add(b, new ComplexFraction());
    assertEquals("(9⁄8)+(3)i", aOverB.toString());
  }

  @SuppressWarnings("resource")
  public void testSub()
  {
    ComplexFraction a      = new ComplexFraction("7⁄8+2*ⅈ");
    ComplexFraction b      = new ComplexFraction("1⁄4+ⅈ");
    ComplexFraction aOverB = a.sub(b, new ComplexFraction());
    assertEquals("(5⁄8)+(1)i", aOverB.toString());
  }

  @SuppressWarnings("resource")
  public void testMul()
  {
    ComplexFraction a      = new ComplexFraction("7⁄8+2*ⅈ");
    ComplexFraction b      = new ComplexFraction("1⁄4+ⅈ");
    ComplexFraction aOverB = a.mul(b, new ComplexFraction());
    assertEquals("(-57⁄32)+(11⁄8)i", aOverB.toString());
  }

}
