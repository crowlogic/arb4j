package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexRationalFunctionTest extends
                                         TestCase
{

  private ComplexRationalFunction a;
  private ComplexRationalFunction b;
  private ComplexRationalFunction result;
  private int                     prec = 128;

  @Override
  protected void setUp() throws Exception
  {
    super.setUp();
    a      = new ComplexRationalFunction();
    b      = new ComplexRationalFunction();
    result = new ComplexRationalFunction();
  }

  @Override
  protected void tearDown() throws Exception
  {
    a.close();
    b.close();
    result.close();
    super.tearDown();
  }

  public void testAdditiveIdentity()
  {
    a.additiveIdentity();
    assertTrue(a.realPart.isZero());
    assertTrue(a.imaginaryPart.isZero());
  }

  public void testMultiplicativeIdentity()
  {
    a.multiplicativeIdentity();
    assertTrue(a.realPart.isOne());
    assertTrue(a.imaginaryPart.isZero());
  }

  public void testAdd()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.add(b, prec, result);
    assertEquals("4 + 6i", result.toString());
  }

  public void testAddWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.add(b, prec, result);
    assertEquals("4 + 2i", result.toString());
  }

  public void testAddInteger()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    var b = new Integer(3);
    a.add(b, prec, result);
    assertEquals("4 + 2i", result.toString());
  }

  public void testSub()
  {
    a.realPart.set(5);
    a.imaginaryPart.set(7);
    b.realPart.set(2);
    b.imaginaryPart.set(3);
    a.sub(b, prec, result);
    assertEquals("3 + 4i", result.toString());
  }

  public void testSubWithNegativeImaginary()
  {
    a.realPart.set(5);
    a.imaginaryPart.set(-7);
    b.realPart.set(2);
    b.imaginaryPart.set(3);
    a.sub(b, prec, result);
    assertEquals("3 + (-10)i", result.toString());
  }

  public void testMul()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.mul(b, prec, result);
    assertEquals("-5 + 10i", result.toString());
  }

  public void testMulWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.mul(b, prec, result);
    assertEquals("11 + (-2)i", result.toString());
  }

  public void testDiv()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.div(b, prec, result);
    // The exact result should be (11 + 2i) / 25
    assertTrue(result.realPart.evaluate(new Fraction(), 0, prec, new Fraction())
                              .equals(new Fraction(11,
                                                   25)));
    assertTrue(result.imaginaryPart.evaluate(new Fraction(), 0, prec, new Fraction())
                                   .equals(new Fraction(2,
                                                        25)));
  }

  public void testDivWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    b.realPart.set(3);
    b.imaginaryPart.set(4);
    a.div(b, prec, result);
    assertEquals("-1/5 + (-2/5)i", result.toString() );
//    // The exact result should be (5 - 10i) / 25
//    assertEquals(result.realPart.evaluate(new Fraction(), 0, prec, new Fraction()),
//                 (new Fraction(5,
//                               25)));
//    assertEquals(result.imaginaryPart.evaluate(new Fraction(), 0, prec, new Fraction()),
//                 (new Fraction(-10,
//                               25)));
  }

  public void testMulInt()
  {
    a.realPart.set(2);
    a.imaginaryPart.set(3);
    a.mul(2, prec, result);
    assertEquals("4 + 6i", result.toString());
  }

  public void testDivInt()
  {
    a.realPart.set(4);
    a.imaginaryPart.set(6);
    a.div(2, prec, result);
    assertEquals("2 + 3i", result.toString());
  }

  public void testEvaluate()
  {
    a.realPart.set("x + 1");
    a.imaginaryPart.set("x - 1");
    ComplexFraction input = new ComplexFraction();
    input.realPart.set(2);
    input.imaginaryPart.set(1);
    
    ComplexFraction output = new ComplexFraction();
    a.evaluate(input, 0, prec, output);
    System.out.format("%s @ x=%s = %s\n", a, input, output );
    assertEquals(2, output.realPart.getNumerator().getSignedValue());
    assertEquals(1, output.realPart.getDenominator().getSignedValue());
    assertEquals(2, output.imaginaryPart.getNumerator().getSignedValue());
    assertEquals(1, output.imaginaryPart.getDenominator().getSignedValue());
  }

  public void testEvaluateWithNegativeImaginary()
  {
    
    a.realPart.set("x + 1");
    a.imaginaryPart.set("1-x");
    ComplexFraction input = new ComplexFraction();
    input.realPart.set(2);
    input.imaginaryPart.set(-1);
    ComplexFraction output = new ComplexFraction();
    a.evaluate(input, 0, prec, output);
    //System.out.format("%s with x=%s = %s\n", a, input, output);
    assertEquals(2, output.realPart.getNumerator().getSignedValue());
    assertEquals(1, output.realPart.getDenominator().getSignedValue());
    assertEquals(-2, output.imaginaryPart.getNumerator().getSignedValue());
    assertEquals(1, output.imaginaryPart.getDenominator().getSignedValue());
  }

  public void testVerify()
  {
    assertTrue(a.verify());
  }

  public void testToString()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(2);
    assertEquals("1 + 2i", a.toString());
  }

  public void testToStringWithNegativeImaginary()
  {
    a.realPart.set(1);
    a.imaginaryPart.set(-2);
    assertEquals("1 + (-2)i", a.toString());
  }
}