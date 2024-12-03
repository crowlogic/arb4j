package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.negHalf;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomials;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiPolynomialSequenceTest extends
                                          TestCase
{

  public static final int bits = 128;

  public static final int N    = 3;

  public static void testP()
  {

    try ( var seq = new JacobiPolynomials(negHalf,
                                          negHalf))
    {

      Integer won = new Integer("1");

      try ( RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
      {
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(RealConstants.half, valAtOne);
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());

        assertEquals(RealConstants.one, valAtTwo);

      }

    }

  }

  public static void testP0()
  {

    try ( var seq = new JacobiPolynomials(negHalf,
                                          negHalf))
    {
      Integer won = new Integer("0");

      try ( RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
      {
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(RealConstants.one, valAtOne);
        Real valAtPi = result.evaluate(RealConstants.π, 128, new Real());
        assertEquals(RealConstants.one, valAtPi);
      }
    }

  }

  public void testP1()
  {

    try ( Integer won = new Integer("1"); JacobiPolynomials seq = new JacobiPolynomials(negHalf,
                                                                                        negHalf);
          RealPolynomial result = seq.P.evaluate(won, 0, bits, new RealPolynomial()))
    {
      // P(-half,-half)=ChebyshevType1 and when n=1 it equals x/2
      Real a = result.evaluate(RealConstants.one, 128, new Real());
      assertEquals(RealConstants.half, a);
      Real b = result.evaluate(RealConstants.half, 128, new Real());
      assertEquals(RealConstants.oneQuarter, b);

    }

  }

  public static void testP2()
  {
    try ( var seq = new JacobiPolynomials(negHalf,
                                          negHalf))
    {
      Integer too = new Integer("2");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.375, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(2.625, valAtTwo.doubleValue());

      }
    }

  }

  public static void testP3()
  {

    try ( var seq = new JacobiPolynomials(negHalf,
                                          negHalf))
    {
      Integer too = new Integer("3");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.3125, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(8.125, valAtTwo.doubleValue());

      }
    }

  }

  public static void testP4()
  {

    try ( var seq = new JacobiPolynomials(negHalf,
                                          negHalf))
    {
      Integer too = new Integer("4");

      try ( RealPolynomial result = seq.P.evaluate(too, 0, bits, new RealPolynomial()))
      {
        result.getCoeffs().printPrecision = true;
        Real valAtOne = result.evaluate(RealConstants.one, 128, new Real());
        assertEquals(0.2734375, valAtOne.doubleValue());
        Real valAtTwo = result.evaluate(RealConstants.two, 128, new Real());
        assertEquals(26.5234375, valAtTwo.doubleValue());

      }
    }

  }
}
