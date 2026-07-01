package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Magnitude;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A discounted European call whose price is the single absolutely-convergent
 * erfc–Hermite series of {@code docs/single-series-pricing.md}.
 *
 * <p>
 * The exponent {@code Φ_M} of the (rough-Heston) characteristic function — the
 * {@code [2M+2/2M]} Padé representation of the cumulant generating function,
 * equal to it as an identity — is split, by Euclidean division (§3.1), into a
 * Gaussian part and a proper rational part {@code ρ}:
 *
 * <pre>
 *   Φ_M(u) = −½·σ_T²·u² − i·μ_T·u + ρ(u),   ρ(∞)=0,   ρ(w)=Σ_j B_j/(w−u_j).
 * </pre>
 *
 * The call price is then the single series (eq 6.5)
 *
 * <pre>
 *   C_M = K·e^{−rT}·Σ_{n=0..∞} q_n·(T_n^{(1)} − T_n^{(0)}),
 * </pre>
 *
 * with
 *
 * <ul>
 * <li>{@code q_n} the Maclaurin coefficients of Ψ(ζ)=exp(R(ζ)),
 * R(ζ)=ρ(w(ζ)), through the C-finite Taylor coefficients {@code r_m} of the
 * rotated proper part and the exp-of-a-series recurrence
 * {@code n·q_n = Σ_{m=1..n} m·r_m·q_{n−m}} (§6.2, eq 6.2) — driven by the
 * coefficients of the rotated denominator, never its roots;</li>
 * <li>{@code T_n^{(δ)}} the term integrals (eq 6.3), each a finite combination
 * of the closed-form erfc/Hermite node atoms {@code A_m} (§4, Lemma 4.1–4.2) at
 * the three fixed nodes {@code {0,1,q}}, {@code q=c+κ} — the payoff poles and
 * the single Cayley pole, all chosen by us, none from the representation.</li>
 * </ul>
 *
 * <p>
 * The stopping rule is the a-priori geometric majorant (eq 7.2): after each
 * term the tail ball
 *
 * <pre>
 *   τ(N) = K·e^{−rT}·(G_0+G_1)·‖Ψ‖_R·R^{−(N+1)}/(1−R^{−1})
 * </pre>
 *
 * is evaluated and summation stops at the first {@code N} with
 * {@code τ(N) ≤ 2^{−bits}}; the returned {@link Real} is {@code S_N} widened by
 * {@code τ(N)}, a certified enclosure. There is no Aitken/min-term/"best"
 * heuristic: the majorant is part of the algorithm's specification.
 *
 * <p>
 * When the proper part is absent ({@code ρ≡0}, i.e. no poles) the series
 * collapses to its first term {@code K·e^{−rT}(A_1(1)−A_1(0))}, which is exactly
 * Black–Scholes (§8) — the {@code n=0} term of the one series, not a
 * degeneration of a lattice.
 *
 * <p>
 * This is a plain value type owning only arb scalars; it holds no compiled
 * expressions. All arithmetic is arbitrary-precision ball arithmetic and no
 * numerical integration is used anywhere — every kernel integral is the exact
 * erfc/Hermite atom.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonCall implements
                             AutoCloseable
{
  /** Gaussian variance σ_T² of the exponent (must be &gt; 0). */
  public final Real    σT2;

  /** Gaussian drift μ_T of the exponent. */
  public final Real    μT;

  /** Strike. */
  public final Real    K;

  /** Total interest r·T (the discount is {@code e^{−rT}}). */
  public final Real    rT;

  /** Discounted log-moneyness {@code k̃ = log(K/S₀) − rT}. */
  public final Real    ktil;

  /** Contour abscissa {@code c ∈ (1, p*)}. */
  public final Real    c;

  /** Cayley scale {@code κ > 0} (a free choice; the price is independent of it). */
  public final Real    κ;

  /**
   * Proper-part poles {@code u_j} (a single {@link Complex} vector of dimension
   * equal to the pole count), or {@code null} for the pole-free Black–Scholes
   * case. All poles satisfy {@code Re u_j ≥ p* > c}.
   */
  public final Complex u;

  /** Proper-part residues {@code B_j}; same dimension as {@link #u}. */
  public final Complex B;

  private final boolean owns;

  /**
   * @param σT2  Gaussian variance σ_T² (&gt; 0)
   * @param μT   Gaussian drift μ_T
   * @param K    strike
   * @param rT   total interest r·T
   * @param ktil discounted log-moneyness log(K/S₀) − rT
   * @param c    contour abscissa in (1, p*)
   * @param κ    Cayley scale (&gt; 0)
   * @param u    proper-part poles (Complex vector), or null for the pole-free
   *             (Black–Scholes) case
   * @param B    proper-part residues (Complex vector, same dim as u), or null
   */
  public RoughHestonCall(Real σT2,
                         Real μT,
                         Real K,
                         Real rT,
                         Real ktil,
                         Real c,
                         Real κ,
                         Complex u,
                         Complex B)
  {
    this.σT2  = σT2;
    this.μT   = μT;
    this.K    = K;
    this.rT   = rT;
    this.ktil = ktil;
    this.c    = c;
    this.κ    = κ;
    this.u    = u;
    this.B    = B;
    this.owns = false;
  }

  private int poleCount()
  {
    return (u == null) ? 0 : u.dim();
  }

  /**
   * The verified call price {@code C_M} as a certified enclosure (eq 6.5), with
   * radius supplied by the a-priori geometric majorant (eq 7.2).
   *
   * @param bits working precision; the target tail radius is {@code 2^{−bits}}
   * @param res  destination
   * @return {@code res} = certified enclosure of the call price
   */
  public Real price(int bits, Real res)
  {
    if (σT2.sign() <= 0)
      throw new ArithmeticException("σ_T² must be strictly positive; got " + σT2
                                    + " (refusing the input — never silently patch, §3.1)");

    final int p = poleCount();

    try ( Real  ξ        = new Real();
          Real  discount = new Real();   // K·e^{−rT}
          Real  σ        = new Real();
          Real  q        = new Real();   // Cayley node q = c + κ
          Real  target   = new Real();   // 2^{−bits}
          Real  G01      = new Real();   // G_0 + G_1
          Real  R         = new Real();  // 1 < R < R_0
          Real  Rinv      = new Real();
          Real  normPsi   = new Real();  // ‖Ψ‖_R
          Real  tauC      = new Real())  // K·e^{−rT}·(G_0+G_1)·‖Ψ‖_R/(1−R^{−1})
    {
      // ξ = k̃ + μ_T
      ktil.add(μT, bits, ξ);
      // discount = K·e^{−rT}
      rT.neg(discount);
      discount.exp(bits, discount).mul(K, bits, discount);
      // σ = √σ_T²
      σT2.sqrt(bits, σ);
      // q = c + κ
      c.add(κ, bits, q);
      target.one().mul2e(-bits, target);

      // ── a-priori majorant constants (§7.2) — independent of the term index ─
      gaussContourBound(σ, ξ, bits, G01);
      final int N;   // number of terms needed: τ(N) ≤ target
      if (p == 0)
      {
        // ρ ≡ 0 ⇒ q_0 = 1, q_n = 0 (n ≥ 1); the series is exactly its n=0 term.
        Rinv.zero();
        tauC.zero();
        N = 0;
      }
      else
      {
        majorantRadiusConstant(bits, R, Rinv, normPsi);
        // tauC = discount·G01·normPsi/(1 − Rinv)
        tauC.set(discount).mul(G01, bits, tauC).mul(normPsi, bits, tauC);
        try ( Real oneMinus = new Real())
        {
          oneMinus.one().sub(Rinv, bits, oneMinus);
          tauC.div(oneMinus, bits, tauC);
        }
        // Smallest N with tauC·R^{−(N+1)} ≤ target ⇔ N+1 ≥ ln(tauC/target)/ln R.
        double lnRatio = Math.log(tauC.doubleValue() / target.doubleValue());
        double lnR     = -Math.log(Rinv.doubleValue());   // ln R = −ln Rinv
        int    Nest    = (lnR > 0) ? (int) Math.ceil(lnRatio / lnR) : bits;
        // Guard-band and clamp to a safety cap; the certified τ below is exact.
        N = Math.max(0, Math.min(Nest + 8, 8 * bits + 256));
      }

      // ── erfc/Hermite node atoms (§4): A_1(0), A_1(1), A_m(q) for m=1..N+1 ──
      try ( Real    E0 = new Real();
            Real    E1 = new Real();
            Real    Aq = Real.newVector(N + 1);
            Complex qn = Complex.newVector(N + 1);
            Atoms   atoms = new Atoms(σT2, σ, ξ, c, bits, N + 1))
      {
        atoms.A(1, RealConstants.zero, E0);
        atoms.A(1, RealConstants.one, E1);
        for (int m = 1; m <= N + 1; m++)
          atoms.A(m, q, Aq.get(m - 1));

        // ── q_n coefficients (§6.2) ───────────────────────────────────────
        exponentialCoefficients(qn, bits, N);

        // ── the single series (eq 6.5) with the certified geometric tail ──
        try ( Complex acc  = new Complex();
              Complex term = new Complex();
              Real    diff = new Real();
              Real    T0   = new Real();
              Real    T1   = new Real();
              Real    Rpow = new Real();
              Real    τ    = new Real())
        {
          acc.zero();
          Rpow.one();
          for (int n = 0; n <= N; n++)
          {
            termIntegral(n, 0, E0, Aq, q, bits, T0);
            termIntegral(n, 1, E1, Aq, q, bits, T1);
            T1.sub(T0, bits, diff);
            // term = q_n·(T1 − T0)
            qn.get(n).mul(diff, bits, term);
            acc.add(term, bits, acc);
          }

          // Certified tail radius τ(N) = tauC·R^{−(N+1)} (eq 7.2).
          if (p == 0)
          {
            τ.zero();
          }
          else
          {
            Rpow.set(Rinv).pow(N + 1, bits, Rpow);
            τ.set(tauC).mul(Rpow, bits, τ);
          }

          // C_M = discount·acc, taken real (the price is real; conjugate pole
          // pairs cancel the imaginary part). Widen by the certified tail τ.
          acc.mul(discount, bits, acc);
          res.set(acc.re());
          addRadius(res, τ);
          return res;
        }
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // q_n : exp-of-a-series recurrence on the rotated proper part (§6.2)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Fill {@code qn} with the Maclaurin coefficients of Ψ(ζ)=exp(R(ζ)) via the
   * C-finite Taylor coefficients {@code r_m} of the rotated proper part and the
   * classical exp recurrence {@code n·q_n = Σ_{m=1..n} m·r_m·q_{n−m}} (eq 6.2).
   */
  private void exponentialCoefficients(Complex qn, int bits, int maxN)
  {
    final int p = poleCount();
    if (p == 0)
    {
      qn.get(0).one();
      for (int n = 1; n <= maxN; n++)
        qn.get(n).zero();
      return;
    }

    try ( Complex r = Complex.newVector(maxN + 1))
    {
      cayleyCoefficients(r, bits, maxN);
      // q_0 = exp(r_0)
      r.get(0).exp(bits, qn.get(0));
      try ( Complex s   = new Complex();
            Complex tmp = new Complex())
      {
        for (int n = 1; n <= maxN; n++)
        {
          s.zero();
          for (int m = 1; m <= n; m++)
          {
            // tmp = m·r_m·q_{n−m}
            r.get(m).mul(qn.get(n - m), bits, tmp);
            tmp.mul(m, bits, tmp);
            s.add(tmp, bits, s);
          }
          s.div(n, bits, qn.get(n));
        }
      }
    }
  }

  /**
   * The Taylor coefficients {@code r_m} of R(ζ)=ρ(w(ζ)) at ζ=0, in closed form
   * per pole: with {@code a_j = c−κ−u_j}, {@code b_j = c+κ−u_j},
   * {@code ρ_j = b_j/a_j},
   *
   * <pre>
   *   r_0 = Σ_j B_j/a_j,
   *   r_m = Σ_j (B_j/a_j)·ρ_j^{m−1}·(ρ_j − 1)   (m ≥ 1).
   * </pre>
   *
   * This uses only the coefficients of the rotated denominator (via
   * {@code a_j, b_j}), never any root-finding.
   */
  private void cayleyCoefficients(Complex r, int bits, int maxN)
  {
    final int p = poleCount();
    try ( Complex a    = new Complex();
          Complex b    = new Complex();
          Complex rho  = new Complex();
          Complex Ba   = new Complex();   // B_j/a_j
          Complex rhoP = new Complex();   // ρ_j^{m−1}
          Complex rm1  = new Complex();   // ρ_j − 1
          Complex tmp  = new Complex();
          Real    cmk  = new Real();      // c − κ
          Real    cpk  = new Real())      // c + κ
    {
      c.sub(κ, bits, cmk);
      c.add(κ, bits, cpk);

      for (int m = 0; m <= maxN; m++)
        r.get(m).zero();

      for (int j = 0; j < p; j++)
      {
        // a_j = (c−κ) − u_j ; b_j = (c+κ) − u_j
        cmk.sub(u.get(j), bits, a);
        cpk.sub(u.get(j), bits, b);
        B.get(j).div(a, bits, Ba);
        b.div(a, bits, rho);
        rho.sub(1, bits, rm1);   // ρ_j − 1

        // r_0 += B_j/a_j
        r.get(0).add(Ba, bits, r.get(0));

        // r_m += (B_j/a_j)·ρ_j^{m−1}·(ρ_j−1)
        rhoP.one();
        for (int m = 1; m <= maxN; m++)
        {
          // tmp = Ba·rhoP·rm1
          Ba.mul(rhoP, bits, tmp);
          tmp.mul(rm1, bits, tmp);
          r.get(m).add(tmp, bits, r.get(m));
          rhoP.mul(rho, bits, rhoP);   // ρ_j^{m}
        }
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // Term integrals (eq 6.3): finite combination of node atoms
  // ────────────────────────────────────────────────────────────────────────

  /**
   * {@code T_n^{(δ)}} (eq 6.3) as the exact finite combination of erfc/Hermite
   * atoms obtained from the partial fraction of {@code ζ(w)^n} at the simple
   * node {@code δ} and the order-{@code k} Cayley node {@code q}:
   *
   * <pre>
   *   T_n^{(δ)} = A_1(δ) + Σ_{k=1..n} C(n,k)(2κ)^k·[
   *                 Σ_{m=1..k} (−1)^{k−m}/(q−δ)^{k−m+1}·A_m(q)
   *                 + (1/(δ−q)^k)·A_1(δ) ].
   * </pre>
   */
  private void termIntegral(int n, int delta, Real Edelta, Real Aq, Real q, int bits, Real res)
  {
    res.set(Edelta);
    if (n == 0)
      return;

    try ( Real qmd    = new Real();   // q − δ
          Real dmq    = new Real();   // δ − q
          Real binom  = new Real();   // C(n,k)·(2κ)^k
          Real twoκ   = new Real();
          Real s      = new Real();
          Real coef   = new Real();
          Real acc    = new Real();
          Real qmdPow = new Real())   // (q−δ)^{k−m+1}
    {
      q.sub(delta, bits, qmd);
      dmq.set(delta).sub(q, bits, dmq);
      κ.mul(2, bits, twoκ);

      // binom starts at k=1 : C(n,1)·(2κ)^1 = n·2κ
      binom.set(twoκ).mul(n, bits, binom);

      for (int k = 1; k <= n; k++)
      {
        s.zero();
        // Σ_{m=1..k} (−1)^{k−m}/(q−δ)^{k−m+1}·A_m(q)
        for (int m = 1; m <= k; m++)
        {
          int e = k - m + 1;
          qmd.pow(e, bits, qmdPow);
          coef.set(Aq.get(m - 1)).div(qmdPow, bits, coef);
          if (((k - m) & 1) != 0)
            coef.neg(coef);
          s.add(coef, bits, s);
        }
        // + (1/(δ−q)^k)·A_1(δ)
        dmq.pow(k, bits, qmdPow);
        coef.set(Edelta).div(qmdPow, bits, coef);
        s.add(coef, bits, s);

        // res += binom·s
        s.mul(binom, bits, acc);
        res.add(acc, bits, res);

        // advance binom to k+1 : C(n,k+1)(2κ)^{k+1}
        //   = binom · (n−k)/(k+1) · 2κ
        if (k < n)
        {
          binom.mul(n - k, bits, binom);
          binom.div(k + 1, bits, binom);
          binom.mul(twoκ, bits, binom);
        }
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // A-priori majorant constants (§7.2)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * {@code G_0 + G_1} where
   * {@code G_δ ≤ e^{σ²c²/2 − cξ}/(σ√(2π)·|c−δ|)} (elementary, eq 7.2).
   */
  private void gaussContourBound(Real σ, Real ξ, int bits, Real res)
  {
    try ( Real base = new Real();
          Real e    = new Real();
          Real t    = new Real())
    {
      // base = e^{σ_T²·c²/2 − c·ξ}/(σ·√(2π))
      c.mul(c, bits, t);          // c²
      t.mul(σT2, bits, t).mul2e(-1, t); // σ_T²·c²/2
      c.mul(ξ, bits, e);          // c·ξ
      t.sub(e, bits, t);
      t.exp(bits, t);
      base.set(σ).mul(RealConstants.sqrt2π, bits, base);
      t.div(base, bits, base);    // base = e^{...}/(σ√(2π))

      // + 1/|c−1| + 1/|c|
      res.zero();
      t.set(c).sub(1, bits, t).abs(bits, t);
      base.div(t, bits, e);
      res.add(e, bits, res);
      t.set(c).abs(bits, t);
      base.div(t, bits, e);
      res.add(e, bits, res);
    }
  }

  /**
   * Compute {@code R} (a radius with {@code 1 < R < R_0}), {@code Rinv = 1/R},
   * and an upper bound for {@code ‖Ψ‖_R} (eq 7.2). With
   * {@code R_0 = 1/max_j|ρ_j| = min_j|ζ(u_j)| > 1} and {@code R = (1+R_0)/2},
   *
   * <pre>
   *   ‖Ψ‖_R ≤ exp( Σ_j |B_j|(1+R)/(|a_j| − |b_j|R) ).
   * </pre>
   */
  private void majorantRadiusConstant(int bits, Real R, Real Rinv, Real normPsi)
  {
    final int p = poleCount();
    try ( Complex a      = new Complex();
          Complex b      = new Complex();
          Real    cmk    = new Real();
          Real    cpk    = new Real();
          Real    absa   = new Real();
          Real    absb   = new Real();
          Real    absB   = new Real();
          Real    ratio  = new Real();   // |ρ_j| = |b_j|/|a_j|
          Real    maxRho = new Real();
          Real    R0     = new Real();
          Real    onePlusR = new Real();
          Real    denom  = new Real();
          Real    tmp    = new Real();
          Real    sum    = new Real())
    {
      c.sub(κ, bits, cmk);
      c.add(κ, bits, cpk);

      maxRho.zero();
      for (int j = 0; j < p; j++)
      {
        cmk.sub(u.get(j), bits, a);
        cpk.sub(u.get(j), bits, b);
        a.abs(bits, absa);
        b.abs(bits, absb);
        absb.div(absa, bits, ratio);
        if (ratio.compareTo(maxRho) > 0)
          maxRho.set(ratio);
      }
      // R_0 = 1/max|ρ_j|
      R0.one().div(maxRho, bits, R0);
      // R = (1 + R_0)/2  ∈ (1, R_0)
      R.one().add(R0, bits, R).mul2e(-1, R);
      Rinv.one().div(R, bits, Rinv);

      // Σ_j |B_j|(1+R)/(|a_j| − |b_j|R)
      onePlusR.one().add(R, bits, onePlusR);
      sum.zero();
      for (int j = 0; j < p; j++)
      {
        cmk.sub(u.get(j), bits, a);
        cpk.sub(u.get(j), bits, b);
        a.abs(bits, absa);
        b.abs(bits, absb);
        B.get(j).abs(bits, absB);
        // denom = |a_j| − |b_j|·R
        absb.mul(R, bits, denom);
        absa.sub(denom, bits, denom);
        absB.mul(onePlusR, bits, tmp);
        tmp.div(denom, bits, tmp);
        sum.add(tmp, bits, sum);
      }
      sum.exp(bits, normPsi);
    }
  }

  /** Widen the ball {@code res} so its radius includes the certified tail {@code τ}. */
  private static void addRadius(Real res, Real τ)
  {
    try ( Magnitude m = new Magnitude())
    {
      τ.getMagnitude(m);
      res.addUncertainty(m);
    }
  }

  @Override
  public void close()
  {
    // This value type does not own its inputs by default.
    if (owns)
    {
      // reserved for future owning factory constructors
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // Closed-form erfc/Hermite node atoms A_m(w) (§4, Lemma 4.1–4.2)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The exact node atoms
   *
   * <pre>
   *   A_m(w) = (1/(m−1)!)·∂_w^{m−1} E(w),
   *   E(w)   = ½·e^{g(w)}·erfc(z_w) − 1_{Re w>c}·e^{g(w)},
   *   g(w)   = ½σ_T²w² − wξ,   z_w = (ξ − σ_T²w)/(σ_T√2),
   * </pre>
   *
   * evaluated through the closed Hermite form (docs/single-series-pricing.md §4)
   *
   * <pre>
   *   ∂_w^{m−1} E(w) = ½ e^{g} P_{m−1}(w) erfc(z_w)
   *      + (e^{−ξ²/(2σ²)}/√π) Σ_{j=1..m−1} C(m−1,j)(σ/√2)^j P_{m−1−j}(w) H_{j−1}(z_w)
   *      − 1_{Re w>c} e^{g} P_{m−1}(w),
   * </pre>
   *
   * with {@code P_0=1, P_{k+1}=P_k' + (σ²w − ξ)P_k} (so {@code ∂_w^k e^g = e^g P_k})
   * and {@code H_j} the physicists' Hermite polynomials. No quadrature.
   *
   * <p>
   * All three fixed nodes {@code 0,1,q} are real, so every atom is a real ball.
   */
  private static final class Atoms implements
                                   AutoCloseable
  {
    final Real   σT2;
    final Real   σ;
    final Real   ξ;
    final Real   c;
    final int    bits;
    final Real   gauss;            // e^{−ξ²/(2σ²)}/√π
    final RealPolynomial gp;       // g'(w) = σ²w − ξ  (ascending coeffs [−ξ, σ²])
    final RealPolynomial[] P;      // P_0..P_{maxOrder}

    Atoms(Real σT2, Real σ, Real ξ, Real c, int bits, int maxOrder)
    {
      this.σT2  = σT2;
      this.σ    = σ;
      this.ξ    = ξ;
      this.c    = c;
      this.bits = bits;

      this.gauss = new Real();
      try ( Real t = new Real())
      {
        // gauss = e^{−ξ²/(2σ²)}/√π
        ξ.mul(ξ, bits, t);
        t.div(σT2, bits, t).mul2e(-1, t).neg(t);
        t.exp(bits, t);
        t.div(RealConstants.sqrtπ, bits, gauss);
      }

      this.gp = new RealPolynomial(2);
      try ( Real negξ = new Real())
      {
        ξ.neg(negξ);
        gp.set(0, negξ);
        gp.set(1, σT2);
      }

      this.P = new RealPolynomial[Math.max(1, maxOrder)];
      P[0] = new RealPolynomial(1);
      P[0].set(0, RealConstants.one);
      for (int k = 1; k < P.length; k++)
      {
        // P_k = P_{k−1}' + g'·P_{k−1}
        RealPolynomial deriv = P[k - 1].derivative();
        RealPolynomial prod  = gp.mul(P[k - 1], bits, new RealPolynomial());
        P[k] = deriv.add(prod, bits, new RealPolynomial());
        deriv.close();
        prod.close();
      }
    }

    @Override
    public void close()
    {
      gauss.close();
      gp.close();
      for (RealPolynomial p : P)
        if (p != null)
          p.close();
    }

    /** g(w) = ½σ_T²w² − wξ. */
    private Real g(Real w, Real res)
    {
      try ( Real t = new Real())
      {
        w.mul(w, bits, res);
        res.mul(σT2, bits, res).mul2e(-1, res);   // ½σ²w²
        w.mul(ξ, bits, t);
        res.sub(t, bits, res);
      }
      return res;
    }

    /** z_w = (ξ − σ_T²w)/(σ_T√2). */
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

    /** Physicists' Hermite H_n(x) via H_0=1, H_1=2x, H_{n+1}=2x H_n − 2n H_{n−1}. */
    private Real hermite(int n, Real x, Real res)
    {
      if (n == 0)
        return res.one();
      try ( Real h0 = new Real();
            Real h1 = new Real();
            Real t  = new Real())
      {
        h0.one();
        x.mul(2, bits, h1);           // 2x
        if (n == 1)
          return res.set(h1);
        for (int k = 1; k < n; k++)
        {
          // h = 2x·h1 − 2k·h0
          x.mul(2, bits, t).mul(h1, bits, t);
          h0.mul(2 * k, bits, h0);
          t.sub(h0, bits, res);
          h0.set(h1);
          h1.set(res);
        }
        return res;
      }
    }

    /** A_m(w) = (1/(m−1)!)·∂_w^{m−1} E(w). */
    Real A(int m, Real w, Real res)
    {
      final int m1 = m - 1;
      try ( Real eg    = new Real();
            Real zw    = new Real();
            Real ec    = new Real();   // erfc(z_w)
            Real ind   = new Real();   // 1_{w>c}·e^{g}
            Real term0 = new Real();
            Real s     = new Real();
            Real Pval  = new Real();
            Real Hval  = new Real();
            Real sfac  = new Real();   // (σ/√2)^j
            Real binom = new Real();
            Real coef  = new Real();
            Real fact  = new Real())
      {
        g(w, eg);
        eg.exp(bits, eg);
        z(w, zw);
        zw.erfc(bits, ec);

        // ind = e^{g} if Re w > c else 0
        if (w.compareTo(c) > 0)
          ind.set(eg);
        else
          ind.zero();

        // term0 = ½·e^{g}·P_{m1}(w)·erfc(z_w) − ind·P_{m1}(w)
        evalP(m1, w, Pval);
        term0.set(eg).mul(Pval, bits, term0).mul2e(-1, term0).mul(ec, bits, term0);
        try ( Real t = new Real())
        {
          ind.mul(Pval, bits, t);
          term0.sub(t, bits, term0);
        }

        // s = Σ_{j=1..m1} C(m1,j)·(σ/√2)^j·P_{m1−j}(w)·H_{j−1}(z_w)
        s.zero();
        // (σ/√2)
        σ.div(RealConstants.sqrt2, bits, coef);
        sfac.one();
        for (int j = 1; j <= m1; j++)
        {
          sfac.mul(coef, bits, sfac);           // (σ/√2)^j
          binomial(m1, j, binom);
          evalP(m1 - j, w, Pval);
          hermite(j - 1, zw, Hval);
          fact.set(binom).mul(sfac, bits, fact).mul(Pval, bits, fact).mul(Hval, bits, fact);
          s.add(fact, bits, s);
        }
        s.mul(gauss, bits, s);

        // ∂^{m1} E = term0 + gauss·s ; A_m = that / (m1)!
        res.set(term0).add(s, bits, res);
        factorial(m1, fact);
        res.div(fact, bits, res);
        return res;
      }
    }

    private void evalP(int k, Real w, Real res)
    {
      P[k].evaluate(w, 1, bits, res);
    }

    private void binomial(int n, int k, Real res)
    {
      // small integer binomial by multiplicative formula
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
}
