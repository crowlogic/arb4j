package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Direct unit tests for {@link RoughHestonRiccatiMuntzPadeFunctional} that
 * exercise the fractional-Riccati functional in isolation, without ever
 * instantiating {@link RoughHestonCharacteristicFunction} (issue #1083).
 *
 * <p>
 * The functional is constructed from a bare {@link Context} that registers only
 * the model parameters {@code λ}, {@code ρ}, {@code ν} it needs to resolve the
 * coefficient expressions, plus the fractional order {@code μ}/{@code α}. Every
 * assertion here is computed from first principles — the rough-Heston
 * coefficient closed forms
 *
 * <pre>
 *   p(v) = ½(−v² − ⅈv)
 *   q(v) = λ(ⅈvρν − 1)
 *   r    = ½(λν)²
 * </pre>
 *
 * and the normalized Müntz recurrence
 *
 * <pre>
 *   a₁(v) = p(v)/Γ(μ+1)
 *   aₖ(v) = Γ((k−1)μ+1)/Γ(kμ+1) · ( q(v)·aₖ₋₁(v)
 *                                   + r·Σ_{j=1..k−2} aⱼ(v)·aₖ₋₁₋ⱼ(v) )
 * </pre>
 *
 * — so that a failure localizes to the Riccati functional rather than to any
 * higher-level characteristic-function behavior.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonRiccatiMuntzPadeFunctionalTest extends
                                                       TestCase
{
  static final int    prec = 256;
  // Canonical rough-Heston parameters (El Euch–Rosenbaum style), matching the
  // values used across the other rough-Heston tests so hand-computed anchors
  // line up with the scipy-verified references there.
  static final String Λ    = "0.3";
  static final String Ρ     = "-0.7";
  static final String Ν     = "0.3";
  static final String Μ     = "0.6";

  /**
   * A functional plus the externally-owned parameter Reals it references. The
   * {@link Context} holds {@code λ}, {@code ρ}, {@code ν}, {@code μ}; the
   * functional reuses the {@code μ} instance already present, so it does not own
   * it, hence this holder closes the parameters after the functional.
   */
  static final class Fixture implements
                               AutoCloseable
  {
    final Real                                 λ;
    final Real                                 ρ;
    final Real                                 ν;
    final Real                                 μ;
    final Context                              context;
    final RoughHestonRiccatiMuntzPadeFunctional functional;

    Fixture()
    {
      λ          = new Real(Λ, prec).setName("λ");
      ρ          = new Real(Ρ, prec).setName("ρ");
      ν          = new Real(Ν, prec).setName("ν");
      μ          = new Real(Μ, prec).setName("μ");
      context    = new Context(λ, ρ, ν, μ);
      functional = new RoughHestonRiccatiMuntzPadeFunctional(context, μ);
    }

    @Override
    public void close()
    {
      functional.close();
      λ.close();
      ρ.close();
      ν.close();
      μ.close();
    }
  }

  /** Evaluate the Müntz coefficient aₖ(v) of the functional at a real point v. */
  static Complex evalA(RoughHestonRiccatiMuntzPadeFunctional f, int k, double v, int bits, Complex out)
  {
    try (Integer kk = new Integer(); Complex z = new Complex())
    {
      kk.set(k);
      ComplexPolynomial poly = f.a.evaluate(kk, 1, bits, null);
      z.set(v, 0.0);
      return poly.evaluate(z, 1, bits, out);
    }
  }

  /** Evaluate a ComplexPolynomial at a real point v. */
  static Complex evalPoly(ComplexPolynomial poly, double v, int bits, Complex out)
  {
    try (Complex z = new Complex())
    {
      z.set(v, 0.0);
      return poly.evaluate(z, 1, bits, out);
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Construction & context wiring
  // ─────────────────────────────────────────────────────────────────────

  /**
   * The functional is fully constructible from a Context that registers only λ,
   * ρ, ν and the fractional order — no RoughHestonCharacteristicFunction
   * involved — and every compiled artifact (p, q, r, a) is live afterwards.
   */
  public void testConstructFromContextWithoutCharacteristicFunction()
  {
    try (Fixture fx = new Fixture())
    {
      assertNotNull("fractional order α must be set", fx.functional.α);
      assertNotNull("p coefficient polynomial must be allocated", fx.functional.p);
      assertNotNull("q coefficient polynomial must be allocated", fx.functional.q);
      assertNotNull("r coefficient polynomial must be allocated", fx.functional.r);
      assertNotNull("Müntz coefficient sequence a must be compiled", fx.functional.a);
      assertSame("functional context must be the Context passed in", fx.context, fx.functional.context);
    }
  }

  /**
   * The Context registers the fractional order as μ and the three coefficient
   * polynomials p, q, r as variables, and the functional's public fields are the
   * very same instances (identity, not copies).
   */
  public void testContextVariablesRegistered()
  {
    try (Fixture fx = new Fixture())
    {
      assertSame("μ in context must be the constructor's fractional-order instance",
                 fx.μ,
                 fx.context.getVariable("μ"));
      assertSame("functional.α must be the μ registered in the context",
                 fx.context.getVariable("μ"),
                 fx.functional.α);
      assertSame("p variable in context must be functional.p",
                 fx.functional.p,
                 fx.context.<ComplexPolynomial> getVariable("p"));
      assertSame("q variable in context must be functional.q",
                 fx.functional.q,
                 fx.context.<ComplexPolynomial> getVariable("q"));
      assertSame("r variable in context must be functional.r",
                 fx.functional.r,
                 fx.context.<ComplexPolynomial> getVariable("r"));
    }
  }

  /**
   * The Fourier parameter v and the model parameters λ, ρ, ν held by the
   * Context are the exact instances the caller supplied — mutating them and
   * refreshing must flow through to the coefficient polynomials (see
   * {@link #testCacheInvalidationRefreshesCoefficients()}).
   */
  public void testContextParameterIdentity()
  {
    try (Fixture fx = new Fixture())
    {
      assertSame("λ identity", fx.λ, fx.context.getVariable("λ"));
      assertSame("ρ identity", fx.ρ, fx.context.getVariable("ρ"));
      assertSame("ν identity", fx.ν, fx.context.getVariable("ν"));
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Coefficient expressions p(v), q(v), r
  // ─────────────────────────────────────────────────────────────────────

  /**
   * p(v) = ½(−v² − ⅈv). Evaluated at v ∈ {0, 0.5, 1} against the hand-computed
   * closed form (−v²/2, −v/2).
   */
  public void testPCoefficientExpression()
  {
    try (Fixture fx = new Fixture(); Complex out = new Complex())
    {
      for (double v : new double[] { 0.0, 0.5, 1.0 })
      {
        evalPoly(fx.functional.p, v, prec, out);
        assertEquals("p(" + v + ").re", -v * v / 2.0, out.re().doubleValue(), 1e-30);
        assertEquals("p(" + v + ").im", -v / 2.0, out.im().doubleValue(), 1e-30);
      }
    }
  }

  /**
   * q(v) = λ(ⅈvρν − 1) = (−λ, λρνv). Evaluated at v ∈ {0, 0.5, 1} against the
   * hand-computed closed form with the canonical parameters.
   */
  public void testQCoefficientExpression()
  {
    final double λ = 0.3, ρ = -0.7, ν = 0.3;
    try (Fixture fx = new Fixture(); Complex out = new Complex())
    {
      for (double v : new double[] { 0.0, 0.5, 1.0 })
      {
        evalPoly(fx.functional.q, v, prec, out);
        assertEquals("q(" + v + ").re", -λ, out.re().doubleValue(), 1e-30);
        assertEquals("q(" + v + ").im", λ * ρ * ν * v, out.im().doubleValue(), 1e-30);
      }
    }
  }

  /**
   * r = ½(λν)² is real and v-independent. Its constant value is checked and its
   * v-independence confirmed by evaluating at two distinct points.
   */
  public void testRCoefficientExpression()
  {
    final double λ = 0.3, ν = 0.3;
    final double rExpected = 0.5 * (λ * ν) * (λ * ν);
    try (Fixture fx = new Fixture(); Complex out = new Complex())
    {
      evalPoly(fx.functional.r, 0.5, prec, out);
      assertEquals("r.re", rExpected, out.re().doubleValue(), 1e-30);
      assertEquals("r.im", 0.0, out.im().doubleValue(), 1e-30);
      evalPoly(fx.functional.r, 2.0, prec, out);
      assertEquals("r must be v-independent", rExpected, out.re().doubleValue(), 1e-30);
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Müntz coefficient recurrence
  // ─────────────────────────────────────────────────────────────────────

  /**
   * The k=1 anchor a₁(v) = p(v)/Γ(μ+1). Recomputed independently from p(v)
   * (closed form) and Γ(μ+1); |a₁ − p/Γ(μ+1)| must be below 2^-90.
   */
  public void testCoefficientAnchorA1()
  {
    try (Fixture fx = new Fixture();
         Real gMu1 = new Real();
         Real mag = new Real();
         Real thr = new Real();
         Complex p = new Complex();
         Complex a1ex = new Complex();
         Complex a1 = new Complex();
         Complex resid = new Complex())
    {
      thr.one().mul2e(-90);
      fx.μ.add(1, prec, gMu1);
      gMu1.gamma(prec);
      for (double v : new double[] { 0.5, 1.0 })
      {
        // p(v) = (−v²/2, −v/2), exact for real v
        p.set(-v * v / 2.0, -v / 2.0);
        p.div(gMu1, prec, a1ex);
        evalA(fx.functional, 1, v, prec, a1);
        a1.sub(a1ex, prec, resid);
        resid.abs(prec, mag);
        assertTrue("a(1) anchor residual at v=" + v + " is " + mag + " (≥ 2^-90)",
                   mag.compareTo(thr) < 0);
      }
    }
  }

  /**
   * The full fractional-Riccati residual at the coefficient level, computed
   * without any reference to RoughHestonCharacteristicFunction. For k = 2..7 at
   * v ∈ {0.5, 1.0} the recurrence right-hand side is recomputed independently
   * (Γ-ratios via {@link Real#gamma(int)}, the convolution and q/r terms via
   * {@link Complex} arithmetic, parameters taken by identity from the live
   * functional) and |aₖ − RHS| is asserted below 2^-90.
   */
  public void testMuntzRiccatiRecurrenceResidual()
  {
    final int K = 7;
    try (Fixture fx = new Fixture();
         Real thr = new Real();
         Real vR = new Real();
         Real qRe = new Real();
         Real qIm = new Real();
         Real ln = new Real();
         Real rc = new Real();
         Real gMu1 = new Real();
         Real num = new Real();
         Real den = new Real();
         Real gam = new Real();
         Real mag = new Real();
         Complex p = new Complex();
         Complex q = new Complex();
         Complex a1ex = new Complex();
         Complex conv = new Complex();
         Complex prod = new Complex();
         Complex qa = new Complex();
         Complex rconv = new Complex();
         Complex inner = new Complex();
         Complex rhs = new Complex();
         Complex resid = new Complex())
    {
      thr.one().mul2e(-90);

      Real λ = fx.λ, ν = fx.ν, ρ = fx.ρ, μ = fx.μ; // identity references

      // r = ½(λν)²  (real, v-independent)
      λ.mul(ν, prec, ln);
      ln.mul(ln, prec, rc);
      rc.mul2e(-1);

      // Γ(μ+1)
      μ.add(1, prec, gMu1);
      gMu1.gamma(prec);

      for (double v : new double[] { 0.5, 1.0 })
      {
        vR.set(Double.toString(v), prec);

        // p(v) = (−v²/2, −v/2)  (exact for real v)
        p.set(-v * v / 2.0, -v / 2.0);

        // q(v) = (−λ, λ·ρ·ν·v)
        λ.neg(qRe);
        λ.mul(ρ, prec, qIm);
        qIm.mul(ν, prec, qIm);
        qIm.mul(vR, prec, qIm);
        q.set(qRe, qIm);

        Complex[] a = new Complex[K + 1];
        for (int k = 1; k <= K; k++)
        {
          a[k] = new Complex();
          evalA(fx.functional, k, v, prec, a[k]);
        }

        // k=1 anchor: a(1) == p / Γ(μ+1)
        p.div(gMu1, prec, a1ex);
        a[1].sub(a1ex, prec, resid);
        resid.abs(prec, mag);
        assertTrue("a(1) anchor residual at v=" + v + " is " + mag + " (≥ 2^-90)",
                   mag.compareTo(thr) < 0);

        // k=2..K: full recurrence residual
        for (int k = 2; k <= K; k++)
        {
          μ.mul(k - 1, prec, num);
          num.add(1, prec, num);
          num.gamma(prec);
          μ.mul(k, prec, den);
          den.add(1, prec, den);
          den.gamma(prec);
          num.div(den, prec, gam);

          conv.zero();
          for (int j = 1; j <= k - 2; j++)
          {
            a[j].mul(a[k - 1 - j], prec, prod);
            conv.add(prod, prec, conv);
          }

          q.mul(a[k - 1], prec, qa);
          conv.mul(rc, prec, rconv);
          qa.add(rconv, prec, inner);
          inner.mul(gam, prec, rhs);

          a[k].sub(rhs, prec, resid);
          resid.abs(prec, mag);
          assertTrue("Riccati recurrence residual at k=" + k + ", v=" + v + " is " + mag + " (≥ 2^-90)",
                     mag.compareTo(thr) < 0);
        }

        for (int k = 1; k <= K; k++)
          a[k].close();
      }
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Sanity: zero input
  // ─────────────────────────────────────────────────────────────────────

  /**
   * At v = 0 the Fourier-side source p(0) = 0, so the whole Müntz coefficient
   * cascade collapses to zero: a₁(0) = p(0)/Γ(μ+1) = 0 and every higher aₖ(0)
   * is a product/convolution that contains a factor of a lower a·(0) = 0. Every
   * aₖ(0) for k = 1..6 must therefore be exactly zero.
   */
  public void testZeroInputYieldsZeroCoefficients()
  {
    try (Fixture fx = new Fixture(); Complex out = new Complex())
    {
      for (int k = 1; k <= 6; k++)
      {
        evalA(fx.functional, k, 0.0, prec, out);
        assertTrue("a(" + k + ")(0) must be exactly zero, was " + out, out.isZero());
      }
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Cache invalidation on parameter change
  // ─────────────────────────────────────────────────────────────────────

  /**
   * Mutating a model parameter (λ) in place and calling {@code invalidateCache()}
   * must refresh the coefficient polynomials from the nullary factory functions:
   * q(v) = λ(ⅈvρν − 1) and r = ½(λν)² both depend on λ, so both must change,
   * while p(v) (λ-independent) must not. Values are checked against the
   * hand-computed closed form at the new λ.
   */
  public void testCacheInvalidationRefreshesCoefficients()
  {
    final double ρ = -0.7, ν = 0.3;
    try (Fixture fx = new Fixture(); Complex out = new Complex())
    {
      // sanity: initial r at λ=0.3
      evalPoly(fx.functional.r, 0.0, prec, out);
      assertEquals("initial r", 0.5 * (0.3 * ν) * (0.3 * ν), out.re().doubleValue(), 1e-30);

      // change λ → 0.5 and invalidate
      final double λ2 = 0.5;
      fx.λ.set(Double.toString(λ2), prec);
      fx.functional.invalidateCache();

      // q refreshed: q(v) = (−λ2, λ2ρνv)
      evalPoly(fx.functional.q, 1.0, prec, out);
      assertEquals("q.re after λ change", -λ2, out.re().doubleValue(), 1e-30);
      assertEquals("q.im after λ change", λ2 * ρ * ν * 1.0, out.im().doubleValue(), 1e-30);

      // r refreshed: r = ½(λ2·ν)²
      evalPoly(fx.functional.r, 0.0, prec, out);
      assertEquals("r after λ change", 0.5 * (λ2 * ν) * (λ2 * ν), out.re().doubleValue(), 1e-30);

      // p unchanged (λ-independent)
      evalPoly(fx.functional.p, 1.0, prec, out);
      assertEquals("p.re unchanged", -0.5, out.re().doubleValue(), 1e-30);
      assertEquals("p.im unchanged", -0.5, out.im().doubleValue(), 1e-30);
    }
  }
}
