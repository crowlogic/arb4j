package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.MuntzPadeCumulantGenerator;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.RealSequence;
import arb.utensils.Utensils;

/**
 * Rough Heston characteristic function (El Euch–Rosenbaum 2019, eq 1.8) at a
 * fixed maturity {@code T}:
 *
 * <pre>
 *   φ(u, T) = exp( θλ · ∫₀ᵀ h(u, s) ds  +  V₀ · I^{1-μ} h(u, ·)(T) )
 * </pre>
 *
 * where {@code h(u, t)} solves the constant-coefficient fractional Riccati
 *
 * <pre>
 *   D^μ h = ½(-u² - iu) + λ(iuρν - 1)·h + ½(λν)²·h²,    h(0) = 0,
 *   μ = H + ½ ∈ (½, 1)
 * </pre>
 *
 * <h2>Müntz-lattice expansion</h2>
 *
 * Term-by-term integration of the Riccati Müntz series gives the lattice
 * representation (see {@code docs/Muntz lattice expansion of the rough Heston
 * cumulant generating function.txt}):
 *
 * <pre>
 *   Φ(v, T) = Σ_{k≥0} [ u_k · a_k(v) + w_k · a_{k+1}(v) ] · T^{kμ+1}
 *   u_k = θλ / (kμ + 1)
 *   w_k = V₀ · Γ((k+1)μ + 1) / Γ(kμ + 2)
 *   a_0(v) := 0
 *
 *   φ_N(v, T) = exp(Φ_N(v, T))
 * </pre>
 *
 * Implemented by composing {@link MuntzPadeCumulantGenerator} with the
 * rough-Heston-specific weights u and w, then wrapping the resulting CGF
 * in {@code exp}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public class RoughHestonCharacteristicFunction implements
                                               ComplexFunction,
                                               AutoCloseable
{
  // ───── Default parameter values ──────────────────────────────────────
  private static final String DEFAULT_λ    = "0.3";
  private static final String DEFAULT_θ    = "0.02";
  private static final String DEFAULT_ν    = "0.3";
  private static final String DEFAULT_V0   = "0.02";
  private static final String DEFAULT_ρ    = "-0.7";
  private static final String DEFAULT_μ    = "0.6";
  private static final String DEFAULT_T    = "1.0";
  private static final int    DEFAULT_N    = 5;
  private static final int    DEFAULT_PREC = 128;

  /** Mean-reversion speed of the variance. */
  public final Real    λ;
  /** Long-run variance level. */
  public final Real    θ;
  /** Vol-of-vol. */
  public final Real    ν;
  /** Initial variance V(0). */
  public final Real    V0;
  /** Correlation. */
  public final Real    ρ;
  /** Fractional order μ = H + ½; same instance as {@code riccati.α}. */
  public final Real    μ;
  /** Maturity T > 0. */
  public final Real    T;

  /** The Context backing this CF. */
  public final Context context;

  /** The fractional Riccati solver supplying a_k(u). */
  public final RoughHestonRiccatiMuntzPadeFunctional riccati;

  /** Compiled Müntz coefficient sequence k ↦ a_k(v). */
  public final ComplexPolynomialSequence a;

  /**
   * General Müntz-lattice cumulant generator. Built from the rough-Heston
   * lattice weights
   *
   * <pre>
   *   u: k ➔ θ*λ / (k*μ + 1)
   *   w: k ➔ V0 * Γ((k+1)*μ + 1) / Γ(k*μ + 2)
   * </pre>
   *
   * and the Riccati Müntz coefficient sequence {@code a}. Exposes the cumulant
   * {@code Φ(v, T) = Σ_{k=0..N} d_k(v) T^{kμ+1}}.
   */
  public final MuntzPadeCumulantGenerator cgf;

  /**
   * Müntz truncation order of the cumulant series, owned by {@link #cgf}. Mutate
   * via {@code N.set(...)} to change the truncation without recompile.
   */
  public final Integer N;

  /**
   * Compiled characteristic function:
   *
   * <pre>
   *   φ(v) = exp(Φ(v, T))
   * </pre>
   *
   * with Φ supplied by {@link #cgf}. A single compiled expression — no per-call
   * Java arithmetic. {@code N} is the {@link #cgf}'s truncation order; mutate
   * via {@link #setN}.
   */
  public final ComplexFunction φ;

  private final boolean ownsParameters;

  // ─────────────────────────────────────────────────────────────────────
  // No-arg / JShell-friendly constructor
  // ─────────────────────────────────────────────────────────────────────

  public RoughHestonCharacteristicFunction(Complex v)
  {
    this.λ  = new Real(DEFAULT_λ,  DEFAULT_PREC).setName("λ");
    this.θ  = new Real(DEFAULT_θ,  DEFAULT_PREC).setName("θ");
    this.ν  = new Real(DEFAULT_ν,  DEFAULT_PREC).setName("ν");
    this.V0 = new Real(DEFAULT_V0, DEFAULT_PREC).setName("V0");
    this.ρ  = new Real(DEFAULT_ρ,  DEFAULT_PREC).setName("ρ");
    this.T  = new Real(DEFAULT_T,  DEFAULT_PREC).setName("T");
    Real μSeed = new Real(DEFAULT_μ, DEFAULT_PREC).setName("μ");

    this.context = new Context(this.λ, this.θ, this.ν, this.V0, this.ρ, this.T, μSeed);

    this.riccati = new RoughHestonRiccatiMuntzPadeFunctional(context, μSeed);
    this.μ       = riccati.α;
    this.a       = riccati.a;

    this.cgf = buildCgf(context, a);
    this.N   = cgf.N;
    this.φ   = ComplexFunction.express("φ:v➔exp(Φ(v))", context);

    this.ownsParameters = true;
  }

  public RoughHestonCharacteristicFunction()
  {
    this(ComplexConstants.zero);
  }

  // ─────────────────────────────────────────────────────────────────────
  // Context-based constructor (compose into a larger model)
  // ─────────────────────────────────────────────────────────────────────

  public RoughHestonCharacteristicFunction(Context context, Complex v)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");

    this.context = context;

    this.λ  = required(context, "λ");
    this.θ  = required(context, "θ");
    this.ν  = required(context, "ν");
    this.V0 = required(context, "V0");
    this.ρ  = required(context, "ρ");
    this.T  = required(context, "T");
    Real μFromCtx = required(context, "μ");

    this.riccati = new RoughHestonRiccatiMuntzPadeFunctional(context, μFromCtx);
    this.μ       = riccati.α;
    this.a       = riccati.a;

    this.cgf = buildCgf(context, a);
    this.N   = cgf.N;
    this.φ   = ComplexFunction.express("φ:v➔exp(Φ(v))", context);

    this.ownsParameters = false;
  }

  /**
   * Wire the rough-Heston-specific lattice weights and hand them to the general
   * {@link MuntzPadeCumulantGenerator}. The CGF registers itself as {@code Φ}
   * in the context so the exp wrapper above can call it.
   */
  private static MuntzPadeCumulantGenerator buildCgf(Context context,
                                                     ComplexPolynomialSequence a)
  {
    RealSequence u = RealSequence.express("u:k➔θ*λ/(k*μ+1)", context);
    RealSequence w = RealSequence.express("w:k➔V0*Γ((k+1)*μ+1)/Γ(k*μ+2)", context);
    return new MuntzPadeCumulantGenerator(context, a, u, w, DEFAULT_N);
  }

  // ─────────────────────────────────────────────────────────────────────
  // evaluate: φ_N(u, T) = exp( Σ_{k=0..N} d_k(u) · T^(k·μ + 1) )  via cgf.Φ
  //   d_k(u) = κθ · a_k(u)/(kμ+1) + V_0 · Γ((k+1)μ+1)/Γ(kμ+2) · a_{k+1}(u),  a_0 ≡ 0
  // ─────────────────────────────────────────────────────────────────────

  @Override
  public Complex evaluate(Complex uVal, int order, int bits, Complex res)
  {
    return φ.evaluate(uVal, order, bits, res);
  }

  // ─────────────────────────────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────────────────────────────

  private static Real required(Context context, String name)
  {
    Real var = context.getVariable(name);
    if (var == null)
      throw new IllegalArgumentException("Context is missing required variable '" + name + "'");
    return var;
  }

  /**
   * The cumulant generating polynomial Φ(v,T) = Σ_k d_k(v)·T^{kμ+1} formed as a
   * ring element: the k-sum runs until T^{kμ+1}·‖d_k‖ falls below 2^{-bits-16},
   * the same exit the compiled {k=0..∞} sum uses. No order cap.
   */
  public ComplexPolynomial cumulantGeneratingPolynomial(int bits, ComplexPolynomial Φ)
  {
    Φ.fitLength(1);
    Φ.setLength(1);
    Φ.get(0).zero();
    try ( Real floor = new Real(); Real Tk = new Real(); Real exponent = new Real(); Real norm = new Real();
          ComplexPolynomial dk = new ComplexPolynomial(); ComplexPolynomial term = new ComplexPolynomial();
          Integer kk = new Integer())
    {
      floor.one().mul2e(-bits - 16, floor);
      for (int k = 0;; k++)
      {
        kk.set(k);
        cgf.d.evaluate(kk, 1, bits, dk);
        μ.mul(k, bits, exponent).add(1, bits, exponent);
        T.pow(exponent, bits, Tk);
        dk.abs(bits, norm).mul(Tk, bits, norm);
        if (norm.compareTo(floor) <= 0 && k > 0)
        {
          return Φ;
        }
        dk.mul(Tk, bits, term);
        Φ.add(term, bits, Φ);
      }
    }
  }

  /**
   * The [2M+2/2M] Padé representation of Φ(v,T) in the Fourier variable v,
   * split by one Euclidean division into the Gaussian head −½σ_T²v² − iμ_T·v
   * and the proper rational part P/D, returned as the partial-fraction data
   * (σ_T², μ_T, poles u_j = roots of D with Im u_j &lt; 0, residues A_j =
   * P(u_j)/D'(u_j)). σ_T² must be strictly positive — the input is refused
   * otherwise.
   */
  public RoughHestonPartialFractionExpansion partialFractionExpansion(int M, int bits)
  {
    // The Toeplitz solve, division, and root isolation are performed at a
    // working precision that doubles until every root of the denominator is
    // isolated: the coefficient balls at too few bits cannot separate close
    // roots, and a tighter construction is always available because Φ is
    // computable to any precision. The returned enclosures, computed at the
    // final working precision, are valid at every coarser read precision.
    for (int w = bits;; w *= 2)
    {
      try
      {
        return expansionAtWorkingPrecision(M, w);
      }
      catch (ArithmeticException rootIsolation)
      {
        if (!rootIsolation.getMessage().contains("isolated only"))
          throw rootIsolation;
      }
    }
  }

  private RoughHestonPartialFractionExpansion expansionAtWorkingPrecision(int M, int bits)
  {
    final int L  = 2 * M + 2;
    final int Nd = 2 * M;
    try ( ComplexPolynomial Φ = new ComplexPolynomial())
    {
      cumulantGeneratingPolynomial(bits, Φ);
      if (Φ.degree() < L + Nd)
        throw new ArithmeticException("cumulant polynomial degree " + Φ.degree()
                                      + " < required Taylor order " + (L + Nd) + " for M=" + M
                                      + "; the Müntz series at " + bits + " bits does not carry order " + (L + Nd));

      try ( ComplexMatrix A = ComplexMatrix.newMatrix(Nd, Nd);
            ComplexMatrix rhs = ComplexMatrix.newMatrix(Nd, 1);
            ComplexMatrix bsol = ComplexMatrix.newMatrix(Nd, 1);
            Complex neg = new Complex(); Complex acc = new Complex(); Complex t = new Complex();
            ComplexPolynomial D = new ComplexPolynomial();
            ComplexPolynomial Num = new ComplexPolynomial();
            ComplexPolynomial quo = new ComplexPolynomial())
      {
        // Denominator: Σ_{j=1..Nd} b_j·c_{L+i−j} = −c_{L+i}, i=1..Nd, b_0=1.
        for (int i = 1; i <= Nd; i++)
        {
          for (int j = 1; j <= Nd; j++)
          {
            int idx = L + i - j;
            A.set(i - 1, j - 1, idx >= 0 ? Φ.get(idx) : ComplexConstants.zero);
          }
          Φ.get(L + i).neg(neg);
          rhs.set(i - 1, 0, neg);
        }
        A.solve(rhs, bits, bsol);

        D.fitLength(Nd + 1);
        D.setLength(Nd + 1);
        D.get(0).one();
        for (int j = 1; j <= Nd; j++)
          D.get(j).set(bsol.get(j - 1, 0));

        // Numerator: N_i = Σ_{j=0..min(i,Nd)} b_j·c_{i−j}, i=0..L.
        Num.fitLength(L + 1);
        Num.setLength(L + 1);
        for (int i = 0; i <= L; i++)
        {
          acc.zero();
          for (int j = 0; j <= Math.min(i, Nd); j++)
          {
            D.get(j).mul(Φ.get(i - j), bits, t);
            acc.add(t, bits, acc);
          }
          Num.get(i).set(acc);
        }

        // Num = quo·D + P with deg quo = 2: σ_T² = −2·Re(quo₂), μ_T = −Im(quo₁).
        Num.div(D, bits, quo);
        ComplexPolynomial P = quo.remainder;

        Real σT2 = new Real();
        σT2.set(quo.get(2).re()).mul(-2, bits, σT2);
        Real μT = new Real();
        μT.set(quo.get(1).im()).neg(μT);

        Complex poles    = D.roots(bits);
        Complex residues = Complex.newVector(poles.dim());
        try ( ComplexPolynomial Dp = new ComplexPolynomial();
              Complex pv = new Complex(); Complex dpv = new Complex())
        {
          D.differentiate(bits, Dp);
          for (int j = 0; j < poles.dim(); j++)
          {
            P.evaluate(poles.get(j), 1, bits, pv);
            Dp.evaluate(poles.get(j), 1, bits, dpv);
            pv.div(dpv, bits, residues.get(j));
          }
        }
        return new RoughHestonPartialFractionExpansion(M,
                                                       σT2,
                                                       μT,
                                                       poles,
                                                       residues);
      }
    }
  }



  @Override
  public void close()
  {
    if (φ        != null) φ.close();
    if (cgf      != null) cgf.close();
    if (riccati  != null) riccati.close();
    if (ownsParameters)
      Utensils.close(λ, θ, ν, V0, ρ, T, μ);
  }
}
