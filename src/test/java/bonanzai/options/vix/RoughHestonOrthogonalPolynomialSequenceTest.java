package bonanzai.options.vix;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.applications.options.RoughHestonOrthogonalPolynomialSequence;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("resource")
public class RoughHestonOrthogonalPolynomialSequenceTest extends
                                                         TestCase
{
  public static final Logger log  = LoggerFactory.getLogger(RoughHestonOrthogonalPolynomialSequenceTest.class);

  static final int           prec = 128;
  static final double        tol  = 1e-12;

  /**
   * Canonical rough-Heston parameters used throughout. μ=0.6, κ=0.3, ρ=-0.7,
   * σ=0.3
   *
   * Reference values independently verified in Python via the normalized Müntz
   * recurrence: a_1(v) = p(v) / Γ(μ+1) a_k(v) = (Γ((k-1)μ+1)/Γ(kμ+1)) *
   * (q(v)*a_{k-1}(v) + r(v)*Σ_{j=1}^{k-2} a_j(v)*a_{k-1-j}(v)) m(k)(v) =
   * a(k+1)(v)
   */
  public static RoughHestonOrthogonalPolynomialSequence build()
  {
    Real μ = new Real("0.6",
                      prec).setName("μ");
    Real κ = new Real("0.3",
                      prec).setName("κ");
    Real ρ = new Real("-0.7",
                      prec).setName("ρ");
    Real σ = new Real("0.3",
                      prec).setName("σ");
    return new RoughHestonOrthogonalPolynomialSequence(μ,
                                                       κ,
                                                       ρ,
                                                       σ);
  }

  /** Evaluate the ComplexPolynomial p at real point u, return Complex result. */
  public static Complex evalAt(ComplexPolynomial p, Real u, Complex res)
  {
    try ( Complex z = new Complex())
    {
      z.re().set(u);
      z.im().zero();
      return p.evaluate(z, 1, prec, res);
    }
  }

  /**
   * Log the full coefficient vector of a polynomial and its evaluation at several
   * u values. Only emits output when TRACE is enabled on this class, so it costs
   * nothing in normal CI runs.
   */
  public static void tracePolynomial(String label, ComplexPolynomial p, double... uVals)
  {
    if (!log.isTraceEnabled())
    {
      return;
    }
    log.trace("{}: degree={}, length={}", label, p.degree(), p.getLength());
    for (int i = 0; i <= p.degree(); i++)
    {
      Complex c = p.get(i);
      log.trace("  {}[{}] = {} + {}*I", label, i, c.re().doubleValue(), c.im().doubleValue());
    }
    try ( Complex res = new Complex())
    {
      for (double u : uVals)
      {
        evalAt(p, Real.valueOf(u), res);
        log.trace("  {}({}) = {} + {}*I", label, u, res.re().doubleValue(), res.im().doubleValue());
      }
    }
  }

  // -------------------------------------------------------------------------
  // Smoke tests
  // -------------------------------------------------------------------------

  public void testConstructionSucceeds()
  {
    try ( var ops = build())
    {
      assertNotNull("moment sequence m must be compiled", ops.m);
      assertNotNull("OPS recurrence sequence S must be compiled", ops.S);
      assertNotNull("muntz functional must be set", ops.muntz);
    }
  }

  public void testMomentSequenceNonEmpty()
  {
    try ( var ops = build(); Integer n = new Integer())
    {
      for (int k = 0; k <= 2; k++)
      {
        n.set(k);
        ComplexPolynomial mk = ops.m.evaluate(n, 1, prec, null);
        assertNotNull("m(" + k + ") must not be null", mk);
        tracePolynomial("m(" + k + ")", mk, 0.5, 1.0, 1.5);
        assertTrue("m(" + k + ") must be non-empty (degree=" + mk.degree() + ")", mk.degree() >= 0);
      }
    }
  }

  public void testOPSRecurrenceNonEmpty()
  {
    try ( var ops = build(); Integer n = new Integer())
    {
      for (int k = 0; k <= 2; k++)
      {
        n.set(k);
        ComplexPolynomial Sk = ops.S.evaluate(n, 1, prec, null);
        assertNotNull("S(" + k + ") must not be null", Sk);
        tracePolynomial("S(" + k + ")", Sk, 0.5, 1.0, 1.5);
        assertTrue("S(" + k + ") must be non-empty (degree=" + Sk.degree() + ")", Sk.degree() >= 0);
      }
    }
  }

  public void testS0EqualsM0()
  {
    try ( var ops = build(); Integer n = new Integer())
    {
      n.set(0);
      ComplexPolynomial m0 = ops.m.evaluate(n, 1, prec, null);
      ComplexPolynomial S0 = ops.S.evaluate(n, 1, prec, null);
      tracePolynomial("m(0)", m0, 0.5, 1.0, 1.5);
      tracePolynomial("S(0)", S0, 0.5, 1.0, 1.5);
      assertEquals("S(0) degree must equal m(0) degree", m0.degree(), S0.degree());
      for (int i = 0; i <= m0.degree(); i++)
      {
        assertEquals("S(0)[" + i + "].re", m0.get(i).re().doubleValue(), S0.get(i).re().doubleValue(), tol);
        assertEquals("S(0)[" + i + "].im", m0.get(i).im().doubleValue(), S0.get(i).im().doubleValue(), tol);
      }
    }
  }

  public void testMuIsSharedInstance()
  {
    Real μ = new Real("0.6",
                      prec).setName("μ");
    Real κ = new Real("0.3",
                      prec).setName("κ");
    Real ρ = new Real("-0.7",
                      prec).setName("ρ");
    Real σ = new Real("0.3",
                      prec).setName("σ");
    try ( var ops = new RoughHestonOrthogonalPolynomialSequence(μ,
                                                                κ,
                                                                ρ,
                                                                σ))
    {
      assertSame("μ in context must be the same instance as the constructor arg",
                 μ,
                 ops.muntz.context.getVariable("μ"));
    }
    finally
    {
      μ.close();
      κ.close();
      ρ.close();
      σ.close();
    }
  }

  // -------------------------------------------------------------------------
  // Python-verified spot checks: m(k)(v) = a(k+1)(v) from the normalized
  // Müntz recurrence (with Γ prefactors, matching RiccatiMuntzPadeFunctional).
  //
  // Python reference (scipy.special.gamma):
  // a_1(v) = P(v)/Γ(μ+1)
  // a_k(v) = (Γ((k-1)μ+1)/Γ(kμ+1)) * (Q(v)*a_{k-1} + R*Σ_{j=1}^{k-2}
  // a_j*a_{k-1-j})
  // m(k)(v) = a(k+1)(v)
  // -------------------------------------------------------------------------

  /**
   * m(0)(v) = a_1(v) = P(v)/Γ(μ+1) = -½(v²+Iv) / Γ(1.6)
   *
   * u=0.5: -0.139896869258765 - 0.279793738517531*I u=1.0: -0.559587477035061 -
   * 0.559587477035061*I u=1.5: -1.25907182332889 - 0.839381215552592*I
   */
  public void testM0SpotCheck()
  {
    try ( var ops = build(); Integer n = new Integer(); Complex res = new Complex())
    {
      n.set(0);
      ComplexPolynomial m0 = ops.m.evaluate(n, 1, prec, null);
      tracePolynomial("m(0)", m0, 0.5, 1.0, 1.5);

      evalAt(m0, 0.5, res);
      log.debug("m(0)(0.5) = {} + {}*I  (expected -0.139896869258765 - 0.279793738517531*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(0)(0.5).re", -0.139896869258765, res.re().doubleValue(), tol);
      assertEquals("m(0)(0.5).im", -0.279793738517531, res.im().doubleValue(), tol);

      evalAt(m0, 1.0, res);
      log.debug("m(0)(1.0) = {} + {}*I  (expected -0.559587477035061 - 0.559587477035061*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(0)(1.0).re", -0.559587477035061, res.re().doubleValue(), tol);
      assertEquals("m(0)(1.0).im", -0.559587477035061, res.im().doubleValue(), tol);

      evalAt(m0, 1.5, res);
      log.debug("m(0)(1.5) = {} + {}*I  (expected -1.25907182332889 - 0.839381215552592*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(0)(1.5).re", -1.25907182332889, res.re().doubleValue(), tol);
      assertEquals("m(0)(1.5).im", -0.839381215552592, res.im().doubleValue(), tol);
    }
  }

  private Complex evalAt(ComplexPolynomial m0, double d, Complex res)
  {
    return evalAt(m0, Real.valueOf(d), res);
  }

  /**
   * m(1)(v) = a_2(v)
   *
   * u=0.5: -0.0102105414474219 - 0.0799825746714715*I u=1.0: -0.0408421657896876
   * - 0.231438939474896*I u=1.5: -0.0918948730267971 - 0.525842884542228*I
   */
  public void testM1SpotCheck()
  {
    try ( var ops = build(); Integer n = new Integer(); Complex res = new Complex())
    {
      n.set(1);
      ComplexPolynomial m1 = ops.m.evaluate(n, 1, prec, null);
      tracePolynomial("m(1)", m1, 0.5, 1.0, 1.5);

      evalAt(m1, 0.5, res);
      log.debug("m(1)(0.5) = {} + {}*I  (expected -0.0102105414474219 - 0.0799825746714715*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(1)(0.5).re", -0.0102105414474219, res.re().doubleValue(), tol);
      assertEquals("m(1)(0.5).im", -0.0799825746714715, res.im().doubleValue(), tol);

      evalAt(m1, 1.0, res);
      log.debug("m(1)(1.0) = {} + {}*I  (expected -0.0408421657896876 - 0.231438939474896*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(1)(1.0).re", -0.0408421657896876, res.re().doubleValue(), tol);
      assertEquals("m(1)(1.0).im", -0.231438939474896, res.im().doubleValue(), tol);

      evalAt(m1, 1.5, res);
      log.debug("m(1)(1.5) = {} + {}*I  (expected -0.0918948730267971 - 0.525842884542228*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(1)(1.5).re", -0.0918948730267971, res.re().doubleValue(), tol);
      assertEquals("m(1)(1.5).im", -0.525842884542228, res.im().doubleValue(), tol);
    }
  }

  /**
   * m(2)(v) = a_3(v)
   *
   * u=0.5: 0.00176979751496791 - 0.0141589299585252*I u=1.0: 0.0238891858471861 -
   * 0.0327460941158893*I u=1.5: 0.116788152358598 - 0.0601897266709312*I
   */
  public void testM2SpotCheck()
  {
    try ( var ops = build(); Integer n = new Integer(); Complex res = new Complex())
    {
      n.set(2);
      ComplexPolynomial m2 = ops.m.evaluate(n, 1, prec, null);
      tracePolynomial("m(2)", m2, 0.5, 1.0, 1.5);

      evalAt(m2, 0.5, res);
      log.debug("m(2)(0.5) = {} + {}*I  (expected 0.00176979751496791 - 0.0141589299585252*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(2)(0.5).re", 0.00176979751496791, res.re().doubleValue(), tol);
      assertEquals("m(2)(0.5).im", -0.0141589299585252, res.im().doubleValue(), tol);

      evalAt(m2, 1.0, res);
      log.debug("m(2)(1.0) = {} + {}*I  (expected 0.0238891858471861 - 0.0327460941158893*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(2)(1.0).re", 0.0238891858471861, res.re().doubleValue(), tol);
      assertEquals("m(2)(1.0).im", -0.0327460941158893, res.im().doubleValue(), tol);

      evalAt(m2, 1.5, res);
      log.debug("m(2)(1.5) = {} + {}*I  (expected 0.116788152358598 - 0.0601897266709312*I)",
                res.re().doubleValue(),
                res.im().doubleValue());
      assertEquals("m(2)(1.5).re", 0.116788152358598, res.re().doubleValue(), tol);
      assertEquals("m(2)(1.5).im", -0.0601897266709312, res.im().doubleValue(), tol);
    }
  }
}
