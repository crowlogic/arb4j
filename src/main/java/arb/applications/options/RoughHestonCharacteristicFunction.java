package arb.applications.options;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.RealSequence;

/**
 * Rough-Heston characteristic function (El Euch–Rosenbaum 2019, eq 1.8) at a
 * fixed maturity T:
 *
 * <pre>
 *   φ(v, T) = exp( Φ(v, T) )
 *   Φ(v, T) = Σ_{k=0}^{∞} d_k(v) · T^{k·μ + 1}
 *   d_k(v) = when k = 0  ↦  w(0) · a(1)(v)
 *            else        ↦  u(k) · a(k)(v) + w(k) · a(k+1)(v)
 *   u(k)   = θ·λ / (k·μ + 1)
 *   w(k)   = V0 · Γ((k+1)·μ + 1) / Γ(k·μ + 2)
 * </pre>
 *
 * The series Φ is written with upper bound ∞ literally. The Σ-node in the
 * expression compiler is the convergence loop: at evaluation it absorbs
 * terms until the partial sum has the requested bits of precision (Aitken-Δ²
 * acceleration), or throws an {@code ArbException} on divergence. Nothing
 * less than the requested bits is ever returned. There is no order
 * parameter, no Java loop, no per-call bookkeeping in this class — the
 * compiled expression is the implementation.
 *
 * @author ©2026 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public class RoughHestonCharacteristicFunction implements
                                               ComplexFunction,
                                               AutoCloseable
{
  /** The configuration: λ, θ, ν, V0, ρ, μ, T plus the backing Context. */
  public final RoughHestonConfiguration config;

  /** The fractional Riccati solver supplying a_k(v). */
  public final RoughHestonRiccatiMuntzPadeFunctional riccati;

  /** Compiled Müntz coefficient sequence k ↦ a_k(v). Alias of riccati.a. */
  public final ComplexPolynomialSequence a;

  /** Compiled rough-Heston lattice weight u: k ➔ θ·λ / (k·μ + 1). */
  public final RealSequence u;

  /** Compiled rough-Heston lattice weight w: k ➔ V0·Γ((k+1)·μ + 1) / Γ(k·μ + 2). */
  public final RealSequence w;

  /** Compiled rough-Heston Müntz d-sequence k ↦ d_k(v). */
  public final ComplexPolynomialSequence d;

  /** Compiled cumulant generating function Φ(v, T) = Σ_{k=0}^{∞} d_k(v) · T^{k·μ+1}. */
  public final ComplexFunction Φ;

  /** Compiled characteristic function φ(v) = exp(Φ(v)). */
  public final ComplexFunction φ;

  private final boolean ownsConfig;

  public RoughHestonCharacteristicFunction()
  {
    this(ComplexConstants.zero);
  }

  public RoughHestonCharacteristicFunction(Complex v)
  {
    this(new RoughHestonConfiguration(), true, v);
  }

  public RoughHestonCharacteristicFunction(RoughHestonConfiguration config, Complex v)
  {
    this(config, false, v);
  }

  /**
   * Legacy bridge: build φ from a pre-assembled Context. Adopts the Context
   * via {@link RoughHestonConfiguration#RoughHestonConfiguration(Context)}.
   */
  public RoughHestonCharacteristicFunction(Context context, Complex v)
  {
    this(new RoughHestonConfiguration(context), false, v);
  }

  private RoughHestonCharacteristicFunction(RoughHestonConfiguration config,
                                            boolean ownsConfig,
                                            Complex v)
  {
    if (config == null)
      throw new IllegalArgumentException("configuration must not be null");

    this.config     = config;
    this.ownsConfig = ownsConfig;

    Context context = config.context;

    this.riccati = new RoughHestonRiccatiMuntzPadeFunctional(context, config.μ);
    this.a       = riccati.a;

    this.u = RealSequence            .express("u:k➔θ*λ/(k*μ+1)",            context);
    this.w = RealSequence            .express("w:k➔V0*Γ((k+1)*μ+1)/Γ(k*μ+2)", context);
    this.d = ComplexPolynomialSequence.express(
        "d:k➔v➔when(k=0,w(0)*a(1)(v),else,u(k)*a(k)(v)+w(k)*a(k+1)(v))",
        context);

    this.Φ = ComplexFunction.express("Φ:v➔Σk➔d(k)(v)*T^(k*μ+1){k=0..∞}", context);
    this.φ = ComplexFunction.express("φ:v➔exp(Φ(v))",                       context);
  }

  @Override
  public Complex evaluate(Complex uVal, int order, int bits, Complex res)
  {
    return φ.evaluate(uVal, order, bits, res);
  }

  /**
   * European call price under the rough-Heston model this characteristic
   * function represents, at strike {@code strike}, evaluated to {@code bits}
   * of precision.
   *
   * <p>Computes Claim 10.1 of {@code docs/SchwingerHermiteFromCitations.txt}
   * in the limit M→∞:
   *
   * <pre>
   *   C(K, T) = lim_{M→∞} C_M(K, T)
   *   C_M(K, T) = S₀·(1 − eᵏ)⁺
   *             + S₀ · Σ_{𝐧 ∈ ℤ_{≥0}^{2M}} ( ∏_j A_j^{n_j} / n_j! )
   *                    · [ c₀(𝐧) J(0) + c_{−i}(𝐧) J(−i)
   *                      + Σ_{j=1}^{2M} Σ_{m=1}^{n_j} c_{j, m}(𝐧) J^{[m]}(u_j) ]
   * </pre>
   *
   * where c₀(𝐧), c_{−i}(𝐧), c_{j, m}(𝐧) are the Heaviside partial-fraction
   * coefficients of
   *   R_𝐧(v) := 1 / ( v(v + i) · ∏_j (v − u_j)^{n_j} ),
   * and J(0), J(−i), J^{[m]}(u_j) are the Schwinger–Hermite Lewis Gaussian
   * integrals of §8 (Claims 8.2, 8.4), evaluated by the per-pole ladder of
   * §10 Step B' in (𝒜_m, ℬ_m, F(η_j)) form.
   *
   * <p>The implementation is the ball-arithmetic evaluation specified by
   * §13 of the document: every quantity computed in ball arithmetic at
   * working precision p ≥ bits; multi-indices enumerated by increasing
   * |𝐧|, accumulated into a running ball-arithmetic sum S; iteration
   * continues until 2·radius(S) ≤ 2^{−bits}; final ball encloses C(K, T)
   * with width at most 2^{−bits}.
   *
   * <p>The outer M-sequence is Aitken-Δ²-accelerated. Either returns a value
   * good to {@code bits} of precision, or throws an
   * {@link arb.exceptions.ArbException} on divergence. Nothing less than the
   * requested bits is ever returned.
   *
   * @param S0     spot S₀ > 0
   * @param strike strike K > 0
   * @param rr     risk-free rate r ≥ 0
   * @param bits   requested precision (binary digits)
   * @param dst    result destination; mutated and returned
   */
  public Real call(Real S0, Real strike, Real rr, int bits, Real dst)
  {
    if (S0     == null) throw new IllegalArgumentException("S0 must not be null");
    if (strike == null) throw new IllegalArgumentException("strike must not be null");
    if (rr     == null) throw new IllegalArgumentException("rr must not be null");
    if (dst    == null) throw new IllegalArgumentException("dst must not be null");

    try (Real kLog      = new Real();
         Real threshold = new Real().one().mul2e(-bits, new Real());
         Real cM        = new Real().zero();
         Real cMm1      = new Real().zero();
         Real cMm2      = new Real().zero();
         Real diff1     = new Real();
         Real diff2     = new Real();
         Real aitken    = new Real();
         Real absGap    = new Real();
         Real bestGap   = new Real().posInf())
    {
      strike.div(S0, bits, kLog).log(bits, kLog);

      int stagnation = 0;
      for (int M = 1; ; M++)
      {
        cMm2.set(cMm1);
        cMm1.set(cM);
        computeCM(M, S0, kLog, bits, cM);

        if (M >= 3)
        {
          cM.sub(cMm1, bits, diff1);
          diff1.sub(cMm1, bits, diff2).add(cMm2, bits, diff2);
          diff1.mul(diff1, bits, aitken).div(diff2, bits, aitken);
          cM.sub(aitken, bits, aitken);
          aitken.sub(cM, bits, absGap).abs(bits, absGap);

          if (absGap.compareTo(threshold) <= 0)
            return dst.set(aitken);

          if (absGap.compareTo(bestGap) < 0)
          {
            bestGap.set(absGap);
            stagnation = 0;
          }
          else if (++stagnation >= 8)
          {
            throw new arb.exceptions.ArbException(
                "rough-Heston call price Aitken outer M-sequence failed to converge to "
                + bits + " bits at M=" + M);
          }
        }
      }
    }
  }

  /**
   * Compute {@code C_M(K, T)} for one Padé order M, writing into
   * {@code result}.
   *
   * <p>Algorithm (per §§6, 9, 10, 13 of
   * {@code docs/SchwingerHermiteFromCitations.txt}):</p>
   * <ol>
   *   <li>Synthesize the M-th orthogonal polynomial π_M(z, v) ∈ ℂ(v)[z] via
   *       the Wheeler modified-moments recurrence from the moments
   *       {@code d_k(v)}. Reverse coefficients to get the Padé denominator
   *       {@code Q_M(z, v) = z^M·π_M(1/z, v)}.</li>
   *   <li>Evaluate at {@code z = T^μ} to obtain the v-rational numerator and
   *       denominator of κ_M(T, v) ∈ ℂ(v).</li>
   *   <li>Divide both by {@code (v(v+i))^M} (§6 Step 3) to obtain the reduced
   *       ̃Q_M(v) ∈ ℂ[v] of degree exactly 2M.</li>
   *   <li>Locate the 2M roots {u_j} of ̃Q_M via {@code acb_poly_roots}. Per
   *       §6 Claim 6.1, the roots split half-and-half under σ : v ↦ −conj(v)
   *       − i: M upper poles with Im u_j ≥ s > 0 and M lower poles with
   *       Im u_j ≤ −1 − s < −1. None lie in the Lewis strip (−1, 0).</li>
   *   <li>Read off σ_T² and μ_T from the leading quadratic of κ_M (polynomial
   *       quotient of numerator-in-v by ̃Q_M).</li>
   *   <li>Residues A_j = numerator(u_j) / ̃Q_M'(u_j).</li>
   *   <li>For each j: ε_j = sgn(Im u_j + β) ∈ {±1}; ζ_j = (μ_T + k)/σ_T − i
   *       u_j σ_T; η_j = ε_j ζ_j; F(η_j) via acb_hypgeom_erfc; per-pole
   *       Schwinger–Hermite ladder polynomials (𝒜_m, ℬ_m) at η_j by the
   *       recurrence of §10 Step B'.</li>
   *   <li>Enumerate multi-indices 𝐧 ∈ ℤ_{≥0}^{2M} by increasing |𝐧|. For
   *       each 𝐧, compute the Heaviside partial-fraction coefficients
   *       c₀(𝐧), c_{−i}(𝐧), c_{j, m}(𝐧) of R_𝐧, accumulate the contribution
   *       (∏_j A_j^{n_j}/n_j!) [c₀(𝐧) J(0) + c_{−i}(𝐧) J(−i) + Σ_{j, m≤n_j}
   *       c_{j, m}(𝐧) J^{[m]}(u_j)] into the running ball-arithmetic sum S.
   *       Continue until 2·radius(S) ≤ 2^{−bits}; the resulting ball
   *       encloses C_M(K, T) with width ≤ 2^{−bits}.</li>
   *   <li>{@code C_M = S₀(1−e^k)⁺ + S₀ · S}.</li>
   * </ol>
   */
  private void computeCM(int M, Real S0, Real kLog, int bits, Real result)
  {
    // The implementation of c(M) — generic-ring κ_M assembly, root location
    // via gr_poly_roots, residues, σ_T²/μ_T via gr_poly_divrem on N/D,
    // per-pole F(ζ_j − iσ_T·A_j) sum — is the in-progress work item.
    throw new arb.exceptions.ArbException(
        "rough-Heston call price computeCM not yet implemented at M=" + M);
  }

  @Override
  public void close()
  {
    if (φ       != null) φ.close();
    if (Φ       != null) Φ.close();
    if (d       != null) d.close();
    if (w       != null) w.close();
    if (u       != null) u.close();
    if (riccati != null) riccati.close();
    if (ownsConfig && config != null) config.close();
  }
}
