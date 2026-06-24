package arb;

import static arb.RealConstants.zero;
import static arb.RealConstants.π;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealPolynomialSequence;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomialSequence;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialTest extends
                                TestCase
{
  public void testIntegralOfSequenceofPolynomialElement()
  {
    var context = new Context();
    var P       = new JacobiPolynomialSequence(RealConstants.negHalf,
                                               RealConstants.negHalf);
    context.registerSequence("P", P);
    var Q  = RealPolynomialSequence.parse("wtf:n->int(P(n)(x),x)", context);
    var q  = Q.instantiate();
    var q3 = q.apply(3);
//    System.out.println( "P3=" + P.apply(3));
    assertEquals("0.3125*x⁴ - 0.46875*x²", q3.toString());
  }

  public void testSetFraction()
  {
    try ( var r = new RealPolynomial(); var f = new Fraction();)
    {
      r.set(f.set("10/43"));
      assertEquals(0.23255813953488372093, r.get(0).doubleValue());
    }
  }

  public void testPower()
  {
    try ( var p = RealPolynomial.newIdentityPolynomial(); var r = new RealPolynomial())
    {
      var pSquared = p.pow(new Integer(2), 128, r);
      assertEquals("x²", pSquared.toString());
    }
  }

  /**
   * Assert that ∫5x + 10dx=2.5x² + 10x
   */
  public void testIntegral()
  {
    try ( RealPolynomial p = new RealPolynomial(2))
    {
      p.set(10);
      p.set(1, 5);
      RealPolynomial pIntegral = p.integrate(128, new RealPolynomial());

      assertEquals(2.5, pIntegral.get(2).doubleValue());
      assertEquals(10.0, pIntegral.get(1).doubleValue());

    }

  }

  /**
   * Assert that ∫5x + 10dx=2.5x² + 10x
   */
  public void testDifferentiateIntegral()
  {
    try ( RealPolynomial p = new RealPolynomial(2))
    {
      p.set(10);
      p.set(1, 5);
      RealPolynomial pIntegral = p.integrate(128, new RealPolynomial());
      RealPolynomial pToo      = pIntegral.differentiate(128, new RealPolynomial());

      assertEquals(5.0, pToo.get(1).doubleValue());
      assertEquals(10.0, pToo.get(0).doubleValue());
      assertEquals(2.5, pIntegral.get(2).doubleValue());
      assertEquals(10.0, pIntegral.get(1).doubleValue());

    }

  }

  public void testSetInt()
  {

    try ( RealPolynomial p = new RealPolynomial(1))
    {
      p.set(10);
      assertEquals(10.0, p.get(0).doubleValue());
    }

  }

  /**
   * Assert that exact division (x² - 1) / (x - 1) = x + 1, and that the
   * three-argument {@link RealPolynomial#div(RealPolynomial, int, RealPolynomial)}
   * leaves no remainder state behind.
   */
  public void testExactDivision()
  {
    try ( RealPolynomial dividend = new RealPolynomial(3); RealPolynomial divisor = new RealPolynomial(2);
          RealPolynomial quotient = new RealPolynomial())
    {
      dividend.set(0, -1);
      dividend.set(2, 1);
      divisor.set(0, -1);
      divisor.set(1, 1);
      dividend.div(divisor, 128, quotient);
      assertEquals("x + 1", quotient.toString());
      assertEquals(1.0, quotient.get(0).doubleValue());
      assertEquals(1.0, quotient.get(1).doubleValue());
    }
  }

  /**
   * Assert that exact division of a polynomial that does not divide evenly
   * throws {@link arb.exceptions.ArbException}: (x² + 1) / (x - 1) has a
   * non-zero remainder.
   */
  public void testExactDivisionThrowsOnNonZeroRemainder()
  {
    try ( RealPolynomial dividend = new RealPolynomial(3); RealPolynomial divisor = new RealPolynomial(2);
          RealPolynomial quotient = new RealPolynomial())
    {
      dividend.set(0, 1);
      dividend.set(2, 1);
      divisor.set(0, -1);
      divisor.set(1, 1);
      try
      {
        dividend.div(divisor, 128, quotient);
        fail("expected ArbException for inexact division");
      }
      catch (arb.exceptions.ArbException expected)
      {
        assertTrue(expected.getMessage().contains("not exact"));
      }
    }
  }

  /**
   * Assert that divrem (x² + 1) = (x - 1)·(x + 1) + 2 writes both the
   * quotient x + 1 and the remainder 2 into the supplied destinations.
   */
  public void testDivisionWithRemainder()
  {
    try ( RealPolynomial dividend = new RealPolynomial(3); RealPolynomial divisor = new RealPolynomial(2);
          RealPolynomial quotient = new RealPolynomial(); RealPolynomial remainder = new RealPolynomial())
    {
      dividend.set(0, 1);
      dividend.set(2, 1);
      divisor.set(0, -1);
      divisor.set(1, 1);
      dividend.div(divisor, 128, quotient, remainder);
      assertEquals("x + 1", quotient.toString());
      assertEquals(2.0, remainder.get(0).doubleValue());
    }
  }

  public static void testIdentity()
  {
    try ( RealPolynomial eye = new RealPolynomial())
    {
      eye.identity();
    }
  }

  public static void testLeftShift()
  {
    RealPolynomial p = new RealPolynomial(5);
    p.get(2).set(π);
    RealPolynomial leftShifted = p.shiftLeft(1, new RealPolynomial());
    assertEquals(π, p.get(2));
    assertEquals(π, leftShifted.get(3));
    assertEquals(zero, p.get(3));
    p.close();
    p = leftShifted;
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(2));
    p.close();
  }

  public static void testLeftShiftAliased()
  {
    RealPolynomial p = new RealPolynomial(5);
    p.get(2).set(π);
    assertEquals(π, p.get(2));

    RealPolynomial leftShifted = p.shiftLeft(1);
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(4));
    p.close();
    p = leftShifted;
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(2));
    p.close();
  }

}
