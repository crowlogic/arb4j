package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerRationalFunctionTest
                                         extends
                                         TestCase
{

  @SuppressWarnings("resource")
  public void testAdd()
  {
    try ( var three = new IntegerRationalFunction().set(3); var four = new IntegerRationalFunction().set(4);
          var seven = new IntegerRationalFunction().set(7);)
    {
      three.add(four, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testInitAndToString()
  {
    IntegerRationalFunction f           = new IntegerRationalFunction();

    IntegerPolynomial       numerator   = f.getNumerator();

    IntegerPolynomial       denominator = f.getDenominator();
    assertEquals("0", numerator.toString());
    assertEquals("1", denominator.toString());

  }

  @SuppressWarnings("resource")
  public void testSub()
  {
    try ( var a = new IntegerRationalFunction().set(10); var b = new IntegerRationalFunction().set(3);
          var result = new IntegerRationalFunction();)
    {
      a.sub(b, 128, result);
      assertEquals("7", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMul()
  {

    try ( var three = new IntegerRationalFunction().set(3); var four = new IntegerRationalFunction().set(4);
          var result = new IntegerRationalFunction().set(7);)
    {
      three.mul(four, result);
      assertEquals("12", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testDiv()
  {

    try ( var three = new IntegerRationalFunction().set(3); var four = new IntegerRationalFunction().set(4);
          var result = new IntegerRationalFunction().set(7);)
    {
      three.div(four, result);
      assertEquals("0", result.toString());
    }
  }

}
