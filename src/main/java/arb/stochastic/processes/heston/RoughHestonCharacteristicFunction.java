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
 *   φ(v, T) = exp(Φ(v, T))
 * </pre>
 *
 * Φ is compiled directly as the infinite series {@code Σk➔d(k)(v)·T^(k*μ+1){k=0..∞}},
 * whose inline convergence exit supplies the least order whose tail lies within
 * the certified ball radius, then wrapped in {@code exp}.
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
   * Consolidated cumulant coefficient sequence
   * {@code d : k ➔ v ➔ u(k)·a(k)(v) + w(k)·a(k+1)(v)} (with {@code a(0)(v) := 0}),
   * registered in the context and summed by {@link #Φ}.
   */
  public final ComplexPolynomialSequence d;

  /**
   * The cumulant generating function, compiled directly as the infinite Müntz
   * series
   *
   * <pre>
   *   Φ(v, T) = Σ_{k=0..∞} d_k(v) · T^{kμ+1}
   *   d_k(v) = u_k · a_k(v) + w_k · a_{k+1}(v),   a_0(v) := 0
   * </pre>
   *
   * from the rough-Heston lattice weights u, w and the Riccati Müntz coefficient
   * sequence {@code a}. Registered as {@code Φ} in the context so the exp wrapper
   * can call it. Its inline convergence exit supplies the least order whose tail
   * lies within the certified ball radius — the order is never an input.
   */
  public final ComplexFunction Φ;

  /**
   * Compiled characteristic function:
   *
   * <pre>
   *   φ(v) = exp(Φ(v, T))
   * </pre>
   *
   * with Φ supplied by {@link #Φ}. A single compiled expression — no per-call
   * Java arithmetic.
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

    this.Φ   = buildCgf(context, a);
    this.d   = (ComplexPolynomialSequence) context.lookupFunctionInstance("d");
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

    this.Φ   = buildCgf(context, a);
    this.d   = (ComplexPolynomialSequence) context.lookupFunctionInstance("d");
    this.φ   = ComplexFunction.express("φ:v➔exp(Φ(v))", context);

    this.ownsParameters = false;
  }

  /**
   * Wire the rough-Heston-specific lattice weights, the consolidated coefficient
   * sequence {@code d}, and express the cumulant generating function directly as
   * the infinite Müntz series
   *
   * <pre>
   *   Φ : v ➔ Σk➔d(k)(v)·T^(k*μ+1) {k=0..∞}
   * </pre>
   *
   * registered as {@code Φ} in the context so the exp wrapper can call it. The
   * {@code a(0)(v) := 0} convention is enforced via {@code when(k=0, …)}.
   */
  private static ComplexFunction buildCgf(Context context,
                                          ComplexPolynomialSequence a)
  {
    if (context.getFunctionMapping("a") == null)
      context.registerFunction("a", a);
    RealSequence.express("u:k➔θ*λ/(k*μ+1)", context);
    RealSequence.express("w:k➔V0*Γ((k+1)*μ+1)/Γ(k*μ+2)", context);
    ComplexPolynomialSequence.express("d:k➔v➔when(k=0,w(0)*a(1)(v),else,u(k)*a(k)(v)+w(k)*a(k+1)(v))", context);
    return ComplexFunction.express("Φ:v➔Σk➔d(k)(v)*T^(k*μ+1){k=0..∞}", context);
  }

  // ─────────────────────────────────────────────────────────────────────
  // evaluate: φ(v, T) = exp( Σ_{k=0..∞} d_k(v) · T^(k·μ + 1) )  via Φ
  //   d_k(v) = θλ · a_k(v)/(kμ+1) + V_0 · Γ((k+1)μ+1)/Γ(kμ+2) · a_{k+1}(v),  a_0 ≡ 0
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
   * The {@code v}-Taylor coefficients {@code c_n = [vⁿ]Φ(v,T)} of the cumulant
   * generating function, summed to convergence at the model maturity {@code T}.
   *
   * <p>Because Φ(v,T)=Σ_k d_k(v)·T^{kμ+1} and each {@code [vⁿ]d_k(v)} is a fixed
   * ball, the coefficient series {@code Σ_k [vⁿ]d_k(v)·T^{kμ+1}} is a scalar
   * absolutely-convergent series (the Müntz lattice weights carry Γ-ratio decay);
   * it is summed until the added term falls below the working-precision floor.
   * No Padé-in-z resummation is required at the model maturity — the raw Müntz
   * series converges there (verified: per-term magnitude decays geometrically).
   *
   * @param upTo highest {@code v}-power to return (result has {@code upTo+1} elements)
   * @param bits working precision
   * @return a {@code Complex} vector {@code c} with {@code c.get(n) = [vⁿ]Φ(v,T)}
   */
  public Complex cumulantTaylorCoefficients(int upTo, int bits)
  {
    Complex c = Complex.newVector(upTo + 1);
    c.zero();
    Real     floor = new Real().one().mul2e(-bits, new Real());
    try ( Complex term = new Complex(); Real Tk = new Real(); Real mag = new Real();
          Integer kk = new Integer(); Real exponent = new Real();
          ComplexPolynomial dk = new ComplexPolynomial() )
    {
      int    stable = 0;
      for (int k = 0; stable < 3; k++)
      {
        kk.set(k);
        d.evaluate(kk, 1, bits, dk);
        // T^{kμ+1}
        μ.mul(k, bits, exponent).add(1, bits, exponent);
        T.pow(exponent, bits, Tk);
        double maxTerm = 0;
        for (int n = 1; n <= upTo && n < dk.getLength(); n++)
        {
          dk.get(n).mul(Tk, bits, term);
          c.get(n).add(term, bits, c.get(n));
          term.abs(bits, mag);
          maxTerm = Math.max(maxTerm, mag.doubleValue());
        }
        stable = (mag.compareTo(floor) <= 0 && maxTerm == mag.doubleValue()) ? stable + 1 : 0;
        if (k > 8 && maxTerm < floor.doubleValue())
          stable++;
        if (k > 2000)
          throw new ArithmeticException("cumulant Taylor series failed to converge at T=" + T);
      }
    }
    floor.close();
    return c;
  }

  /**
   * The {@code [2M+2 / 2M]} Padé-in-{@code v} surrogate of the cumulant
   * generating function Φ(v,T), split by one Euclidean division into
   *
   * <pre>
   *   Φ_M(v) = −½σ_T²·v² − i·μ_T·v + ρ(v),   ρ = P/D,   deg P &lt; deg D = 2M
   * </pre>
   *
   * (docs/single-series-pricing.md §3.1). The Padé denominator {@code D} is the
   * solution of the Toeplitz system built from the {@code v}-Taylor coefficients
   * {@code c_n} (with {@code D(0)=1}); the numerator {@code N} is the convolution
   * {@code D·c}; and one {@link ComplexPolynomial#div(ComplexPolynomial,int,ComplexPolynomial)}
   * yields the quotient (from which {@code σ_T² = −2·quo₂}, {@code μ_T = i·quo₁})
   * and the remainder {@code P}. The poles {@code u_j} are the roots of {@code D};
   * the residues {@code A_j = P(u_j)/D'(u_j)}.
   *
   * <p>{@code σ_T² > 0} is verified (refuse the input otherwise — never silently
   * patch, §3.1).
   *
   * @param M    Padé half-order; the denominator has degree {@code 2M}
   * @param bits working precision
   * @return the surrogate {@code (σ_T², μ_T, u, A)}
   */
  public RoughHestonPartialFractionExpansion partialFractionExpansion(int M, int bits)
  {
    final int L  = 2 * M + 2;
    final int Nd = 2 * M;
    Complex   c  = cumulantTaylorCoefficients(L + Nd, bits);

    try ( ComplexMatrix A = ComplexMatrix.newMatrix(Nd, Nd);
          ComplexMatrix rhs = ComplexMatrix.newMatrix(Nd, 1);
          ComplexMatrix bsol = ComplexMatrix.newMatrix(Nd, 1);
          Complex neg = new Complex(); Complex acc = new Complex(); Complex t = new Complex();
          Complex two = new Complex(); Complex sigma2 = new Complex(); Complex muT = new Complex();
          ComplexPolynomial D = new ComplexPolynomial();
          ComplexPolynomial N = new ComplexPolynomial();
          ComplexPolynomial quo = new ComplexPolynomial() )
    {
      // Denominator: Σ_{j=1}^{Nd} b_j c_{L+i-j} = −c_{L+i},  i=1..Nd,  b_0=1
      for (int i = 1; i <= Nd; i++)
      {
        for (int j = 1; j <= Nd; j++)
        {
          int idx = L + i - j;
          A.set(i - 1, j - 1, idx >= 0 ? c.get(idx) : ComplexConstants.zero);
        }
        c.get(L + i).negate(neg);
        rhs.set(i - 1, 0, neg);
      }
      A.solve(rhs, bits, bsol);

      D.setLength(Nd + 1);
      D.set(0, ComplexConstants.one);
      for (int j = 1; j <= Nd; j++)
        D.set(j, bsol.get(j - 1, 0));

      // Numerator a_i = Σ_{j=0}^{min(i,Nd)} b_j c_{i-j}
      N.setLength(L + 1);
      for (int i = 0; i <= L; i++)
      {
        acc.zero();
        for (int j = 0; j <= Math.min(i, Nd); j++)
        {
          D.get(j).mul(c.get(i - j), bits, t);
          acc.add(t, bits, acc);
        }
        N.set(i, acc);
      }

      // N = quo·D + P
      N.div(D, bits, quo);
      ComplexPolynomial P = quo.remainder;

      two.set(2, 0);
      quo.get(2).mul(two, bits, sigma2).negate(sigma2);       // σ_T² = −2·quo₂
      quo.get(1).mul(ComplexConstants.imaginaryUnit, bits, muT); // μ_T = i·quo₁

      Real σT2 = new Real().set(sigma2.re());
      if (σT2.sign() <= 0)
        throw new ArithmeticException("σ_T² must be strictly positive; got " + σT2
                                      + " (refusing the input — never silently patch, §3.1)");
      Real μTr = new Real().set(muT.re());

      // Poles = roots of D; residues A_j = P(u_j)/D'(u_j)
      Complex poles = D.roots(bits);
      Complex residues = Complex.newVector(poles.dim);
      try ( ComplexPolynomial Dp = new ComplexPolynomial();
            Complex pv = new Complex(); Complex dpv = new Complex() )
      {
        D.differentiate(bits, Dp);
        for (int j = 0; j < poles.dim; j++)
        {
          P.evaluate(poles.get(j), 1, bits, pv);
          Dp.evaluate(poles.get(j), 1, bits, dpv);
          pv.div(dpv, bits, residues.get(j));
        }
      }
      return new RoughHestonPartialFractionExpansion(M, σT2, μTr, poles, residues);
    }
    finally
    {
      c.close();
    }
  }



  @Override
  public void close()
  {
    if (φ        != null) φ.close();
    if (Φ        != null) Φ.close();
    if (riccati  != null) riccati.close();
    if (ownsParameters)
      Utensils.close(λ, θ, ν, V0, ρ, T, μ);
  }
}
