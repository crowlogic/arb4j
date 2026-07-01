package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Correctness certificates for the single erfc–Hermite series call price
 * {@link RoughHestonCall} (docs/single-series-pricing.md). None of these tests
 * uses numerical integration: every assertion is against an exact closed form or
 * an exact internal invariance.
 *
 * <ul>
 * <li>{@link #testBlackScholesIsTheZerothTerm()} — with no proper part
 * ({@code ρ≡0}) and the martingale drift {@code μ_T=½σ_T²}, the price collapses
 * to its {@code n=0} term and must equal Black–Scholes exactly (§8).</li>
 * <li>{@link #testKappaIndependence()} — the Cayley scale {@code κ} is an
 * arbitrary choice; the price cannot depend on it (§5–§6).</li>
 * </ul>
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCallTest extends
                                TestCase
{
  static final int bits = 256;

  private static Real twoPow(int e)
  {
    Real t = new Real();
    t.one().mul2e(e);
    return t;
  }

  /** N(x) = ½·erfc(−x/√2). */
  private static Real normalCdf(Real x, Real res)
  {
    try ( Real t = new Real())
    {
      x.div(RealConstants.sqrt2, bits, t).neg(t);
      t.erfc(bits, res);
      res.mul2e(-1, res);
    }
    return res;
  }

  /**
   * §8: when the proper part vanishes the one series is its {@code n=0} term,
   * {@code C = S₀N(d₁) − Ke^{−rT}N(d₂)} with
   * {@code d_{1,2}=(log(S₀/K)+rT)/σ_T ± σ_T/2}. Exact to working precision.
   */
  public void testBlackScholesIsTheZerothTerm()
  {
    try ( Real σT2  = new Real("0.6", bits);
          Real σT   = new Real();
          Real μT   = new Real();
          Real K    = new Real("110", bits);
          Real S0   = new Real("100", bits);
          Real rT   = new Real("0.03", bits);
          Real ktil = new Real();
          Real c    = new Real("1.5", bits);
          Real κ    = new Real("1.0", bits);
          Real price = new Real();
          Real bs    = new Real();
          Real d1    = new Real();
          Real d2    = new Real();
          Real Nd1   = new Real();
          Real Nd2   = new Real();
          Real disc  = new Real();
          Real tmp   = new Real();
          Real err   = new Real();
          Real thr   = twoPow(-100))
    {
      σT2.sqrt(bits, σT);
      // martingale drift μ_T = ½σ_T²
      σT2.mul2e(-1, μT);
      // k̃ = log(K/S₀) − rT
      K.div(S0, bits, ktil).log(bits, ktil).sub(rT, bits, ktil);

      // price via the pole-free single series
      try ( RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ, null, null))
      {
        call.price(bits, price);
      }

      // Black–Scholes closed form.
      // base = (log(S₀/K) + rT)/σ_T
      S0.div(K, bits, tmp).log(bits, tmp).add(rT, bits, tmp).div(σT, bits, tmp);
      σT.mul2e(-1, d1);        // σ_T/2
      d2.set(tmp).sub(d1, bits, d2);
      d1.add(tmp, bits, d1);   // d1 = base + σ_T/2
      normalCdf(d1, Nd1);
      normalCdf(d2, Nd2);
      rT.neg(disc);
      disc.exp(bits, disc).mul(K, bits, disc); // Ke^{−rT}
      S0.mul(Nd1, bits, bs);
      disc.mul(Nd2, bits, tmp);
      bs.sub(tmp, bits, bs);

      price.sub(bs, bits, err).abs(bits, err);
      assertTrue("erfc–Hermite n=0 term must equal Black–Scholes; C=" + price + " BS=" + bs + " |Δ|=" + err,
                 err.compareTo(thr) < 0);
    }
  }

  /**
   * §5–§6: the price is independent of the Cayley scale {@code κ}. Build a
   * conjugate pole pair {@code u={a±bi}} with residues {@code B={β,conj(β)}}
   * (Hermitian symmetry ⇒ real price), all with {@code Re u > c}, and read the
   * price at two different κ; they must agree.
   */
  public void testKappaIndependence()
  {
    try ( Real σT2  = new Real("0.6", bits);
          Real μT   = new Real("0.3", bits);
          Real K    = new Real("110", bits);
          Real rT   = new Real("0.03", bits);
          Real ktil = new Real("-0.1", bits);
          Real c    = new Real("1.5", bits);
          Complex u = Complex.newVector(2);
          Complex B = Complex.newVector(2);
          Real p1   = new Real();
          Real p2   = new Real();
          Real err  = new Real();
          Real thr  = twoPow(-60))
    {
      // poles a±bi with Re=3.0 > c, residues β, conj(β)
      u.get(0).set(3.0, 0.8);
      u.get(1).set(3.0, -0.8);
      B.get(0).set(0.05, 0.02);
      B.get(1).set(0.05, -0.02);

      try ( Real κ1 = new Real("1.0", bits);
            RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ1, u, B))
      {
        call.price(bits, p1);
      }
      try ( Real κ2 = new Real("1.7", bits);
            RoughHestonCall call = new RoughHestonCall(σT2, μT, K, rT, ktil, c, κ2, u, B))
      {
        call.price(bits, p2);
      }

      p1.sub(p2, bits, err).abs(bits, err);
      assertTrue("price must be independent of the Cayley scale κ; C(κ=1)=" + p1 + " C(κ=1.7)=" + p2 + " |Δ|=" + err,
                 err.compareTo(thr) < 0);
    }
  }

  /**
   * The model bridge {@link RoughHestonCharacteristicFunction#partialFractionExpansion}
   * forms the {@code [2M+2/2M]} Padé-in-{@code v} of Φ(v,T) and splits it by one
   * Euclidean division. This certifies the pipeline executes end-to-end and that
   * the Gaussian symbol read off the quotient satisfies {@code σ_T² > 0} (§3.1),
   * producing {@code 2M} poles.
   */
  public void testModelRepresentationIsAdmissible()
  {
    int M = 3, workBits = 200;
    try ( var cf = new RoughHestonCharacteristicFunction())
    {
      RoughHestonPartialFractionExpansion pfe = cf.partialFractionExpansion(M, workBits);
      try
      {
        assertTrue("σ_T² must be strictly positive; got " + pfe.σT2, pfe.σT2.sign() > 0);
        assertEquals("Padé denominator degree 2M ⇒ 2M poles", 2 * M, pfe.u.dim);
        assertEquals("residue count matches pole count", pfe.u.dim, pfe.A.dim);
      }
      finally
      {
        pfe.close();
      }
    }
  }
}
