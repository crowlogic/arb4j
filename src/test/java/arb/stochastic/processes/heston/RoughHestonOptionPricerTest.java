package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.FunctionMapping;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.heston.RoughHestonOptionPricer;
import junit.framework.TestCase;

/**
 * Tests for {@link RoughHestonOptionPricer}.
 *
 * <p>
 * Penny-precision tests:
 * <ol>
 * <li>{@link #testConstructionAndOneCall} — smoke: chain compiles, evaluates to
 * a finite non-negative number.</li>
 * <li>{@link #testZeroVolOfVolReducesToBlackScholes} — ν → 0 limit. With the
 * vol-of-vol set to zero the rough-Heston variance ODE becomes deterministic,
 * so all cumulants κ_j for j ≥ 3 vanish and the Gram-Charlier correction sum
 * collapses to zero. The pricer must therefore return exactly the GBS leg of
 * the formula, evaluated at the same μ = κ_1 and σ² = κ_2.</li>
 * </ol>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonOptionPricerTest extends
                                         TestCase
{

  /**
   * Construct with all defaults (S₀ = K = 100, r = 0, rough-Heston defaults from
   * {@link arb.stochastic.processes.heston.RoughHestonCharacteristicFunction}) and call
   * once. The chain compiles and evaluates if and only if no exception is thrown
   * and the returned Real is finite.
   */
  public void testConstructionAndOneCall()
  {
    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ComplexConstants.zero);
          Real price = new Real())
    {
      pricer.call(128, price);
      assertTrue("call price must be finite, got " + price, price.isFinite());
      assertTrue("call price must be ≥ 0 for an at-the-money call, got " + price, price.sign() >= 0);
    }
  }

  /**
   * ν → 0 limit. With zero vol-of-vol the variance ODE dV = λ(θ − V)dt is
   * deterministic, the integrated variance is non-stochastic, and the log-price
   * under the risk-neutral measure is exactly Brownian with deterministic drift
   * and variance. Therefore every cumulant of order ≥ 3 must be zero and the
   * Gram-Charlier sum Σ_{j=3..2N} (κ_j / (j!·σ^j)) · ΔC_j(K) is zero, reducing
   * the pricer's output to the bare GBS call. The test verifies both: (a) every
   * {@code κ[j]} for j ≥ 3 is numerically negligible, and (b)
   * {@code pricer.call(K)} matches {@code GBS(K)} to penny precision.
   */
  public void testZeroVolOfVolReducesToBlackScholes()
  {
    final int    bits = 192;
    // tolerance: half a penny on a unit underlying (0.005), as a Real (no doubleValue)

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ComplexConstants.zero);
          Real price = new Real(); Real gbs = new Real();
          Real diff = new Real(); Real tolR = new Real("0.005", bits))
    {
      // Force ν = 0 — this is the only knob we change. All other defaults
      // (λ, θ, V₀, ρ, μ, T, S₀, K, r) remain as set by the constructors.
      pricer.φ.ν.set(0);
      // ν is a parameter the Riccati recurrence reads through a Real reference,
      // but the Müntz coefficients a(k) and the cgf d(k) cache values keyed by
      // their input — invalidate so they recompute against the new ν.
      pricer.φ.riccati.invalidateCache();
      pricer.φ.cgf.d.invalidateCache();

      pricer.call(bits, price);

      // (a) cumulants κ(j) for j ≥ 3 must all be ~0 when ν=0. κ is a
      //     compiled RealSequence — evaluate it at each j.
      try ( Real κj = new Real(); Real absκ = new Real(); Real κtol = new Real();
            arb.Integer jIdx = new arb.Integer() )
      {
        κtol.one().mul2e(-33); // ≈ 1.16e-10, the original ~0 threshold, as a Real
        for (int j = 3; j <= pricer.J.getSignedValue(); j++)
        {
          jIdx.set(j);
          pricer.κ.evaluate(jIdx, 1, bits, κj);
          κj.abs(bits, absκ);
          assertTrue("κ(" + j + ") must be ~0 when ν=0, got " + κj, absκ.compareTo(κtol) < 0);
        }
      }

      // (b) pull GBS out of the pricing context and evaluate it at
      // k = log(K/S₀), then compare to the full pricer output. Both share
      // m, σ, σ² so the only difference can come from the ΔC_j sum, which
      // must be 0 here. The pricing expression takes log-moneyness k as its
      // lambda input — not raw K.
      var gbsMapping = pricer.pricingContext.getFunctionMapping("GBS");
      assertNotNull("GBS function must be registered in pricingContext", gbsMapping);
      RealFunction GBS = (RealFunction) gbsMapping.instance;
      assertNotNull("GBS instance must be non-null", GBS);

      try ( Real kLog = pricer.K.borrowVariable())
      {
        pricer.K.div(pricer.S0, bits, kLog).log(bits, kLog);
        GBS.evaluate(kLog, 1, bits, gbs);
      }

      price.sub(gbs, bits, diff); diff.abs();
      assertTrue("ν=0: pricer.call=" + price + " must match GBS=" + gbs + ", diff=" + diff,
                 diff.compareTo(tolR) < 0);
    }
  }
}
