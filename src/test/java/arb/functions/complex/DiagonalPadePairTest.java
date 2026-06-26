package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import junit.framework.TestCase;

/**
 * Tests for {@link DiagonalPadePair}.
 *
 * <p>
 * Covers:
 * <ol>
 *   <li>Construction and field sizes at several Padé orders.</li>
 *   <li>Singular-sentinel detection via {@link DiagonalPadePair#markSingular}
 *       and {@link DiagonalPadePair#isSingularSentinel}.</li>
 *   <li>Rational evaluation R_M(z) = P_M(z) / Q_M(z) for a hand-coded
 *       Padé pair representing the [1/1] approximant of tanh — namely
 *       P_1(z) = z, Q_1(z) = 1 — which reduces to z/1 = z and agrees
 *       with the first-order tanh expansion at small z.</li>
 *   <li>The [2/2] Padé approximant of tanh:
 *       P_2(z) = z + z³/15 (degree-3, but we store degree-2 numerically as
 *       degree-2 here using the rational form z(1 + z²/15)/(1 + z²/5) whose
 *       coefficients are manually set).</li>
 * </ol>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class DiagonalPadePairTest extends
                                  TestCase
{
  private static final int BITS = 128;

  /**
   * Newly constructed pair at order M has the right M field, non-null P and Q,
   * and is not the singular sentinel.
   */
  public void testConstructionPreservesOrder()
  {
    for (int M : new int[]
    { 0, 1, 2, 5 })
    {
      try ( DiagonalPadePair pair = new DiagonalPadePair(M))
      {
        assertEquals("M field", M, pair.M);
        assertNotNull("P must be allocated", pair.P);
        assertNotNull("Q must be allocated", pair.Q);
        assertFalse("fresh pair must not be singular sentinel", pair.isSingularSentinel());
      }
    }
  }

  /**
   * Negative M throws {@link IllegalArgumentException}.
   */
  public void testNegativeOrderThrows()
  {
    try
    {
      new DiagonalPadePair(-1).close();
      fail("expected IllegalArgumentException for M < 0");
    }
    catch (IllegalArgumentException e)
    {
      // expected
    }
  }

  /**
   * After {@link DiagonalPadePair#markSingular}, {@code isSingularSentinel}
   * returns true and both constant terms are positive infinity.
   */
  public void testSingularSentinel()
  {
    try ( DiagonalPadePair pair = new DiagonalPadePair(3))
    {
      assertFalse("fresh pair is not singular", pair.isSingularSentinel());
      pair.markSingular();
      assertTrue("after markSingular, isSingularSentinel must return true", pair.isSingularSentinel());
      // Both P[0] and Q[0] must be +∞
      assertFalse("P[0] must be +∞ (not finite)", pair.P.get(0).isFinite());
      assertFalse("Q[0] must be +∞ (not finite)", pair.Q.get(0).isFinite());
    }
  }

  /**
   * [1/1] Padé of tanh: P_1(z) = z, Q_1(z) = 1.
   *
   * <p>
   * R_1(z) = z/1 = z; at z = 0.1 this evaluates to 0.1, while tanh(0.1)
   * ≈ 0.09983... The first-order approximant thus overshoots by about 0.17%,
   * which is the expected leading error for a [1/1] approximant.
   */
  public void testLinearPadeEvaluation()
  {
    try ( DiagonalPadePair pair = new DiagonalPadePair(1); Complex z = new Complex(); Complex res = new Complex())
    {
      // P_1(z) = z: coefficient [0] = 0, coefficient [1] = 1
      pair.P.fitLength(2);
      pair.P.setLength(2);
      pair.P.get(0).set(0.0, 0.0);
      pair.P.get(1).set(1.0, 0.0);

      // Q_1(z) = 1: coefficient [0] = 1
      pair.Q.fitLength(1);
      pair.Q.setLength(1);
      pair.Q.get(0).set(1.0, 0.0);

      z.set("1/10", BITS);
      pair.evaluate(z, 1, BITS, res);

      // R_1(0.1) = 0.1
      assertEquals("Re(R_1(0.1)) = 0.1", 0.1, res.re().doubleValue(), 1e-15);
      assertEquals("Im(R_1(0.1)) = 0.0", 0.0, res.im().doubleValue(), 1e-15);
    }
  }

  /**
   * [2/2] Padé of tanh(z)/z: the standard diagonal approximant is
   *
   * <pre>
   *   P(z) = 1 + z²/15,   Q(z) = 1 + z²/5 - z²·tanh-correction
   * </pre>
   *
   * Using the well-known exact form
   * <pre>
   *   R_{2/2}(z) = z·(1 + z²/15) / (1 + z²/5)
   * </pre>
   *
   * At z = 0.5: ref = tanh(0.5) ≈ 0.46211715726...
   * R_{2/2}(0.5) = 0.5·(1+1/60)/(1+1/20) = 0.5·(61/60)/(21/20)
   *             = 0.5·(61/60)·(20/21) = 0.5·1220/1260 ≈ 0.48413...
   *
   * The raw [2/2] approximant of tanh(z) (not tanh(z)/z) is:
   *   P(z) = z + z³/15,   Q(z) = 1 + 2z²/5
   *
   * At z = 0.5: P(0.5) = 0.5 + 0.5³/15 = 0.5 + 1/120 ≈ 0.508333
   *             Q(0.5) = 1 + 2·0.25/5 = 1 + 0.1 = 1.1
   *             R(0.5) ≈ 0.508333/1.1 ≈ 0.46212 ≈ tanh(0.5) to ~5 digits
   */
  public void testDiagonalTwoPadeMatchesTanh()
  {
    // [2/2] Padé of tanh at z = 0.5
    // P_2(z) = z + z³/15 — degree 3, but we encode it as M=2 with
    // two coefficients for the "half": set P[0]=0, P[1]=1, P[2]=0, P[3]=1/15.
    // The DiagonalPadePair is meant for degree-M numerator/denominator
    // (storage ≥ M+1), so we fit to degree 3 manually.
    try ( DiagonalPadePair pair = new DiagonalPadePair(3); Complex z = new Complex(); Complex res = new Complex())
    {
      // P_2(z) = z + z³/15  (store as degree-3 polynomial)
      pair.P.fitLength(4);
      pair.P.setLength(4);
      pair.P.get(0).set(0.0, 0.0);
      pair.P.get(1).set(1.0, 0.0);
      pair.P.get(2).set(0.0, 0.0);
      pair.P.get(3).re().set("1/15", BITS);
      pair.P.get(3).im().zero();

      // Q_2(z) = 1 + 2z²/5 (store as degree-2 polynomial)
      pair.Q.fitLength(3);
      pair.Q.setLength(3);
      pair.Q.get(0).set(1.0, 0.0);
      pair.Q.get(1).set(0.0, 0.0);
      pair.Q.get(2).re().set("2/5", BITS);
      pair.Q.get(2).im().zero();

      z.set("1/2", BITS);
      pair.evaluate(z, 1, BITS, res);

      double approx = res.re().doubleValue();
      double tanh05 = Math.tanh(0.5);
      assertEquals("[2/2] Padé of tanh at z=0.5 must agree to 5 digits", tanh05, approx, 1e-4);
      assertEquals("imaginary part must be 0", 0.0, res.im().doubleValue(), 1e-15);
    }
  }
}
