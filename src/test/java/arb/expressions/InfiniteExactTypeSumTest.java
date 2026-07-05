package arb.expressions;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.FractionNullaryFunction;
import junit.framework.TestCase;

/**
 * Verifies that {@code Σ{k=a…∞}} works when the summand type is an exact type
 * ({@link Fraction} or {@link Integer}).
 *
 * <p>
 * Exact types participate in the infinite-sum convergence loop via the
 * {@code abs(int bits, Real result)} method that each type now provides.
 * {@link Integer#abs(int, Real)} lifts the integer to an exact ball and takes
 * the absolute value; {@link Fraction#abs(int, Real)} converts the fraction to
 * a ball at the requested precision and then takes the absolute value. In both
 * cases the result is compared against the {@code 2^{-bits}} tolerance by the
 * loop's convergence test in
 * {@link arb.expressions.nodes.nary.NAryOperationNode}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class InfiniteExactTypeSumTest extends
                                      TestCase
{
  /**
   * {@link Integer#abs(int, Real)} converts this integer to an exact real ball
   * and returns its absolute value.
   */
  public static void testIntegerAbsReturnsExactBall()
  {
    try ( Integer n = new Integer(-7); Real r = new Real())
    {
      n.abs(128, r);
      assertEquals(7.0, r.doubleValue(), 0.0);
    }
  }

  /**
   * {@link Fraction#abs(int, Real)} converts this fraction to a real ball at the
   * requested precision and returns its absolute value.
   */
  public static void testFractionAbsReturnsRealBall()
  {
    try ( Fraction f = new Fraction(); Real r = new Real())
    {
      f.set("-3/4");
      f.abs(128, r);
      assertEquals(0.75, r.doubleValue(), 1e-15);
    }
  }

  /**
   * {@link Fraction#add(Fraction, int)} adds in place, satisfying the two-arg
   * {@code T add(T, int)} contract required by the sum accumulation loop.
   */
  public static void testFractionAddInPlaceIgnoresBits()
  {
    try ( Fraction a = new Fraction(); Fraction b = new Fraction())
    {
      a.set("1/3");
      b.set("1/6");
      Fraction result = a.add(b, 128); // prec ignored for exact arithmetic
      assertSame("add(Fraction,int) must return this", a, result);
      assertEquals("1/2", a.toString().replace("⁄", "/"));
    }
  }

  /**
   * Σ{k=1…∞} 1⁄(k·(k+1)) is a telescoping series with exact partial sums
   * n⁄(n+1). At {@code bits = 10} the tolerance is {@code 2^{-10} = 1/1024};
   * the loop stops when the term {@code 1⁄(32·33) = 1/1056 ≤ 1/1024}, so the
   * result is the exact {@link Fraction} 32⁄33.
   */
  public static void testFractionInfiniteSumTelescopingConvergence()
  {
    try ( FractionNullaryFunction sum =
                                      FractionNullaryFunction.express("Σk➔(1/(k*(k+1))){k=1…∞}");
          Fraction result = new Fraction())
    {
      sum.evaluate(10, result);
      // partial sum after k=32: 1 - 1/33 = 32/33
      assertEquals(32, result.getNumerator().getSignedValue());
      assertEquals(33, result.getDenominator().getSignedValue());
    }
  }
}
