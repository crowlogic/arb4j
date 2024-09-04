package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerPolynomialTest extends
                                   TestCase
{
  int bits = 128;

  public void testAddRealFromIntegerWithIntegerPolynomialResult()
  {
    try ( var y = new Real("3.0",
                           128);
          var n = new Integer(4); var r = n.add(y, bits, new IntegerPolynomial());)
    {
      assertEquals("7", r.toString());
    }
  }

  public void testIdentity()
  {
    try ( var x = new IntegerPolynomial())
    {
      assertEquals("0", x.toString());
      x.identity();
      assertEquals("x", x.toString());
    }
  }

  public void testSet()
  {
    try ( var x = new IntegerPolynomial())
    {
      x.set("4-3*x+4*x^3+2*x^2");
      assertEquals("4*x^3+2*x^2-3*x+4", x.toString());
    }
  }

  public void testEval()
  {
    try ( var x = new IntegerPolynomial(); Integer y = new Integer(); Integer z = new Integer(5))
    {
      assertEquals(539, x.set("4-3*x+4*x^3+2*x^2").evaluate(z, 128, y).getSignedValue());
    }
  }

  public void testAssertSimpleToString()
  {
    try ( IntegerPolynomial p = new IntegerPolynomial())
    {
      p.set(3);
      assertEquals("3", p.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testAdd()
  {
    try ( IntegerPolynomial three = new IntegerPolynomial().set(3);
          IntegerPolynomial four = new IntegerPolynomial().set(4);
          IntegerPolynomial seven = new IntegerPolynomial().set(7);)
    {
      three.add(four, seven);
      assertEquals("7", seven.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testSub()
  {
    try ( IntegerPolynomial a = new IntegerPolynomial().set(10);
          IntegerPolynomial b = new IntegerPolynomial().set(3);
          IntegerPolynomial result = new IntegerPolynomial();)
    {
      a.sub(b, 128, result);
      assertEquals("7", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMul()
  {

    try ( IntegerPolynomial three = new IntegerPolynomial().set(3);
          IntegerPolynomial four = new IntegerPolynomial().set(4);
          IntegerPolynomial result = new IntegerPolynomial().set(7);)
    {
      three.mul(four, result);
      assertEquals("12", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testDiv()
  {

    try ( IntegerPolynomial three = new IntegerPolynomial().set(3);
          IntegerPolynomial four = new IntegerPolynomial().set(4);
          IntegerPolynomial result = new IntegerPolynomial().set(7);)
    {
      three.div(four, result);
      assertEquals("0", result.toString());
    }
  }

}
