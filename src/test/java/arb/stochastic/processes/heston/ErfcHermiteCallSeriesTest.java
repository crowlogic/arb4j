package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Verification of the {@link ErfcHermiteCallSeries} single erfc–Hermite series
 * for the European call/put price (docs/single-series-pricing.md §4–§8). Every
 * check is oracle-free — no numerical quadrature — replacing the deleted
 * Edgeworth pricer tests:
 *
 * <ol>
 * <li><b>Black–Scholes certificate</b> (§8): with the proper part {@code ρ≡0} the
 * series collapses to its first term and reproduces the closed-form
 * Black–Scholes price to full precision.</li>
 * <li><b>Put–call parity</b>: {@code C − Π = S₀ − K·e^{−rT}} identically.</li>
 * <li><b>Cayley invariance</b>: the value is independent of the arbitrary
 * contour {@code c} and Cayley scale {@code κ} — the decisive correctness check
 * for the {@code rₘ}/{@code qₙ}/atom/{@code Tₙ} machinery with a non-trivial
 * proper part.</li>
 * <li><b>Reality</b>: the imaginary part of the complex series vanishes
 * (Hermitian symmetry).</li>
 * </ol>
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ErfcHermiteCallSeriesTest extends
                                      TestCase
{
  static final int bits = 256;

  private static Real real(String s)
  {
    return new Real(s, bits);
  }

  private static Real twoPow(int e)
  {
    return new Real().one().mul2e(e);
  }

  /** ρ ≡ 0 (zero numerator, unit denominator). */
  private static ComplexPolynomial zeroProperPartNumerator()
  {
    return new ComplexPolynomial().zero();
  }

  private static ComplexPolynomial unitDenominator()
  {
    return new ComplexPolynomial().one();
  }

  /** r(w) = B/(w − û): numerator {@code [B]}, denominator {@code [−û, 1]}. */
  private static ComplexPolynomial simplePoleNumerator(double B)
  {
    ComplexPolynomial num = new ComplexPolynomial();
    try ( Complex b = new Complex().set(B, 0.0))
    {
      num.set(0, b);
    }
    return num;
  }

  private static ComplexPolynomial simplePoleDenominator(double uhat)
  {
    ComplexPolynomial den = new ComplexPolynomial();
    try ( Complex c0 = new Complex().set(-uhat, 0.0); Complex c1 = new Complex().set(1.0, 0.0))
    {
      den.set(0, c0);
      den.set(1, c1);
    }
    return den;
  }

  /** Closed-form Black–Scholes {@code S₀N(d₁)−Ke^{−rT}N(d₂)} via {@code erfc}. */
  private static Real closedFormBlackScholes(Real S0, Real K, Real rT, Real s2)
  {
    try ( Real sig = new Real(); Real d1 = new Real(); Real d2 = new Real(); Real t = new Real();
          Real Nd1 = new Real(); Real Nd2 = new Real(); Real disc = new Real(); Real result = new Real())
    {
      s2.sqrt(bits, sig);
      S0.div(K, bits, d1);
      d1.log(bits, d1).add(rT, bits, d1).div(sig, bits, d1);   // (ln(S0/K)+rT)/σ
      sig.mul2e(-1, t);
      d1.add(t, bits, d1);                                     // + σ/2
      d1.sub(sig, bits, d2);                                   // d2 = d1 − σ
      normalCdf(d1, Nd1);
      normalCdf(d2, Nd2);
      rT.neg(disc);
      disc.exp(bits, disc);                                    // e^{−rT}
      S0.mul(Nd1, bits, result);                               // S0·N(d1)
      K.mul(disc, bits, t).mul(Nd2, bits, t);                 // K·e^{−rT}·N(d2)
      return result.sub(t, bits, result);
    }
  }

  /** N(x) = ½·erfc(−x/√2). */
  private static void normalCdf(Real x, Real result)
  {
    try ( Real t = new Real(); Real root2 = new Real("2", bits))
    {
      root2.sqrt(bits, root2);
      x.neg(t).div(root2, bits, t).erfc(bits, result);
      result.mul2e(-1, result);
    }
  }

  /**
   * §8 — with ρ≡0 the series is exactly Black–Scholes. Martingale drift μ=σ²/2.
   */
  public void testBlackScholesCertificate()
  {
    try ( Real S0 = real("100"); Real K = real("110"); Real rT = real("0.03");
          Real s2 = real("0.6"); Real mu = new Real(); Real c = real("1.7"); Real kappa = real("1.0"))
    {
      s2.mul2e(-1, mu);
      try ( ErfcHermiteCallSeries series = new ErfcHermiteCallSeries(S0, K, rT, s2, mu, c, kappa,
                                                                     zeroProperPartNumerator(), unitDenominator(), bits);
            Real strike = real("110"); Real got = new Real(); Real want = new Real(); Real diff = new Real();
            Real thr = twoPow(-100))
      {
        series.call(strike, bits, got);
        closedFormBlackScholes(S0, strike, rT, s2).sub(got, bits, diff).abs();
        want.set(closedFormBlackScholes(S0, strike, rT, s2));
        assertTrue("erfc-Hermite call " + got + " must equal Black–Scholes " + want + "; |Δ|=" + diff,
                   diff.compareTo(thr) < 0);
      }
    }
  }

  /** Put–call parity C − Π = S₀ − K·e^{−rT} for a non-trivial proper part. */
  public void testPutCallParity()
  {
    try ( Real S0 = real("100"); Real K = real("110"); Real rT = real("0.03");
          Real s2 = real("0.6"); Real mu = new Real(); Real c = real("1.7"); Real kappa = real("1.0"))
    {
      s2.mul2e(-1, mu);
      try ( ErfcHermiteCallSeries series = new ErfcHermiteCallSeries(S0, K, rT, s2, mu, c, kappa,
                                                                     simplePoleNumerator(0.5), simplePoleDenominator(2.5), bits);
            Real strike = real("110"); Real call = new Real(); Real put = new Real(); Real disc = new Real();
            Real intrinsic = new Real(); Real lhs = new Real(); Real diff = new Real(); Real thr = twoPow(-100))
      {
        series.call(strike, bits, call);
        series.put(strike, bits, put);
        rT.neg(disc);
        disc.exp(bits, disc);
        strike.mul(disc, bits, disc);
        S0.sub(disc, bits, intrinsic);       // S₀ − K·e^{−rT}
        call.sub(put, bits, lhs);            // C − Π
        lhs.sub(intrinsic, bits, diff).abs();
        assertTrue("put–call parity violated: |C−Π−(S₀−Ke^{−rT})|=" + diff, diff.compareTo(thr) < 0);
      }
    }
  }

  /**
   * The value must not depend on the arbitrary contour {@code c} or Cayley scale
   * {@code κ} — the decisive correctness certificate for the whole series
   * machinery with a non-trivial proper part r(w)=½/(w−2.5).
   */
  public void testCayleyInvariance()
  {
    for (String strikeStr : new String[] { "90", "110", "130" })
    {
      Real p1 = priceSinglePole("1.7", "1.0", strikeStr);
      Real p2 = priceSinglePole("1.5", "2.0", strikeStr);
      Real p3 = priceSinglePole("2.2", "0.3", strikeStr);
      try ( Real d12 = new Real(); Real d13 = new Real(); Real thr = twoPow(-30))
      {
        p1.sub(p2, bits, d12).abs();
        p1.sub(p3, bits, d13).abs();
        assertTrue("Cayley (c,κ) dependence at K=" + strikeStr + ": |Δ|=" + d12, d12.compareTo(thr) < 0);
        assertTrue("Cayley (c,κ) dependence at K=" + strikeStr + ": |Δ|=" + d13, d13.compareTo(thr) < 0);
      }
      p1.close();
      p2.close();
      p3.close();
    }
  }

  /** The imaginary part of the complex series vanishes (Hermitian symmetry). */
  public void testImaginaryPartVanishes()
  {
    try ( Real S0 = real("100"); Real K = real("110"); Real rT = real("0.03");
          Real s2 = real("0.6"); Real mu = new Real(); Real c = real("1.7"); Real kappa = real("1.0"))
    {
      s2.mul2e(-1, mu);
      try ( ErfcHermiteCallSeries series = new ErfcHermiteCallSeries(S0, K, rT, s2, mu, c, kappa,
                                                                     simplePoleNumerator(0.5), simplePoleDenominator(2.5), bits);
            Complex value = new Complex(); Real mag = new Real(); Real thr = twoPow(-30))
      {
        series.K.set(real("110"));
        series.context.invalidateAllCaches();
        series.series.evaluate(bits, value);
        value.im().abs(bits, mag);
        assertTrue("imaginary part of the series must vanish; |Im|=" + mag, mag.compareTo(thr) < 0);
      }
    }
  }

  private static Real priceSinglePole(String cStr, String kappaStr, String strikeStr)
  {
    try ( Real S0 = real("100"); Real K = real("110"); Real rT = real("0.03");
          Real s2 = real("0.6"); Real mu = new Real(); Real c = real(cStr); Real kappa = real(kappaStr))
    {
      s2.mul2e(-1, mu);
      try ( ErfcHermiteCallSeries series = new ErfcHermiteCallSeries(S0, K, rT, s2, mu, c, kappa,
                                                                     simplePoleNumerator(0.5), simplePoleDenominator(2.5), bits);
            Real strike = real(strikeStr); Real out = new Real())
      {
        series.call(strike, bits, out);
        return new Real().set(out);
      }
    }
  }
}
