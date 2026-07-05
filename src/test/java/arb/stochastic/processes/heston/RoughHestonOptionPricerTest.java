package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import junit.framework.TestCase;

public class RoughHestonOptionPricerTest extends
                                          TestCase
{
  static final int bits = 256;

  private static Real twoPow(int e)
  {
    Real t = new Real();
    return t.one().mul2e(e, t);
  }

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

  // ρ ≡ 0 collapses the series to its first term, which must equal the
  // Black–Scholes value exactly (to the working-precision ball).
  public void testBlackScholesLimitIsExact()
  {
    try ( RoughHestonOptionPricer pricing = new RoughHestonOptionPricer();
          Real σT2 = new Real("0.6", bits); Real σT = new Real(); Real μT = new Real();
          Real K = new Real("110", bits); Real S0 = new Real("100", bits); Real rT = new Real("0.03", bits);
          Real ktil = new Real(); Real c = new Real("1.5", bits); Real κ = new Real("1", bits);
          Real value = new Real(); Real bs = new Real(); Real d1 = new Real(); Real d2 = new Real();
          Real Nd1 = new Real(); Real Nd2 = new Real(); Real disc = new Real(); Real t = new Real();
          Real err = new Real(); Real thr = twoPow(-100))
    {
      σT2.sqrt(bits, σT);
      σT2.mul2e(-1, μT);
      K.div(S0, bits, ktil).log(bits, ktil).sub(rT, bits, ktil);

      pricing.lewisSingleSeries(σT2, μT, K, rT, ktil, c, κ, null, null, bits, value);

      S0.div(K, bits, t).log(bits, t).add(rT, bits, t).div(σT, bits, t);
      σT.mul2e(-1, d1);
      d2.set(t).sub(d1, bits, d2);
      d1.add(t, bits, d1);
      normalCdf(d1, Nd1);
      normalCdf(d2, Nd2);
      rT.neg(disc);
      disc.exp(bits, disc).mul(K, bits, disc);
      S0.mul(Nd1, bits, bs);
      disc.mul(Nd2, bits, t);
      bs.sub(t, bits, bs);

      value.sub(bs, bits, err).abs();
      assertTrue("C=" + value + " BS=" + bs + " |Δ|=" + err, err.compareTo(thr) < 0);
    }
  }

  // The Cayley scale κ is arbitrary: two evaluations of the same price at
  // different κ must be the same ball value (midpoint difference within the
  // sum of the certified radii).
  public void testCayleyScaleInvariance()
  {
   // assert false : "fix this busted-ass shit, hanging with OOM like an idiot";
    try ( RoughHestonOptionPricer pricing = new RoughHestonOptionPricer();
          Real σT2 = new Real("0.6", bits); Real μT = new Real("0.3", bits); Real K = new Real("105", bits);
          Real S0 = new Real("100", bits); Real rT = new Real("0.02", bits); Real ktil = new Real();
          Real c = new Real("1.4", bits); Real κ1 = new Real("1", bits); Real κ2 = new Real("7/4", bits);
          Real p1 = new Real(); Real p2 = new Real())
    {
      K.div(S0, bits, ktil).log(bits, ktil).sub(rT, bits, ktil);
      try ( Complex w = Complex.newVector(2); Complex B = Complex.newVector(2))
      {
        w.get(0).re().set("3", bits);
        w.get(0).im().set("2", bits);
        w.get(1).re().set("3", bits);
        w.get(1).im().set("-2", bits);
        B.get(0).re().set("1/10", bits);
        B.get(0).im().set("1/20", bits);
        B.get(1).re().set("1/10", bits);
        B.get(1).im().set("-1/20", bits);

        pricing.lewisSingleSeries(σT2, μT, K, rT, ktil, c, κ1, w, B, bits, p1);
        pricing.lewisSingleSeries(σT2, μT, K, rT, ktil, c, κ2, w, B, bits, p2);

        assertTrue("κ-invariance: p1=" + p1 + " p2=" + p2, p1.overlaps(p2));
      }
    }
  }


}
