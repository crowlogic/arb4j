package arb;

import static java.lang.System.out;

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
    RealRationalFunction f = new RealRationalFunction();
    f.value.remainder = new RealPolynomial();
    f.value.remainder.set(1);
    f.value.remainder.shiftLeft(2);
    f.value.divisor = new RealPolynomial();
    f.value.divisor.set(1);
    f.value.divisor.shiftLeft(2);
    //System.out.println("f=" + f);
    assertEquals(1.0, f.eval(2.3));

    f.reduce(128);
    //System.out.println("f=" + f);
    assertEquals(1.0, f.eval(2.3));
  }

  /**
   * Tests the division of x by x^2. This should result in a quotient of 0 and a
   * remainder of x.
   * 
   * ** The `reduce` Method:** The purpose of the `reduce` method is to simplify
   * the rational function by performing polynomial long division and updating the
   * `value` and `remainder` fields accordingly. This does not necessarily reduce
   * the function to its simplest possible form in every case, but rather aims to
   * put it into a standard representation where the degree of the remainder is
   * less than the degree of the divisor. -
   * 
   * **Expected Behavior for x/x²:** In the case of dividing `x` by `x²`, the
   * result you are getting (`RealRationalFunction[name=null, value=∅,
   * remainder=x, divisor=x²]`) is correct and expected. This is because the
   * quotient of this division is 0, and the remainder is `x`.
   * 
   * Why This Is Correct:**
   * 
   * **Mathematical Representation:** The output `RealRationalFunction[name=null,
   * value=∅, remainder=x, divisor=x²]` represents the rational function 0 + (x /
   * x²). This is a valid and accurate representation of the result of the
   * division. -
   * 
   * **Further Simplification:** While this can be simplified to 1/x, your
   * `reduce` method is not designed to perform that type of simplification. It
   * focuses on polynomial long division to ensure that the degree of the
   * remainder is less than the degree of the divisor. Additional
   * Considerations:**
   * 
   * **Explicit Simplification:** If you want to automatically simplify the result
   * to 1/x, you would need to add additional logic to your `reduce` method. This
   * would likely involve finding the greatest common divisor (GCD) of the
   * numerator and denominator and dividing both by it. However, this might not
   * always be desired behavior, depending on your specific use case.
   *
   * Conclusion:**
   * 
   * The output you're getting is correct given the current implementation of your
   * `reduce` method. If you want further simplification (like reducing x/x² to
   * 1/x), you would need to modify the `reduce` method to include GCD-based
   * simplification.
   * 
   * 
   */
  public void testDivisionWithRemainder()
  {
    RealRationalFunction x = new RealRationalFunction();
    x.value.set(1).shiftLeft(1);

    RealRationalFunction xSquared = new RealRationalFunction();
    xSquared.value.set(1).shiftLeft(2);


    RealRationalFunction xOverXSquared = new RealRationalFunction();
    x.div(xSquared, 128, xOverXSquared);

    assertEquals(x.value, xOverXSquared.value.remainder);
    assertEquals(xSquared.value, xOverXSquared.value.divisor);
    assertTrue(xOverXSquared.value.isZero());
  }

  public void testAddXPlusXSquaredWithNoRemainder()
  {
    RealRationalFunction x = new RealRationalFunction();
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

  public void testAddXPlusXSquaredWithRemainderOnLHS()
  {
    RealRationalFunction x = new RealRationalFunction();
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
  
  public void testMul()
  {
    RealRationalFunction f = new RealRationalFunction();
    assert false : "TODO";
  }

  public void testDiv()
  {
    RealRationalFunction f = new RealRationalFunction();
    assert false : "TODO";
  }

}
