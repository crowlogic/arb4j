package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * European call/put prices under the rough Heston model, evaluated in closed
 * form from the partial-fraction data (σ_T², μ_T, {u_j}, {A_j}) of the
 * [2M+2/2M] Padé representation of the cumulant generating function Φ(v,T) —
 * the characteristic function itself is never evaluated.
 *
 * <p>
 * With Φ_M(u) = −½σ_T²u² − iμ_T·u + ρ(u), ρ proper rational with poles off the
 * Lewis line, the call is the single absolutely convergent erfc–Hermite series
 * (docs/single-series-pricing.md §4–§8)
 *
 * <pre>
 *   C_M = K·e^{−rT}·Σ_{n=0..∞} q_n·(T_n^{(1)} − T_n^{(0)})
 * </pre>
 *
 * whose stopping rule is the a-priori geometric majorant τ(N); the returned
 * ball is the partial sum widened by τ(N) ≤ 2^{−bits} — a certified enclosure.
 * The pole-free case collapses to Black–Scholes exactly. Successive Padé
 * orders M are compared and the evaluation returns when consecutive certified
 * prices agree within 2^{−bits}, per the Padé a-posteriori criterion; there is
 * no cap on M or on the series index.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonOptionPricer implements
                                      AutoCloseable
{
  public final RoughHestonCharacteristicFunction φ;

  public final Real                              S0;

  public final Real                              K;

  public final Real                              rr;

  private final boolean                          ownsParameters;

  public RoughHestonOptionPricer()
  {
    this.φ              = new RoughHestonCharacteristicFunction();
    this.S0             = new Real("1",
                                   128).setName("S0");
    this.rr             = new Real("0",
                                   128).setName("rr");
    this.K              = new Real("1",
                                   128);
    this.ownsParameters = true;
  }

  public RoughHestonOptionPricer(RoughHestonCharacteristicFunction φ, Real S0, Real rr, Real K)
  {
    this.φ              = φ;
    this.S0             = S0;
    this.rr             = rr;
    this.K              = K;
    this.ownsParameters = false;
  }

  /**
   * The call at strike {@code strike}: adaptive in the Padé order M — returns
   * at the first M where consecutive certified prices agree within 2^{−bits},
   * widened by that difference.
   */
  public Real call(Real strike, int bits, Real dst)
  {
    try ( Real previous = new Real(); Real gap = new Real(); Real target = new Real())
    {
      target.one().mul2e(-bits, target);
      boolean have = false;
      for (int M = 1;; M++)
      {
        try ( RoughHestonPartialFractionExpansion pfe = φ.partialFractionExpansion(M, bits))
        {
          if (!pfe.admissible())
          {
            continue;
          }
          callFromExpansion(pfe, strike, bits, dst);
        }
        if (have)
        {
          dst.sub(previous, bits, gap).abs();
          if (gap.compareTo(target) <= 0)
          {
            arblib.arb_add_error(dst, gap);
            return dst;
          }
        }
        previous.set(dst);
        have = true;
      }
    }
  }

  public Real call(int bits, Real dst)
  {
    return call(K, bits, dst);
  }

  /** The put via parity P = C − S0 + K·e^{−rT}, exact because φ(0)=φ(−i)=1. */
  public Real put(Real strike, int bits, Real dst)
  {
    call(strike, bits, dst);
    try ( Real discounted = new Real())
    {
      rr.neg(discounted);
      discounted.exp(bits, discounted).mul(strike, bits, discounted);
      dst.sub(S0, bits, dst).add(discounted, bits, dst);
      return dst;
    }
  }

  /**
   * The single-series price at one fixed Padé order, from the v-plane
   * partial-fraction data. The w-plane data is w_j = i·u_j (Re w_j = −Im u_j
   * &gt; 0), B_j = i·A_j; the Lewis abscissa c is placed midway between the
   * kernel pole at 1 and the nearest exponent pole, refusing the input on
   * moment explosion (min Re w_j ≤ 1).
   */
  public Real callFromExpansion(RoughHestonPartialFractionExpansion pfe, Real strike, int bits, Real dst)
  {
    int p = pfe.u.dim();
    try ( Complex w = Complex.newVector(p); Complex B = Complex.newVector(p);
          Real minRe = new Real(); Real c = new Real(); Real κc = new Real(); Real ktil = new Real())
    {
      minRe.posInf();
      for (int j = 0; j < p; j++)
      {
        pfe.u.get(j).im().neg(w.get(j).re());
        w.get(j).im().set(pfe.u.get(j).re());
        pfe.A.get(j).im().neg(B.get(j).re());
        B.get(j).im().set(pfe.A.get(j).re());
        if (w.get(j).re().compareTo(minRe) < 0)
          minRe.set(w.get(j).re());
      }
      if (p > 0 && minRe.compareTo(RealConstants.one) <= 0)
        throw new ArithmeticException("moment explosion: nearest exponent pole Re w = " + minRe + " ≤ 1");
      if (p > 0)
        c.set(minRe).add(1, bits, c).mul2e(-1, c);
      else
        c.set(3).mul2e(-1, c);
      c.sub(1, bits, κc).mul2e(-1, κc);

      strike.div(S0, bits, ktil).log(bits, ktil).sub(rr, bits, ktil);
      return lewisSingleSeries(pfe.σT2, pfe.μT, strike, rr, ktil, c, κc, p == 0 ? null : w, p == 0 ? null : B, bits, dst);
    }
  }

  /**
   * The Lewis line integral C = (K·e^{−rT}/2πi)∫ e^{g(w)}ψ(w)/(w(w−1))dw as
   * the single erfc–Hermite series over the Cayley-compactified proper part:
   * kernel evaluations at the fixed nodes {0, 1, q}, q = c + κ; Maclaurin
   * data of ψ = e^{R} by the exp-of-a-series recurrence n·q_n = Σ m·r_m·q_{n−m};
   * a-priori geometric tail majorant as the stopping rule and ball radius.
   * Poles {@code w}/residues {@code B} null means ρ ≡ 0 (exact Black–Scholes).
   */
  public static Real lewisSingleSeries(Real σT2, Real μT, Real K, Real rT, Real ktil, Real c, Real κ,
                                       Complex w, Complex B, int bits, Real res)
  {
    if (σT2.sign() <= 0)
      throw new ArithmeticException("σ_T² must be strictly positive; got " + σT2);
    final int p = w == null ? 0 : w.dim();

    try ( Real ξ = new Real(); Real discount = new Real(); Real σ = new Real(); Real q = new Real();
          Real target = new Real())
    {
      ktil.add(μT, bits, ξ);
      rT.neg(discount);
      discount.exp(bits, discount).mul(K, bits, discount);
      σT2.sqrt(bits, σ);
      c.add(κ, bits, q);
      target.one().mul2e(-bits, target);

      final int span = (p == 0) ? 0 : 4 * bits + 64;

      try ( Real E0 = new Real(); Real E1 = new Real(); Real Aq = Real.newVector(Math.max(1, span + 1)))
      {
        KernelChain kernel = new KernelChain(σT2,
                                             σ,
                                             ξ,
                                             c,
                                             bits,
                                             span + 1);
        kernel.derivative(1, RealConstants.zero, E0);
        kernel.derivative(1, RealConstants.one, E1);
        for (int m = 1; m <= span + 1; m++)
          kernel.derivative(m, q, Aq.get(m - 1));

        try ( Complex qn = Complex.newVector(span + 1))
        {
          exponentialSeries(qn, w, B, c, κ, bits, span);

          try ( Real G01 = new Real(); Real R = new Real(); Real Rinv = new Real(); Real normPsi = new Real();
                Real tauC = new Real(); Real τ = new Real())
          {
            contourBound(σT2, σ, ξ, c, bits, G01);
            if (p == 0)
            {
              τ.zero();
            }
            else
            {
              majorantRadius(w, B, c, κ, bits, R, Rinv, normPsi);
              tauC.set(discount).mul(G01, bits, tauC).mul(normPsi, bits, tauC);
              try ( Real oneMinus = new Real())
              {
                oneMinus.one().sub(Rinv, bits, oneMinus);
                tauC.div(oneMinus, bits, tauC);
              }
            }

            try ( Complex acc = new Complex(); Complex term = new Complex(); Real diff = new Real();
                  Real T0 = new Real(); Real T1 = new Real(); Real Rpow = new Real())
            {
              acc.zero();
              Rpow.one();
              for (int n = 0; n <= span; n++)
              {
                termIntegral(n, 0, E0, Aq, q, κ, bits, T0);
                termIntegral(n, 1, E1, Aq, q, κ, bits, T1);
                T1.sub(T0, bits, diff);
                qn.get(n).mul(diff, bits, term);
                acc.add(term, bits, acc);
                if (p == 0)
                {
                  break;
                }
                Rpow.mul(Rinv, bits, Rpow);
                τ.set(tauC).mul(Rpow, bits, τ);
                if (τ.compareTo(target) <= 0)
                  break;
              }
              acc.mul(discount, bits, acc);
              res.set(acc.re());
              arblib.arb_add_error(res, τ);
              return res;
            }
          }
        }
      }
    }
  }

  /** q_0 = e^{r_0}; n·q_n = Σ_{m=1..n} m·r_m·q_{n−m}. */
  private static void exponentialSeries(Complex qn, Complex w, Complex B, Real c, Real κ, int bits, int span)
  {
    final int p = w == null ? 0 : w.dim();
    if (p == 0)
    {
      qn.get(0).one();
      for (int n = 1; n <= span; n++)
        qn.get(n).zero();
      return;
    }
    try ( Complex r = Complex.newVector(span + 1))
    {
      cayleySeries(r, w, B, c, κ, bits, span);
      r.get(0).exp(bits, qn.get(0));
      try ( Complex s = new Complex(); Complex t = new Complex())
      {
        for (int n = 1; n <= span; n++)
        {
          s.zero();
          for (int m = 1; m <= n; m++)
          {
            r.get(m).mul(qn.get(n - m), bits, t);
            t.mul(m, bits, t);
            s.add(t, bits, s);
          }
          s.div(n, bits, qn.get(n));
        }
      }
    }
  }

  /**
   * Maclaurin data of R(ζ) = ρ(w(ζ)): with a_j = c−κ−w_j, b_j = c+κ−w_j,
   * ρ_j = b_j/a_j: r_0 = Σ B_j/a_j, r_m = Σ (B_j/a_j)·ρ_j^{m−1}(ρ_j−1).
   */
  private static void cayleySeries(Complex r, Complex w, Complex B, Real c, Real κ, int bits, int span)
  {
    try ( Complex a = new Complex(); Complex b = new Complex(); Complex rho = new Complex();
          Complex Ba = new Complex(); Complex rhoP = new Complex(); Complex rm1 = new Complex();
          Complex t = new Complex(); Real cmk = new Real(); Real cpk = new Real())
    {
      c.sub(κ, bits, cmk);
      c.add(κ, bits, cpk);
      for (int m = 0; m <= span; m++)
        r.get(m).zero();
      for (int j = 0; j < w.dim(); j++)
      {
        a.set(w.get(j)).neg(a);
        a.re().add(cmk, bits, a.re());
        b.set(w.get(j)).neg(b);
        b.re().add(cpk, bits, b.re());
        B.get(j).div(a, bits, Ba);
        b.div(a, bits, rho);
        rho.sub(1, bits, rm1);
        r.get(0).add(Ba, bits, r.get(0));
        rhoP.one();
        for (int m = 1; m <= span; m++)
        {
          Ba.mul(rhoP, bits, t);
          t.mul(rm1, bits, t);
          r.get(m).add(t, bits, r.get(m));
          rhoP.mul(rho, bits, rhoP);
        }
      }
    }
  }

  /**
   * T_n^{(δ)} = E(δ) + Σ_{k=1..n} C(n,k)(2κ)^k·[Σ_{m=1..k}(−1)^{k−m}(q−δ)^{−(k−m+1)}·A_m(q)
   * + (δ−q)^{−k}·E(δ)].
   */
  private static void termIntegral(int n, int delta, Real Edelta, Real Aq, Real q, Real κ, int bits, Real res)
  {
    res.set(Edelta);
    if (n == 0)
      return;
    try ( Real qmd = new Real(); Real dmq = new Real(); Real binom = new Real(); Real twoκ = new Real();
          Real s = new Real(); Real coef = new Real(); Real acc = new Real(); Real qmdPow = new Real())
    {
      q.sub(delta, bits, qmd);
      dmq.set(qmd).neg(dmq);
      κ.mul(2, bits, twoκ);
      binom.set(twoκ).mul(n, bits, binom);
      for (int k = 1; k <= n; k++)
      {
        s.zero();
        for (int m = 1; m <= k; m++)
        {
          int e = k - m + 1;
          qmd.pow(e, bits, qmdPow);
          coef.set(Aq.get(m - 1)).div(qmdPow, bits, coef);
          if (((k - m) & 1) != 0)
            coef.neg(coef);
          s.add(coef, bits, s);
        }
        dmq.pow(k, bits, qmdPow);
        coef.set(Edelta).div(qmdPow, bits, coef);
        s.add(coef, bits, s);
        s.mul(binom, bits, acc);
        res.add(acc, bits, res);
        if (k < n)
        {
          binom.mul(n - k, bits, binom);
          binom.div(k + 1, bits, binom);
          binom.mul(twoκ, bits, binom);
        }
      }
    }
  }

  /** G_0 + G_1 ≤ e^{σ_T²c²/2 − cξ}/(σ√(2π))·(1/|c−1| + 1/|c|). */
  private static void contourBound(Real σT2, Real σ, Real ξ, Real c, int bits, Real res)
  {
    try ( Real base = new Real(); Real e = new Real(); Real t = new Real())
    {
      c.mul(c, bits, t);
      t.mul(σT2, bits, t).mul2e(-1, t);
      c.mul(ξ, bits, e);
      t.sub(e, bits, t);
      t.exp(bits, t);
      base.set(σ).mul(RealConstants.sqrt2π, bits, base);
      t.div(base, bits, base);
      res.zero();
      t.set(c).sub(1, bits, t).abs(bits, t);
      base.div(t, bits, e);
      res.add(e, bits, res);
      t.set(c).abs(bits, t);
      base.div(t, bits, e);
      res.add(e, bits, res);
    }
  }

  /** R = (1+R₀)/2 with R₀ = 1/max_j|ρ_j|; ‖ψ‖_R ≤ exp(Σ_j|B_j|(1+R)/(|a_j|−|b_j|R)). */
  private static void majorantRadius(Complex w, Complex B, Real c, Real κ, int bits, Real R, Real Rinv, Real normPsi)
  {
    try ( Complex a = new Complex(); Complex b = new Complex(); Real cmk = new Real(); Real cpk = new Real();
          Real absa = new Real(); Real absb = new Real(); Real absB = new Real(); Real ratio = new Real();
          Real maxRho = new Real(); Real R0 = new Real(); Real onePlusR = new Real(); Real denom = new Real();
          Real t = new Real(); Real sum = new Real())
    {
      c.sub(κ, bits, cmk);
      c.add(κ, bits, cpk);
      maxRho.zero();
      for (int j = 0; j < w.dim(); j++)
      {
        a.set(w.get(j)).neg(a);
        a.re().add(cmk, bits, a.re());
        b.set(w.get(j)).neg(b);
        b.re().add(cpk, bits, b.re());
        a.abs(bits, absa);
        b.abs(bits, absb);
        absb.div(absa, bits, ratio);
        if (ratio.compareTo(maxRho) > 0)
          maxRho.set(ratio);
      }
      R0.one().div(maxRho, bits, R0);
      R.one().add(R0, bits, R).mul2e(-1, R);
      Rinv.one().div(R, bits, Rinv);
      onePlusR.one().add(R, bits, onePlusR);
      sum.zero();
      for (int j = 0; j < w.dim(); j++)
      {
        a.set(w.get(j)).neg(a);
        a.re().add(cmk, bits, a.re());
        b.set(w.get(j)).neg(b);
        b.re().add(cpk, bits, b.re());
        a.abs(bits, absa);
        b.abs(bits, absb);
        B.get(j).abs(bits, absB);
        absb.mul(R, bits, denom);
        absa.sub(denom, bits, denom);
        absB.mul(onePlusR, bits, t);
        t.div(denom, bits, t);
        sum.add(t, bits, sum);
      }
      sum.exp(bits, normPsi);
    }
  }

  /**
   * The kernel chain E(w) = ½e^{g(w)}erfc(z_w) − 1_{w&gt;c}e^{g(w)} and its
   * scaled derivatives A_m(w) = ∂_w^{m−1}E(w)/(m−1)!, g(w) = ½σ_T²w² − wξ,
   * z_w = (ξ−σ_T²w)/(σ_T√2), carried as the polynomial recurrence
   * P_{k+1} = P_k' + g'·P_k (so ∂^k e^g = e^g·P_k) paired with the physicists'
   * Hermite three-term recurrence — polynomial algebra throughout.
   */
  private static final class KernelChain
  {
    final Real             σT2;
    final Real             σ;
    final Real             ξ;
    final Real             c;
    final int              bits;
    final Real             gauss;
    final RealPolynomial   gp;
    final RealPolynomial[] P;

    KernelChain(Real σT2, Real σ, Real ξ, Real c, int bits, int order)
    {
      this.σT2  = σT2;
      this.σ    = σ;
      this.ξ    = ξ;
      this.c    = c;
      this.bits = bits;

      this.gauss = new Real();
      try ( Real t = new Real())
      {
        ξ.mul(ξ, bits, t);
        t.div(σT2, bits, t).mul2e(-1, t).neg(t);
        t.exp(bits, t);
        t.div(RealConstants.sqrtπ, bits, gauss);
      }

      this.gp = new RealPolynomial(2);
      gp.set(0, ξ.neg(new Real()));
      gp.set(1, σT2);

      this.P    = new RealPolynomial[Math.max(1, order)];
      P[0] = new RealPolynomial(1);
      P[0].set(0, RealConstants.one);
      for (int k = 1; k < P.length; k++)
      {
        RealPolynomial deriv = P[k - 1].derivative();
        RealPolynomial prod  = gp.mul(P[k - 1], bits, new RealPolynomial(1));
        P[k] = deriv.add(prod, bits, new RealPolynomial(1));
        deriv.close();
        prod.close();
      }
    }

    private Real g(Real w, Real res)
    {
      try ( Real t = new Real())
      {
        w.mul(w, bits, res);
        res.mul(σT2, bits, res).mul2e(-1, res);
        w.mul(ξ, bits, t);
        res.sub(t, bits, res);
      }
      return res;
    }

    private Real z(Real w, Real res)
    {
      try ( Real t = new Real())
      {
        w.mul(σT2, bits, t);
        ξ.sub(t, bits, res);
        σ.mul(RealConstants.sqrt2, bits, t);
        res.div(t, bits, res);
      }
      return res;
    }

    private Real hermite(int n, Real x, Real res)
    {
      if (n == 0)
        return res.one();
      try ( Real h0 = new Real(); Real h1 = new Real(); Real t = new Real())
      {
        h0.one();
        x.mul(2, bits, h1);
        if (n == 1)
          return res.set(h1);
        for (int k = 1; k < n; k++)
        {
          x.mul(2, bits, t).mul(h1, bits, t);
          h0.mul(2 * k, bits, h0);
          t.sub(h0, bits, res);
          h0.set(h1);
          h1.set(res);
        }
        return res;
      }
    }

    Real derivative(int m, Real w, Real res)
    {
      final int m1 = m - 1;
      try ( Real eg = new Real(); Real zw = new Real(); Real ec = new Real(); Real ind = new Real();
            Real term0 = new Real(); Real s = new Real(); Real Pval = new Real(); Real Hval = new Real();
            Real sfac = new Real(); Real binom = new Real(); Real coef = new Real(); Real fact = new Real())
      {
        g(w, eg);
        eg.exp(bits, eg);
        z(w, zw);
        zw.erfc(bits, ec);
        if (w.compareTo(c) > 0)
          ind.set(eg);
        else
          ind.zero();
        P[m1].evaluate(w, 1, bits, Pval);
        term0.set(eg).mul(Pval, bits, term0).mul2e(-1, term0).mul(ec, bits, term0);
        try ( Real t = new Real())
        {
          ind.mul(Pval, bits, t);
          term0.sub(t, bits, term0);
        }
        s.zero();
        σ.div(RealConstants.sqrt2, bits, coef);
        sfac.one();
        for (int j = 1; j <= m1; j++)
        {
          sfac.mul(coef, bits, sfac);
          binomial(m1, j, binom);
          P[m1 - j].evaluate(w, 1, bits, Pval);
          hermite(j - 1, zw, Hval);
          fact.set(binom).mul(sfac, bits, fact).mul(Pval, bits, fact).mul(Hval, bits, fact);
          s.add(fact, bits, s);
        }
        s.mul(gauss, bits, s);
        res.set(term0).add(s, bits, res);
        factorial(m1, fact);
        res.div(fact, bits, res);
        return res;
      }
    }

    private void binomial(int n, int k, Real res)
    {
      res.one();
      for (int i = 0; i < k; i++)
      {
        res.mul(n - i, bits, res);
        res.div(i + 1, bits, res);
      }
    }

    private void factorial(int n, Real res)
    {
      res.one();
      for (int i = 2; i <= n; i++)
        res.mul(i, bits, res);
    }
  }

  @Override
  public void close()
  {
    if (ownsParameters)
    {
      φ.close();
      S0.close();
      rr.close();
      K.close();
    }
  }
}
