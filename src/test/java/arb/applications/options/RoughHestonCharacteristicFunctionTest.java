package arb.applications.options;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.applications.options.RoughHestonCharacteristicFunction;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("resource")
public class RoughHestonCharacteristicFunctionTest extends
                                                   TestCase
{
  static final int prec = 128;

  /**
   * φ(0, T) = exp(0) = 1: at u = 0 the source term p(u) = ½(-u² - i u) vanishes,
   * which propagates through the Müntz recurrence to make every a_k(0) = 0, hence
   * Φ_N(0, T) = 0 and exp(Φ_N) = 1.
   */
  public void testAtZeroArgumentEqualsOne()
  {
    try ( var φ = new RoughHestonCharacteristicFunction(); Complex u = new Complex(); Complex res = new Complex())
    {
      u.zero();
      φ.evaluate(u, 1, prec, res);
      assertEquals("Re(φ(0, T)) should be 1", 1.0, res.re().doubleValue(), 1e-10);
      assertEquals("Im(φ(0, T)) should be 0", 0.0, res.im().doubleValue(), 1e-10);
    }
  }

  /**
   * For real Fourier argument, |φ(u, T)| ≤ 1: the log-spot X_T is a real-valued
   * random variable, and φ is the Fourier transform of its (signed-) probability
   * measure, so |φ| is bounded by total variation, which equals 1 under the
   * pricing measure.
   */
  public void testModulusAtMostOneForRealArgument()
  {
    try ( var φ = new RoughHestonCharacteristicFunction(); Complex u = new Complex(); Complex res = new Complex();
          Real mod = new Real(); Real one = new Real("1.0",
                                                     prec);
          Real diff = new Real())
    {
      for (int ui = -5; ui <= 5; ui++)
      {
        u.re().set(ui);
        u.im().zero();
        φ.evaluate(u, 1, prec, res);
        res.abs(prec, mod);
        mod.sub(one, prec, diff);
        assertTrue("|φ(u)| must be ≤ 1, got " + mod + " at u=" + ui, mod.compareTo(one) <= 0 || diff.containsZero());
      }
    }
  }


  /**
   * Short-maturity limit: every term in Φ_N carries a positive power of T, so as
   * T → 0 the cumulant goes to 0 and φ(u, T) → 1 for any fixed u.
   */
  public void testShortMaturityLimitApproachesOne()
  {
    try ( var φ = new RoughHestonCharacteristicFunction(); Complex u = new Complex(); Complex res = new Complex())
    {
      φ.config.T.set("0.0001", prec);
      u.re().set("1.0", prec);
      u.im().zero();
      φ.evaluate(u, 1, prec, res);
      assertEquals("Re(φ(u, T→0)) → 1", 1.0, res.re().doubleValue(), 1e-3);
      assertEquals("Im(φ(u, T→0)) → 0", 0.0, res.im().doubleValue(), 1e-3);
    }
  }


  /**
   * Identity-of-μ invariant: after construction, {@code cf.config.μ} is the same
   * {@link Real} instance as {@code cf.riccati.α} and as
   * {@code cf.config.context.getVariable("μ")}. Mutating any one propagates.
   */
  public void testMuIsCanonicalSingleInstance()
  {
    try ( var φ = new RoughHestonCharacteristicFunction())
    {
      Real ctxMu = φ.config.context.getVariable("μ");
      assertSame("φ.config.μ should be the same instance as the Context's μ", φ.config.μ, ctxMu);
      assertSame("φ.config.μ should be the same instance as riccati.α", φ.config.μ, φ.riccati.α);
    }
  }

  /**
   * Context-based constructor: a caller-built Context with all parameters
   * pre-registered must be accepted without conflict; the resulting CF shares
   * those Real instances by identity.
   */
  /**
   * Cross-check: a fresh CF instance evaluated at u=0.3 must agree with a reused
   * CF instance that was first evaluated at u=0.1 and then at u=0.3. If they
   * disagree, the cache invalidation between calls on the reused instance is
   * incomplete — some hoisted v-dependent state is surviving.
   */
  public void testEvaluateIsStateless()
  {
    try ( Complex u01 = new Complex(); Complex u03 = new Complex(); Complex reused01 = new Complex();
          Complex reused03 = new Complex(); Complex fresh03 = new Complex())
    {
      u01.re().set("0.1", prec);
      u01.im().set("0.0", prec);
      u03.re().set("0.3", prec);
      u03.im().set("0.0", prec);

      try ( var φ = new RoughHestonCharacteristicFunction())
      {
        φ.evaluate(u01, 1, prec, reused01);
        φ.evaluate(u03, 1, prec, reused03);
      }

      try ( var φ = new RoughHestonCharacteristicFunction())
      {
        φ.evaluate(u03, 1, prec, fresh03);
      }

      assertEquals("Re(φ(0.3)) reused vs fresh", fresh03.re().doubleValue(), reused03.re().doubleValue(), 1e-10);
      assertEquals("Im(φ(0.3)) reused vs fresh", fresh03.im().doubleValue(), reused03.im().doubleValue(), 1e-10);
    }
  }

  public void testContextBasedConstructorSharesInstances()
  {
    try ( Real λ = new Real("0.3",
                            prec).setName("λ");
          Real θ = new Real("0.02",
                            prec).setName("θ");
          Real ν = new Real("0.3",
                            prec).setName("ν");
          Real V0 = new Real("0.02",
                             prec).setName("V0");
          Real ρ = new Real("-0.7",
                            prec).setName("ρ");
          Real μ = new Real("0.6",
                            prec).setName("μ");
          Real T = new Real("1.0",
                            prec).setName("T"))
    {
      Context ctx = new Context(λ,
                                θ,
                                ν,
                                V0,
                                ρ,
                                μ,
                                T);
      try ( var φ = new RoughHestonCharacteristicFunction(ctx,
                                                          ComplexConstants.zero);
            Complex u = new Complex(); Complex res = new Complex())
      {
        assertSame("CF should adopt the caller's μ instance", μ, φ.config.μ);
        assertSame("CF should adopt the caller's λ instance", λ, φ.config.λ);
        assertSame("CF should adopt the caller's T instance", T, φ.config.T);
        assertSame("riccati.α should be identity-equal to caller's μ", μ, φ.riccati.α);

        // Sanity: φ(0, T) = 1 still.
        u.zero();
        φ.evaluate(u, 1, prec, res);
        assertEquals("Re(φ(0, T)) should be 1", 1.0, res.re().doubleValue(), 1e-10);
        assertEquals("Im(φ(0, T)) should be 0", 0.0, res.im().doubleValue(), 1e-10);
      }
    }
  }
}
