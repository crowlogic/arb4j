package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.real.RealFunction;

/**
 * European call/put prices under the rough Heston model, evaluated in closed
 * form from the partial-fraction data (σ_T², μ_T, {u_j}, {A_j}) of the
 * [2M+2/2M] Padé representation of the cumulant generating function Φ(v,T) —
 * the characteristic function itself is never evaluated.
 *
 * <p>
 * With Φ_M(u) = −½σ_T²u² − iμ_T·u + ρ(u), ρ proper rational with poles off the
 * Lewis line, the call is the single absolutely convergent erfc–Hermite series
 * (docs/single-series-pricing.md §4–§8, docs/RoughHestonExactPricingReconciliation)
 *
 * <pre>
 *   C_M = K·e^{−rT}·Σ_{n=0..N*} q_n·(T_n^{(1)} − T_n^{(0)})
 * </pre>
 *
 * whose length N* is the exit index of the a-priori geometric tail majorant
 * τ(N) = τC·R^{−(N+1)} — derived from the certified radius data, never an
 * allocation constant — and whose returned ball is the partial sum widened by
 * τ(N) ≤ 2^{−bits}. The pole-free case collapses to Black–Scholes exactly.
 *
 * <p>
 * The mathematics lives in compiled expressions, not Java: the
 * Schwinger–Gauss–erfc function E and its scaled derivative sequence
 *
 * <pre>
 *   E:w ➔ ½·e^{g(w)}·erfc(z(w)) − θ(w−c)·e^{g(w)},   g(w) = ½σ²w² − wξ
 *   A:m ➔ w ➔ when(m=1, E(w), else, diff(A(m-1)(w), w)/(m-1))
 * </pre>
 *
 * are expressions in a per-instance {@link Context} — the derivative chain is
 * the compiler's symbolic {@code diff}, the indicator is the Heaviside θ, and
 * every recurrence is over the compiled sequence index. The Maclaurin data of
 * ψ = e^R is produced by ONE ring operation ({@code acb_poly_exp_series} of
 * the rational R(ζ) = Σ_j (B_j/a_j)(1−ζ)/(1−ρ_jζ) assembled by
 * {@code acb_poly_inv_series}), and its coefficients are read as
 * point-derivatives ψ^{(n)}(0)/n!. Scalars appear only as evaluations of these
 * recursively generated objects.
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

  /** Per-instance expression context for the Lewis-series machinery. */
  public final Context                           lewisContext = new Context();

  /** σ² (Gaussian head variance), a rebindable context variable. */
  public final Real                              σsq          = new Real("1",
                                                                         128).setName("σsq");

  /** ξ = k̃ + μ_T, a rebindable context variable. */
  public final Real                              ξ            = new Real("0",
                                                                         128).setName("ξ");

  /** Lewis abscissa c, a rebindable context variable. */
  public final Real                              cLine        = new Real("3/2",
                                                                         128).setName("cLine");

  /**
   * E(w) = ½e^{g(w)}erfc(z_w) − θ(w−c)e^{g(w)}: the Schwinger–Gauss–erfc
   * function as ONE compiled expression over the context variables σsq, ξ,
   * cLine.
   */
  public final RealFunction            E;

  /**
   * A:m➔w➔diff(E(w),w^(m−1))/Γ(m) — the scaled derivative sequence as ONE
   * compiled expression: the symbolic nth-order {@code diff} owns the entire
   * derivative chain and the sequence caches each order.
   */
  public final RealFunctionSequence    A;

  public RoughHestonOptionPricer()
  {
    this(new RoughHestonCharacteristicFunction(),
         new Real("1",
                  128).setName("S0"),
         new Real("0",
                  128).setName("rr"),
         new Real("1",
                  128),
         true);
  }

  public RoughHestonOptionPricer(RoughHestonCharacteristicFunction φ, Real S0, Real rr, Real K)
  {
    this(φ,
         S0,
         rr,
         K,
         false);
  }

  private RoughHestonOptionPricer(RoughHestonCharacteristicFunction φ, Real S0, Real rr, Real K, boolean owns)
  {
    this.φ              = φ;
    this.S0             = S0;
    this.rr             = rr;
    this.K              = K;
    this.ownsParameters = owns;
    lewisContext.registerVariable(σsq);
    lewisContext.registerVariable(ξ);
    lewisContext.registerVariable(cLine);
    RealFunction.express("g:w➔σsq*w²/2-w*ξ", lewisContext);
    RealFunction.express("z:w➔(ξ-σsq*w)/sqrt(2*σsq)", lewisContext);
    this.E = RealFunction.express("E:w➔exp(g(w))*erfc(z(w))/2-θ(w-cLine)*exp(g(w))", lewisContext);
    this.A = RealFunctionSequence.express("A:m➔w➔diff(E(w),w^(m-1))/Γ(m)", lewisContext);
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
   * the single erfc–Hermite series over the Cayley-compactified proper part.
   * The Schwinger–Gauss–erfc values are evaluations of the compiled {@link #E}
   * and its compiled derivative sequence {@link #A} after rebinding the
   * context variables (σsq, ξ, cLine); the Maclaurin data of ψ = e^R is one
   * {@code acb_poly_exp_series}; the series length is the majorant exit index.
   * Poles {@code w}/residues {@code B} null means ρ ≡ 0 (exact Black–Scholes).
   */
  public Real lewisSingleSeries(Real σT2, Real μT, Real K, Real rT, Real ktil, Real c, Real κ,
                                Complex w, Complex B, int bits, Real res)
  {
    if (σT2.sign() <= 0)
      throw new ArithmeticException("σ_T² must be strictly positive; got " + σT2);
    final int p = w == null ? 0 : w.dim();

    // Rebind the compiled-expression context to this expansion's data.
    σsq.set(σT2);
    ktil.add(μT, bits, ξ);
    cLine.set(c);
    lewisContext.invalidateAllCaches();

    try ( Real discount = new Real(); Real q = new Real(); Real target = new Real();
          Integer m = new Integer())
    {
      rT.neg(discount);
      discount.exp(bits, discount).mul(K, bits, discount);
      c.add(κ, bits, q);
      target.one().mul2e(-bits, target);

      try ( Real G01 = new Real(); Real R = new Real(); Real Rinv = new Real(); Real normPsi = new Real();
            Real tauC = new Real(); Real τ = new Real())
      {
        final int span;
        if (p == 0)
        {
          τ.zero();
          span = 0;
        }
        else
        {
          contourBound(σT2, ξ, c, bits, G01);
          majorantRadius(w, B, c, κ, bits, R, Rinv, normPsi);
          tauC.set(discount).mul(G01, bits, tauC).mul(normPsi, bits, tauC);
          try ( Real oneMinus = new Real())
          {
            oneMinus.one().sub(Rinv, bits, oneMinus);
            tauC.div(oneMinus, bits, tauC);
          }
          span = exitIndex(tauC, R, bits);
        }

        try ( Real E0 = new Real(); Real E1 = new Real(); Real Aq = Real.newVector(span + 1))
        {
          E.evaluate(RealConstants.zero, 1, bits, E0);
          E.evaluate(RealConstants.one, 1, bits, E1);
          for (int order = 1; order <= span + 1; order++)
          {
            m.set(order);
            A.evaluate(m, 1, bits, null).evaluate(q, 1, bits, Aq.get(order - 1));
          }

          try ( ComplexPolynomial ψ = new ComplexPolynomial(); ComplexPolynomial dψ = new ComplexPolynomial();
                Complex origin = new Complex(); Complex qn = new Complex(); Real fact = new Real();
                Complex acc = new Complex(); Complex term = new Complex(); Real diff = new Real();
                Real T0 = new Real(); Real T1 = new Real(); Real Rpow = new Real())
          {
            if (p == 0)
            {
              ψ.fitLength(1);
              ψ.setLength(1);
              ψ.get(0).one();
            }
            else
            {
              exponentialOfCayleySeries(ψ, w, B, c, κ, span + 1, bits);
            }

            acc.zero();
            Rpow.one();
            fact.one();
            for (int n = 0; n <= span; n++)
            {
              // q_n = ψ^{(n)}(0)/n! — point-derivative of the generated series
              ψ.evaluate(origin, 1, bits, qn);
              qn.div(fact, bits, qn);
              termIntegral(n, 0, E0, Aq, q, κ, bits, T0);
              termIntegral(n, 1, E1, Aq, q, κ, bits, T1);
              T1.sub(T0, bits, diff);
              qn.mul(diff, bits, term);
              acc.add(term, bits, acc);
              if (p == 0)
              {
                break;
              }
              Rpow.mul(Rinv, bits, Rpow);
              τ.set(tauC).mul(Rpow, bits, τ);
              if (τ.compareTo(target) <= 0)
                break;
              ψ.differentiate(bits, dψ);
              ψ.set(dψ);
              fact.mul(n + 1, bits, fact);
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

  /**
   * The least N with τC·R^{−(N+1)} ≤ 2^{−bits}: N* = ⌈(log τC + bits·log 2)/log R⌉,
   * derived from the certified majorant data — never an allocation constant.
   */
  private static int exitIndex(Real tauC, Real R, int bits)
  {
    try ( Real num = new Real(); Real den = new Real(); Real two = new Real())
    {
      tauC.log(bits, num);
      two.set(2).log(bits, two).mul(bits, bits, two);
      num.add(two, bits, num);
      R.log(bits, den);
      num.div(den, bits, num);
      int n = (int) Math.ceil(num.doubleValue());
      return Math.max(0, n);
    }
  }

  /**
   * ψ = e^{R(ζ)} as ONE ring operation: R(ζ) = Σ_j (B_j/a_j)·(1−ζ)·(1−ρ_jζ)^{−1}
   * assembled per pole via {@code acb_poly_inv_series} and ring multiplication,
   * then {@code acb_poly_exp_series}. No scalar convolution exists anywhere.
   */
  private static void exponentialOfCayleySeries(ComplexPolynomial ψ, Complex w, Complex B, Real c, Real κ,
                                                int len, int bits)
  {
    try ( ComplexPolynomial R = new ComplexPolynomial(); ComplexPolynomial D = new ComplexPolynomial();
          ComplexPolynomial inv = new ComplexPolynomial(); ComplexPolynomial factor = new ComplexPolynomial();
          ComplexPolynomial termPoly = new ComplexPolynomial();
          Complex a = new Complex(); Complex b = new Complex(); Complex rho = new Complex();
          Complex Ba = new Complex(); Real cmk = new Real(); Real cpk = new Real())
    {
      c.sub(κ, bits, cmk);
      c.add(κ, bits, cpk);
      R.fitLength(len);
      R.setLength(len);

      for (int j = 0; j < w.dim(); j++)
      {
        a.set(w.get(j)).neg(a);
        a.re().add(cmk, bits, a.re());
        b.set(w.get(j)).neg(b);
        b.re().add(cpk, bits, b.re());
        B.get(j).div(a, bits, Ba);
        b.div(a, bits, rho);

        // D(ζ) = 1 − ρ_j·ζ ; inv = D^{−1} mod ζ^len
        D.fitLength(2);
        D.setLength(2);
        D.get(0).one();
        rho.neg(D.get(1));
        arblib.acb_poly_inv_series(inv, D, len, bits);

        // factor(ζ) = (B_j/a_j)·(1 − ζ)
        factor.fitLength(2);
        factor.setLength(2);
        factor.get(0).set(Ba);
        Ba.neg(factor.get(1));

        factor.mul(inv, bits, termPoly);
        if (termPoly.getLength() > len)
          termPoly.setLength(len);
        R.add(termPoly, bits, R);
      }
      arblib.acb_poly_exp_series(ψ, R, len, bits);
    }
  }

  /**
   * T_n^{(δ)} = E(δ) + Σ_{k=1..n} C(n,k)(2κ)^k·[Σ_{m=1..k}(−1)^{k−m}(q−δ)^{−(k−m+1)}·A_m(q)
   * + (δ−q)^{−k}·E(δ)] — a finite combination of the compiled-kernel values.
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
  private static void contourBound(Real σT2, Real ξ, Real c, int bits, Real res)
  {
    try ( Real base = new Real(); Real e = new Real(); Real t = new Real(); Real σ = new Real())
    {
      σT2.sqrt(bits, σ);
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

  @Override
  public void close()
  {
    if (A != null)
      A.close();
    if (E != null)
      E.close();
    lewisContext.close();
    σsq.close();
    ξ.close();
    cLine.close();
    if (ownsParameters)
    {
      φ.close();
      S0.close();
      rr.close();
      K.close();
    }
  }
}
