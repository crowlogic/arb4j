package arb.stochastic.processes.heston;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Verifies {@link RoughHestonCall}, the single absolutely-convergent
 * erfc–Hermite series pricer of {@code docs/single-series-pricing.md}, against
 * the only admissible (exact, quadrature-free) references:
 *
 * <ol>
 * <li>the pole-free series is EXACTLY Black–Scholes (§8), and</li>
 * <li>the with-poles price is independent of the free Cayley scale {@code κ}
 * (an exact internal identity, since {@code κ} is our arbitrary choice).</li>
 * </ol>
 *
 * Expected constants come from the mpmath oracle
 * {@code scripts/verify_single_series_pricer.py} (dps=50): the pole-free price
 * is {@code 27.894487905295177708} (identical to closed-form Black–Scholes to
 * 8.55e-50) and the with-poles price is {@code 8.03161389324968443}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonCallTest
{
  private static final int BITS = 128;

  /** Discounted log-moneyness k̃ = log(K/S₀) − rT for S₀=100, K=110, rT=0.03. */
  private static Real logMoneyness(Real K, Real rT)
  {
    Real ktil = new Real();
    try ( Real S0 = new Real())
    {
      S0.set("100", BITS);
      K.div(S0, BITS, ktil);
      ktil.log(BITS, ktil).sub(rT, BITS, ktil);
    }
    return ktil;
  }

  /**
   * (1) Pole-free single series ≡ closed-form Black–Scholes (single-series §8).
   */
  @Test
  public void testBlackScholesCertificate()
  {
    try ( Real σT2  = new Real("0.6", BITS);
          Real μT   = new Real();
          Real K    = new Real("110", BITS);
          Real rT   = new Real("0.03", BITS);
          Real c    = new Real("1.5", BITS);
          Real κ    = new Real("1", BITS);
          Real ktil = logMoneyness(K, rT);
          Real bs   = new Real();
          Real price= new Real())
    {
      σT2.mul2e(-1, μT);   // μ_T = ½σ_T² (martingale centring)

      blackScholes(σT2, K, rT, ktil, bs);

      try ( RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ, null, null))
      {
        call.price(BITS, price);
      }

      assertClose("pole-free single series == Black–Scholes", price, bs, "1e-30");
    }
  }

  /**
   * (2) With four conjugate-pair poles the price is independent of the free
   * Cayley scale κ (exact identity), and equals the oracle value
   * 8.03161389324968443.
   */
  @Test
  public void testKappaIndependenceAndValue()
  {
    try ( Real σT2  = new Real("0.6", BITS);
          Real μT   = new Real();
          Real K    = new Real("110", BITS);
          Real rT   = new Real("0.03", BITS);
          Real c    = new Real("1.75", BITS);   // 1 + (min Re u − 1)/2 = 1 + (2.5−1)/2
          Real ktil = logMoneyness(K, rT);
          Complex u = Complex.newVector(4);
          Complex B = Complex.newVector(4);
          Real p1   = new Real();
          Real p16  = new Real();
          Real ref  = new Real("8.03161389324968442512330094788472720828666461", BITS))
    {
      σT2.mul2e(-1, μT);

      setPole(u, B, 0, "2.5",  "0.3",  "0.5",  "0.2");
      setPole(u, B, 1, "2.5", "-0.3",  "0.5", "-0.2");
      setPole(u, B, 2, "4.1",  "0.7", "-0.3",  "0.1");
      setPole(u, B, 3, "4.1", "-0.7", "-0.3", "-0.1");

      try ( Real κ1 = new Real("1",   BITS);
            RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ1, u, B))
      {
        call.price(BITS, p1);
      }
      try ( Real κ16 = new Real("1.6", BITS);
            RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ16, u, B))
      {
        call.price(BITS, p16);
      }

      assertClose("κ-independence: C(κ=1.0) == C(κ=1.6)", p1, p16, "1e-20");
      assertClose("with-poles price matches the exact oracle value", p1, ref, "1e-20");
    }
  }

  // ── helpers ──────────────────────────────────────────────────────────────

  private static void setPole(Complex u, Complex B, int j, String ure, String uim, String bre, String bim)
  {
    u.get(j).re().set(ure, BITS);
    u.get(j).im().set(uim, BITS);
    B.get(j).re().set(bre, BITS);
    B.get(j).im().set(bim, BITS);
  }

  /** Closed-form Black–Scholes call C = S₀·Φ(d₁) − K·e^{−rT}·Φ(d₂) with S₀=100. */
  private static void blackScholes(Real σT2, Real K, Real rT, Real ktil, Real res)
  {
    try ( Real S0 = new Real("100", BITS);
          Real σ  = new Real();
          Real d1 = new Real();
          Real d2 = new Real();
          Real a  = new Real();
          Real Nd1= new Real();
          Real Nd2= new Real();
          Real disc = new Real())
    {
      σT2.sqrt(BITS, σ);
      // −k̃ = log(S₀/K) + rT ; d1 = (−k̃)/σ + σ/2 ; d2 = d1 − σ
      ktil.neg(a);
      a.div(σ, BITS, d1);
      σ.mul2e(-1, a);
      d1.add(a, BITS, d1);
      d1.sub(σ, BITS, d2);
      normalCdf(d1, Nd1);
      normalCdf(d2, Nd2);
      rT.neg(disc);
      disc.exp(BITS, disc).mul(K, BITS, disc);   // K·e^{−rT}
      S0.mul(Nd1, BITS, res);
      disc.mul(Nd2, BITS, disc);
      res.sub(disc, BITS, res);
    }
  }

  /** Φ(x) = ½·erfc(−x/√2). */
  private static void normalCdf(Real x, Real res)
  {
    try ( Real t = new Real())
    {
      x.neg(t);
      t.div(RealConstants.sqrt2, BITS, t);
      t.erfc(BITS, res);
      res.mul2e(-1, res);
    }
  }

  private static void assertClose(String what, Real got, Real expected, String tol)
  {
    try ( Real diff = new Real();
          Real bound= new Real(tol, BITS))
    {
      got.sub(expected, BITS, diff);
      diff.abs(BITS, diff);
      assertTrue(what + ": |got − expected| = " + diff + " (got=" + got + ", expected=" + expected + ")",
                 diff.compareTo(bound) <= 0);
    }
  }
}
