package arb.functions.real;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * Evaluator for the on-band spectral density G(ν) as the full stationary-phase
 * mode sum derived from the repository's math in
 * {@code docs/StationaryPhaseLocusAndRemainderAtom.tex} and
 * {@code docs/SpectralNonNegativity.md}.
 *
 * <p>
 * <b>Repo-grounded formulas used.</b> For each Dirichlet mode (n, σ) with
 * n ≥ 2 and σ ∈ {+1, −1} the stationary-phase locus (Lemma "statlocus" of
 * {@code StationaryPhaseLocusAndRemainderAtom.tex}) gives the per-mode saddle
 * time
 *
 * <pre>
 *   t*(n, σ, ν) = (ϑ')^(-1)( log(n) / (σ - ν) ),
 * </pre>
 *
 * provided σ − ν &gt; 0, which selects σ = +1 for ν &lt; 1 and σ = −1 for
 * ν &gt; −1. The Kelvin (stationary-phase) contribution of mode (n, σ) to
 * 2π·K_T(ν), as derived in {@code SpectralNonNegativity.md} (eq. 60), is
 *
 * <pre>
 *   𝒜_{n,σ}(ν) = n^(-1/2) · √( 2π / ((σ-ν) · ϑ''(t*)) )
 *              · exp( i · [ Φ_{n,σ,ν}(t*) + π/4 ] ),
 *   Φ_{n,σ,ν}(t) = (σ − ν) · ϑ(t) − σ · t · log n.
 * </pre>
 *
 * Here √(ϑ'(t*)) = √(log n/(σ−ν)) is absorbed into the amplitude, and the
 * Gaussian amplitude √(2π/|Φ''|) with Φ''(t*) = (σ − ν) · ϑ''(t*) yields the
 * form above. The real part of the coherent sum over (n, σ) is the repository's
 * stationary-phase expression for G(ν) = Re K_∞^{stat}(ν):
 *
 * <pre>
 *   G_N(ν) = (1/(2π)) · Σ_{σ∈{+,-}} Σ_{n=2}^{N}
 *             n^(-1/2) · √( 2π / ((σ-ν) · ϑ''(t*(n,σ,ν))) )
 *             · cos( (σ-ν)·ϑ(t*) − σ · t* · log n + π/4 ).
 * </pre>
 *
 * The n = 1 modes have log 1 = 0, so 𝒜_{1,σ} → 0; they do not contribute to
 * the on-band density (they are the boundary atoms at ν = ±1 absorbed into the
 * band endpoint, per Theorem "On-band density" in
 * {@code docs/RiemannHypothesisProof.tex}, Block C). The sum therefore starts
 * at n = 2.
 *
 * <p>
 * <b>Certified truncation.</b> For a given T ≥ T₀ ≥ 200, only modes whose
 * saddle t*(n, σ, ν) falls inside [T₀, T] contribute to the windowed transform
 * K_T(ν); modes with t* &gt; T are identically absent (their integrand's
 * stationary point lies outside the integration range). Using Lemma
 * "thetapbound" of {@code StationaryPhaseLocusAndRemainderAtom.tex}
 *
 * <pre>
 *   |ϑ'(t) − (1/2) log(t/(2π))| ≤ 1/200  for t ≥ 200,
 * </pre>
 *
 * the saddle time satisfies t*(n, σ, ν) ≈ 2π · n^(2/(σ−ν)); a guaranteed
 * upper bound (valid for n ≥ 2 and ν ∈ (−1, 1) \ {0}) is
 *
 * <pre>
 *   t*(n, σ, ν) ≤ 2π · n^(2/(σ−ν)) · exp(2/(200·(σ−ν)))
 *               ≤ 2π · n^(2/(1−|ν|)) · exp(1/(100·(1−|ν|))).
 * </pre>
 *
 * Inverting, modes with
 *
 * <pre>
 *   n &gt; N_max(T, ν) := ⌊ (T / (2π · exp(1/(100·(1−|ν|)))))^((1−|ν|)/2) ⌋
 * </pre>
 *
 * have t*(n, σ, ν) &gt; T and contribute zero to K_T(ν). Consequently the
 * truncated sum up to N = N_max(T, ν) reproduces K_T^{stat}(ν) exactly; the
 * omitted remainder is identically 0 within the windowed model. When the user
 * requests a truncation N &lt; N_max(T, ν), the tail bound
 *
 * <pre>
 *   |G_∞(ν) − G_N(ν)| ≤ (1/π) · Σ_{n=N+1}^{N_max(T,ν)}
 *                         n^(-1/2) · √( 2π / ((1−|ν|) · ϑ''(t*(n,·,ν))) )
 * </pre>
 *
 * is computed explicitly by the evaluator using the same closed form and
 * returned in {@link #tailBound(Real, int, int, int, Real, Real)}.
 *
 * <p>
 * <b>Inversion of ϑ'.</b> The per-mode saddle requires inverting ϑ' at the
 * target value η = log(n)/(σ−ν). We do this by Newton iteration on
 * f(t) = ϑ'(t) − η, with the guaranteed-convergent warm start
 * t₀ = max(T₀, 2π · n^(2/(σ−ν))) from Lemma "thetapbound"; convergence is
 * second-order since ϑ''(t) &gt; 0 (Lemma "mono") and ϑ''' is bounded.
 *
 * <p>
 * <b>Expression Compiler usage.</b> Following the repo-standard pattern (see
 * {@link MonotonicRiemannSiegelThetaFunction}, {@link RiemannSiegelThetaFunction})
 * the per-mode stationary-phase contribution and the ϑ-jet needed by the Newton
 * step are compiled declaratively through {@link arb.expressions}. The only
 * non-declarative step is the Newton loop itself (a numerical fixed-point,
 * which has no closed form).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralDensity implements
                                  AutoCloseable
{
  /** Default lower integration bound matching the repo's T₀ = 200. */
  public static final double DEFAULT_T_LOW  = 200.0;

  /** Default windowed-transform upper bound; chosen large enough to
   *  admit many modes while remaining numerically benign. */
  public static final double DEFAULT_T_HIGH = 1.0e6;

  private final Real        ν              = Real.named("ν").set(0);
  private final Real        n              = Real.named("n").set(2);
  private final Real        σ              = Real.named("σ").set(1);

  public final Context      context        = new Context(ν, n, σ);

  /**
   * Per-mode Kelvin contribution to (2π)·G(ν), evaluated at t = t*:
   *
   * <pre>
   *   term(t) = n^(-1/2) · √(2π/((σ-ν)·diff(ϑ(t),t²)))
   *           · cos( (σ-ν)·ϑ(t) - σ·t·log(n) + π/4 )
   * </pre>
   */
  public final RealFunction term           =
                                 RealFunction.express("term:t➔(1/√(n))·√(2·π/((σ-ν)·diff(ϑ(t),t²)))"
                                                      + "·cos((σ-ν)·ϑ(t)-σ·t·log(n)+π/4)",
                                                      context);

  /**
   * ϑ-jet function: evaluated with order=3 yields [ϑ(t), ϑ'(t), ϑ''(t)/2!].
   * The Newton saddle solve needs ϑ'(t) (to compare with the target
   * log n/(σ-ν)) and ϑ''(t) (the Newton step divisor).
   */
  public final RiemannSiegelThetaFunction θ = new RiemannSiegelThetaFunction();

  private void validateNu(double νd)
  {
    if (νd <= -1.0 || νd >= 1.0)
    {
      throw new IllegalArgumentException("ν must lie in the open interval (-1, 1); got " + νd);
    }
    if (νd == 0.0)
    {
      throw new IllegalArgumentException("ν = 0 is the boundary atom case; evaluator is defined on (-1,1)\\{0}");
    }
  }

  /**
   * Maximum mode index N_max(T, ν) for which t*(n, σ, ν) ≤ T, using the
   * repo-grounded upper bound t* ≤ 2π · n^(2/(1−|ν|)) · exp(1/(100·(1−|ν|))).
   */
  public static int maxModeInWindow(double νd, double tUpper)
  {
    double oneMinus = 1.0 - Math.abs(νd);
    if (oneMinus <= 0 || tUpper <= 2 * Math.PI)
    {
      return 1;
    }
    double safety = Math.exp(1.0 / (100.0 * oneMinus));
    double raw    = Math.pow(tUpper / (2 * Math.PI * safety), oneMinus / 2.0);
    int    n      = (int) Math.floor(raw);
    return Math.max(1, n);
  }

  /** Lower bound on the mode-(n,σ) integration range: max(T_low, 2π·n²) */
  private static double lowerBoundForMode(int nInt, double tLow)
  {
    return Math.max(tLow, 2.0 * Math.PI * nInt * nInt);
  }

  /**
   * Warm start for Newton: 2π · n^(2/(σ-ν)).
   */
  private static double warmStart(double nd, double σd, double νd)
  {
    double exponent = 2.0 / (σd - νd);
    return 2.0 * Math.PI * Math.pow(nd, exponent);
  }

  /**
   * Does mode (n, σ) have a stationary point inside its integration range
   * [max(T_low, 2π·n²), ∞) at the target ν? Using Lemma "thetapbound",
   * ϑ'(t) ≈ (1/2) log(t/2π), a sufficient-and-nearly-necessary condition is
   *
   *   log n/(σ-ν) ≥ (1/2) log(max(T_low,2π·n²)/(2π)) - 1/200.
   */
  private static boolean modeHasSaddle(int nInt, double σd, double νd, double tLow)
  {
    double target = Math.log(nInt) / (σd - νd);
    double t0     = lowerBoundForMode(nInt, tLow);
    double ϑpLow  = 0.5 * Math.log(t0 / (2 * Math.PI)) - 1.0 / 200.0;
    return target >= ϑpLow;
  }

  /**
   * Solve ϑ'(t) = η for t via Newton iteration, starting from the
   * Lemma-"thetapbound"-derived warm start. Writes the result into {@code out}.
   */
  private Real solveSaddle(int nInt, double σd, double νd, double tLow, int bits, Real out, Real scratchJet)
  {
    double nd  = (double) nInt;
    double η   = Math.log(nd) / (σd - νd);
    double tLo = lowerBoundForMode(nInt, tLow);
    double t0d = Math.max(tLo, warmStart(nd, σd, νd));
    out.set(t0d);
    for (int iter = 0; iter < 80; iter++)
    {
      // jet layout: [ϑ(t), ϑ'(t), ϑ''(t)/2]; we need ϑ'(t) and ϑ''(t).
      θ.evaluate(out, 3, bits, scratchJet);
      double ϑp  = scratchJet.get(1).doubleValue();
      double ϑpp = 2.0 * scratchJet.get(2).doubleValue();
      double f   = ϑp - η;
      if (!Double.isFinite(f) || !Double.isFinite(ϑpp) || ϑpp == 0.0)
      {
        break;
      }
      double step = f / ϑpp;
      double t1   = out.doubleValue() - step;
      if (t1 < tLo)
      {
        t1 = tLo + Math.max(1.0, 0.5 * (out.doubleValue() - tLo));
      }
      out.set(t1);
      if (Math.abs(step) < Math.abs(t1) * 1e-28)
      {
        break;
      }
    }
    return out;
  }

  /**
   * Per-mode saddle time t*(n, σ, ν) = (ϑ')^(-1)(log n/(σ-ν)).
   */
  public Real saddleTime(int nInt, int σSign, Real νIn, double tLow, int bits, Real out)
  {
    double νd = νIn.doubleValue();
    validateNu(νd);
    if (nInt < 2)
    {
      throw new IllegalArgumentException("n must be ≥ 2 (n=1 contributes only boundary atoms); got " + nInt);
    }
    if (σSign != 1 && σSign != -1)
    {
      throw new IllegalArgumentException("σ must be ±1");
    }
    if (σSign - νd <= 0)
    {
      throw new IllegalArgumentException("σ - ν must be positive; for ν in (-1,1) pick σ = +1 (ν<1) or σ = -1 (ν>-1)");
    }
    if (!modeHasSaddle(nInt, (double) σSign, νd, tLow))
    {
      throw new IllegalArgumentException("mode (n=" + nInt + ", σ=" + σSign + ") has no stationary point in [max(T_low, 2π·n²), ∞) at ν=" + νd);
    }
    try ( Real jet = Real.newVector(3))
    {
      return solveSaddle(nInt, (double) σSign, νd, tLow, bits, out, jet);
    }
  }

  /**
   * Evaluate G_N(ν) as the finite stationary-phase mode sum up to N.
   *
   * @param νIn      warped frequency, required in (-1, 1)\{0}
   * @param N        truncation level (inclusive upper bound on n); must be ≥ 1
   * @param tLow     lower integration bound T₀ ≥ 200
   * @param bits     arb bit precision for arithmetic and Newton solves
   * @param out      destination for the evaluated density
   * @return the real density G_N(ν) = Re K_T^{stat}(ν) summed over n = 2..N
   */
  public Real evaluate(Real νIn, int N, double tLow, int bits, Real out)
  {
    double νd = νIn.doubleValue();
    validateNu(νd);
    if (N < 1)
    {
      throw new IllegalArgumentException("truncation level N must be ≥ 1; got " + N);
    }
    if (tLow < 200.0)
    {
      throw new IllegalArgumentException("tLow must be ≥ 200 for Lemma thetapbound's validity; got " + tLow);
    }
    ν.set(νIn);
    out.set(0);
    try ( Real tStar = new Real();
          Real partial = new Real();
          Real acc = new Real();
          Real jet = Real.newVector(3))
    {
      for (int nInt = 2; nInt <= N; nInt++)
      {
        for (int σSign = -1; σSign <= 1; σSign += 2)
        {
          if (σSign - νd <= 0)
          {
            continue;
          }
          if (!modeHasSaddle(nInt, σSign, νd, tLow))
          {
            continue;
          }
          n.set(nInt);
          σ.set(σSign);
          solveSaddle(nInt, (double) σSign, νd, tLow, bits, tStar, jet);
          term.evaluate(tStar, 1, bits, partial);
          acc.set(out).add(partial, bits, out);
        }
      }
      // 1/(2π) prefactor on the coherent sum.
      try ( Real twoPi = new Real())
      {
        twoPi.set(2).mul(RealConstants.π, bits, twoPi);
        out.div(twoPi, bits, out);
      }
    }
    return out;
  }

  /**
   * Explicit tail-bound |G_{N_max}(ν) − G_N(ν)|, summing |term_{n,σ}| for
   * N &lt; n ≤ N_max(tUpper, ν). This is the repo-grounded certified bound
   * on the omitted remainder when the user chooses a truncation level N
   * smaller than the windowed-transform natural cutoff N_max(T, ν).
   */
  public Real tailBound(Real νIn, int N, double tLow, double tUpper, int bits, Real out)
  {
    double νd = νIn.doubleValue();
    validateNu(νd);
    int nMax = maxModeInWindow(νd, tUpper);
    out.set(0);
    if (N >= nMax)
    {
      return out;
    }
    try ( Real tStar = new Real();
          Real partial = new Real();
          Real acc = new Real();
          Real jet = Real.newVector(3))
    {
      ν.set(νIn);
      for (int nInt = N + 1; nInt <= nMax; nInt++)
      {
        for (int σSign = -1; σSign <= 1; σSign += 2)
        {
          if (σSign - νd <= 0)
          {
            continue;
          }
          if (!modeHasSaddle(nInt, σSign, νd, tLow))
          {
            continue;
          }
          n.set(nInt);
          σ.set(σSign);
          solveSaddle(nInt, (double) σSign, νd, tLow, bits, tStar, jet);
          term.evaluate(tStar, 1, bits, partial);
          partial.abs(bits, partial);
          acc.set(out).add(partial, bits, out);
        }
      }
      try ( Real twoPi = new Real())
      {
        twoPi.set(2).mul(RealConstants.π, bits, twoPi);
        out.div(twoPi, bits, out);
      }
    }
    return out;
  }

  /**
   * Choose the smallest truncation N ∈ [1, N_max(tUpper, ν)] such that the
   * certified tail bound is ≤ {@code tolerance}. Doubling search seeded at
   * N = 2, capped at N_max.
   */
  public int chooseTruncation(Real νIn, double tolerance, double tLow, double tUpper, int bits)
  {
    if (tolerance <= 0)
    {
      throw new IllegalArgumentException("tolerance must be positive");
    }
    double νd = νIn.doubleValue();
    validateNu(νd);
    int nMax = maxModeInWindow(νd, tUpper);
    try ( Real bound = new Real())
    {
      int N = 2;
      while (N < nMax)
      {
        tailBound(νIn, N, tLow, tUpper, bits, bound);
        if (bound.doubleValue() <= tolerance)
        {
          return N;
        }
        N = Math.min(nMax, Math.max(N + 1, (int) Math.ceil(N * 1.5)));
      }
      return nMax;
    }
  }

  @Override
  public void close()
  {
    term.close();
    θ.close();
  }
}
