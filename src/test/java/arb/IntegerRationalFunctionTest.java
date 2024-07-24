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
    try ( IntegerRationalFunction three = new IntegerRationalFunction().set(3);
          IntegerRationalFunction four = new IntegerRationalFunction().set(4);
          IntegerRationalFunction seven = new IntegerRationalFunction().set(7);)
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

}
