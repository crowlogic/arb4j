package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * The set of rational functions over a field K is a field, the field of
 * fractions of the ring of the polynomial functions over K.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalFunctionTest
                                      extends
                                      TestCase
{

  public void testReduce()
  {
    try ( RealRationalFunction f = new RealRationalFunction())
    {
      f.value.remainder = new RealPolynomial();
      f.value.remainder.set(1);
      f.value.remainder.shiftLeft(2);
      f.value.divisor = new RealPolynomial();
      f.value.divisor.set(1);
      f.value.divisor.shiftLeft(2);
      // System.out.println("f=" + f);
      assertEquals(1.0, f.eval(2.3));

      f.reduce(128);
      // System.out.println("f=" + f);
      assertEquals(1.0, f.eval(2.3));
    }
  }

  public void testDivisionWithRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xOverXSquared = new RealRationalFunction();
      x.div(xSquared, 128, xOverXSquared);

      assertEquals(x.value, xOverXSquared.value.remainder);
      assertEquals(xSquared.value, xOverXSquared.value.divisor);
      assertTrue(xOverXSquared.value.isZero());
    }
  }

  public void testAddXPlusXSquaredWithNoRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xPlusXSquared = new RealRationalFunction();
      x.add(xSquared, 128, xPlusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(1, 1);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xPlusXSquared.value);
      assertEquals(xPlusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xPlusXSquared.value.remainder.isZero());
    }
  }

  public void testAddXPlusXSquaredWithRemainderOnLHS()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);
      x.value.setRemainder(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xPlusXSquared = new RealRationalFunction();
      x.add(xSquared, 128, xPlusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(1, 1);
      shouldBe.set(2, 1);
      assertEquals(shouldBe, xPlusXSquared.value);
      assertEquals(xPlusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xPlusXSquared.value.remainder.equals(RealPolynomialConstants.one));
    }
  }

  public void testSubtractionWithoutRemainder()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xMinusXSquared = new RealRationalFunction();
      x.sub(xSquared, 128, xMinusXSquared);

      RealPolynomial shouldBe = new RealPolynomial(2);
      shouldBe.set(1, 1);
      shouldBe.set(2, -1);
      assertEquals(shouldBe, xMinusXSquared.value);
      assertEquals(xMinusXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xMinusXSquared.value.remainder.isZero());
    }
  }

  public void testMul()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xTimesXSquared = new RealRationalFunction();
      x.mul(xSquared, 128, xTimesXSquared);

      RealPolynomial shouldBe = new RealPolynomial(3);
      shouldBe.set(3, 1);
      assertEquals(shouldBe, xTimesXSquared.value);
      assertEquals(xTimesXSquared.value.divisor, RealPolynomialConstants.one);
      assertTrue(xTimesXSquared.value.remainder.isZero());
    }
  }

  public void testMulWithRemainderOnLHS()
  {
    try ( RealRationalFunction x = new RealRationalFunction())
    {
      x.value.set(1).shiftLeft(1);
      x.value.setRemainder(1);
      x.value.setDivisor(1);

      RealRationalFunction xSquared = new RealRationalFunction();
      xSquared.value.set(1).shiftLeft(2);

      RealRationalFunction xTimesXSquared = new RealRationalFunction();
      x.mul(xSquared, 128, xTimesXSquared);

      RealPolynomial xCubed = new RealPolynomial(3);
      xCubed.set(3, 1);

      assertEquals(xCubed, xTimesXSquared.value);
      assertEquals(xTimesXSquared.value.divisor, RealPolynomialConstants.one);
      assertEquals(xSquared.value, xTimesXSquared.value.remainder);
      assertEquals(xCubed, xTimesXSquared.value);
    }

  }

}
