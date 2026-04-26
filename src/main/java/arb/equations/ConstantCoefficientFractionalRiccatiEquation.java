package arb.equations;

import arb.Integer;
import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Initializable;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexSequence;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

/**
 * Constant-coefficient (in time) fractional Riccati equation
 *
 * <pre>
 *   Đᵅ y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²,    y(0)=0,    α = μ ∈ (0,1)
 * </pre>
 *
 * <p>
 * "Constant-coefficient" means the coefficients <code>p, q, r</code> do not
 * depend on time <code>t</code>. They are functions of the Fourier parameter
 * <code>v</code> alone — supplied as expression strings in <code>v</code>
 * (and any other parameters already registered in the supplied
 * {@link Context}). The fully general fractional Riccati would have
 * <code>p(v,t), q(v,t), r(v,t)</code> — bivariate in <code>v</code> and
 * <code>t</code>; this class is the time-independent specialization, for
 * which the Müntz series and diagonal Padé reorganization of
 * qrh.tex §§2–3 yield a closed-form-via-recurrence solution.
 * </p>
 *
 * <p>
 * Solved by the two-stage Müntz–Padé construction of Crowley (qrh.tex §§2–3):
 *
 * <ol>
 * <li><b>Local stage (Müntz–Tau).</b> Form the Puiseux series
 * <code>y(t) = Σ a_k(v) tᵏᵘ</code> from the algebraic recurrence
 *
 * <pre>
 *   a_1(v) = p(v) / Γ(μ+1)
 *   γ_k    = Γ((k-1)μ+1) / Γ(kμ+1)
 *   a_k(v) = γ_k · ( q(v)·a_{k-1}(v) + r(v) Σ_{j=1}^{k-2} a_j(v)·a_{k-1-j}(v) ),  k≥2
 * </pre>
 *
 * The recurrence is one expression compiled once, not a Java loop with manual
 * arithmetic. Each <code>a_k</code> is a <code>ComplexFunction</code> in
 * <code>v</code>; the convolution sum at <code>k=2</code> has empty index range
 * and reduces to zero (Remark 2.2).</li>
 * <li><b>Global stage (Padé reorganization).</b> Re-sum
 * <code>g(z) = y(z^{1/μ}) = Σ a_k(v) zᵏ</code> by diagonal
 * <code>R_M(z) = P_M(z)/Q_M(z)</code> whose denominator coefficients solve the
 * Hankel system <code>H_M·q = -b</code> (qrh.tex §3.1). Under de Montessus de
 * Ballore / Nuttall–Pommerenke (§3.5), the diagonal sequence
 * <code>R_M(t^μ)</code> converges to <code>y(t)</code> for every
 * <code>t ≥ 0</code> not at a pole abscissa, recovering global validity that
 * the raw Müntz series cannot provide.</li>
 * </ol>
 *
 * <h2>Parameter binding</h2> The Fourier parameter <code>v</code> is a
 * <code>Complex</code> stored in the <code>Context</code>; generated code reads
 * it by reference. Outer Newton/MLE loops mutate <code>v</code> and call
 * <code>solve</code> again; the compiled Müntz sequence is reused, only the
 * Padé numerics are rebuilt.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ConstantCoefficientFractionalRiccatiEquation extends
                                                          ComplexEquation implements
                                                          Initializable,
                                                          AutoCloseable
{

  public static final String      FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t)=t➔p(v)+q(v)*y(t)+r(v)*y(t)²";

  /**
   * Fractional order μ ∈ (0,1), bound into the Context as the variable named
   * "μ". After {@link #initialize()} runs, {@code this.α} is the very same
   * {@link Real} instance that lives at name "μ" in the Context — by identity,
   * not by value-copy. Mutating either propagates to the other.
   *
   * <p>If the caller's Context already has μ registered when the constructor
   * runs, that pre-existing instance becomes {@code this.α} and the constructor
   * argument α is used only to seed its numeric value (existingMu.set(seed)).
   * Otherwise a fresh {@link Real} is created, seeded, and registered.</p>
   */
  public Real                     α;

  /**
   * Whether {@link #α} is owned by this instance (true: created here, must be
   * closed in {@link #close()}) or borrowed from the caller's Context (false:
   * the caller is responsible for closing it).
   */
  private boolean                 ownsAlpha;

  /**
   * Seed value for α, captured from the constructor argument. Used by
   * {@link #initialize()} to populate whichever Real ends up canonical.
   * Closed during {@link #close()} only if it was a fresh allocation we
   * never adopted as canonical (i.e. the caller's μ was already present).
   */
  private final Real              αSeed                       = new Real();

  /** Source expression for p(v). */
  public String                   constantTerm;
  /** Source expression for q(v). */
  public String                   linearTerm;
  /** Source expression for r(v). */
  public String                   quadraticTerm;

  /** Compiled p(v), q(v), r(v) as ComplexFunctions over the Fourier parameter v. */
  public ComplexFunction          p;
  public ComplexFunction          q;
  public ComplexFunction          r;

  /**
   * The compiled Müntz coefficient sequence k ↦ a_k — a
   * {@code Function<Integer,Complex>} whose body reads p, q, r and v from
   * the Context. Driven by one expression, no Java arithmetic loop. To
   * obtain a_k at a new v, mutate the Context's v and re-evaluate.
   */
  public ComplexSequence          a;

  /**
   * The Fourier parameter v as a Complex Context variable. If the user already
   * registered "v" in the supplied Context, that reference is reused and the
   * caller retains ownership of the storage; otherwise a fresh Complex is
   * created and registered.
   */
  public Complex                  v;

  public ConstantCoefficientFractionalRiccatiEquation(Context context, Real α, String p, String q, String r)
  {
    super(context);
    this.αSeed.set(α);
    this.constantTerm  = p;
    this.linearTerm    = q;
    this.quadraticTerm = r;
    initialize();
  }

  public ConstantCoefficientFractionalRiccatiEquation(Real alpha, String p, String q, String r)
  {
    this(new Context(),
         alpha,
         p,
         q,
         r);
  }

  @Override
  public void initialize()
  {
    // Bind the fractional order μ as a Real Context variable. After this
    // block, this.α IS the Context's μ — same instance — so mutating either
    // side propagates. If the caller's Context already has μ, we adopt it
    // (seed value from αSeed is poured in); otherwise we register a fresh
    // Real seeded from αSeed.
    Real existingMu = context.getVariable("μ");
    if (existingMu == null)
    {
      Real fresh = new Real();
      fresh.set(αSeed);
      fresh.setName("μ");
      context.registerVariable(fresh);
      this.α         = fresh;
      this.ownsAlpha = true;
    }
    else
    {
      existingMu.set(αSeed);
      this.α         = existingMu;
      this.ownsAlpha = false;
    }

    // Ensure the Fourier parameter v is registered as a Complex Context
    // variable. If already present, reuse the caller's reference; otherwise
    // create one. Either way, generated code reads v by reference and the
    // caller mutates it for parameter sweeps.
    Complex existingV = context.getVariable("v");
    if (existingV == null)
    {
      v = context.registerVariable("v", new Complex().setName("v"));
    }
    else
    {
      v = existingV;
    }

    // Compile p(v), q(v), r(v) as ComplexFunctions. Whatever the user wrote —
    // polynomial, rational, transcendental — flows through as ComplexFunction.
    p = ComplexFunction.express("p", constantTerm, context);
    q = ComplexFunction.express("q", linearTerm, context);
    r = ComplexFunction.express("r", quadraticTerm, context);

    // Compile the Müntz recurrence as two mutually-recursive sequences.
    //
    //   S(k) = Σ_{j=1}^{k-2} a(j)·a(k-1-j)         convolution sum
    //   a(k) = when k=1: p(v)/Γ(μ+1)
    //          else:    γ_k · ( q(v)·a(k-1) + r(v)·S(k) )
    //
    // Splitting the convolution out of the body of `a` avoids the
    // sum-with-recursion-inline pattern that the expression compiler
    // recurses on infinitely. The expression compiler resolves the
    // a ↔ S cross-reference through Context lookups; both sequences are
    // in the same Context and each sees the other as a referenced
    // function (the self-reference guard at Expression.java:1086 fires
    // on the direct a→a reference inside `a`'s when-else branch and on
    // the S→S reference inside its body, while the cross-references
    // a→S and S→a are routed through ordinary FunctionMapping lookup).
    //
    // Pre-register `a` as a prototype (typed but not yet defined) before
    // compiling S, so S's body can resolve `a` to a typed mapping. When
    // `a` is then compiled, replace=true overwrites the prototype with
    // the real expression. Empty-range sum at k=2 (j=1..0) returns the
    // additive identity, implementing Remark 2.2 of qrh.tex.
    context.registerFunctionMapping("a",
                                    Integer.class,
                                    Complex.class,
                                    ComplexSequence.class);

    // Parse, compile and register S without instantiating it. This generates
    // class bytecode for S and registers the FunctionMapping, but defers
    // instance construction (which would walk S's public fields and force
    // the JVM to resolve `a`'s class — not yet defined).
    String sExpr = "S:k➔sum(j➔a(j)*a(k-1-j){j=1..k-2})";
    arb.functions.integer.Sequence.parseCompileAndRegister("S", Complex.class, sExpr, ComplexSequence.class, context);

    // Now express `a`, which compiles class bytecode for `a` and instantiates it.
    // By this point both classes S and a are defined in the ExpressionClassLoader,
    // so the field-injection reflection walk on `a` resolves successfully.
    String aExpr = "a:k➔when(k=1, p(v)/Γ(μ+1),"
                   + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                   + "       *(q(v)*a(k-1)+r(v)*S(k)))";
    a = ComplexSequence.express(aExpr, context);

    // The FRACTIONAL_RICCATI_EQUATION constant exists as a textual
    // description of the equation in standard mathematical form
    // (Ð^(μ) y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²). The Müntz–Padé solver
    // does not operate on its lhs/rhs symbolic expressions; it operates on
    // the recurrence for a_k compiled above, which encodes the same equation
    // in operational form. Calling initialize(FRACTIONAL_RICCATI_EQUATION,
    // context) would force the parser to symbolically expand the Caputo
    // derivative of the unbound symbol y, which is not meaningful here
    // (y is the unknown solution, not a function with a body to differentiate).
    // The string is retained as documentation; we do not parse it.
  }

  /**
   * The compiled Müntz coefficient sequence a_k.
   *
   * <p>
   * Returned as a {@link ComplexSequence}
   * ({@code Function<Integer, Complex>}) whose body reads p, q, r and the
   * Fourier parameter v from the Context. Mutating the Context's v and
   * re-evaluating produces a_k at the new v.
   * </p>
   */
  public ComplexSequence muntzCoefficients()
  {
    return a;
  }

  /**
   * Diagonal (M,M) Padé approximant <code>R_M(z) = P_M(z)/Q_M(z)</code> of
   * <code>g(z) = y(z^{1/μ}) = Σ a_k(v) zᵏ</code> at the current Context
   * <code>v</code>, returned as a callable
   * {@link ComplexFunction} whose <code>evaluate(z, ...)</code> computes
   * <code>P_M(z)/Q_M(z)</code>.
   *
   * <p>
   * Internally:
   * <ol>
   * <li>evaluate the first <code>2M</code> Müntz coefficients at the current
   * Context <code>v</code> to scalars <code>α_k ∈ ℂ</code>;</li>
   * <li>build the Hankel matrix
   * <code>H_M[i][j] = α_{M+i-j}</code>, RHS <code>b[i] = α_{M+1+i}</code>;</li>
   * <li>solve <code>H_M·q = -b</code> via {@code acb_mat_solve}; if singular
   * (<code>acb_mat_solve</code> returns 0), fall back to order <code>M-1</code>
   * (Remark 3.2);</li>
   * <li>back-substitute the numerator: <code>p_0 = 0</code>, and for
   * <code>n=1..M</code>,
   * <code>p_n = α_n + Σ_{j=1}^{min(n,M)} q_j·α_{n-j}</code>;</li>
   * <li>register <code>P_M, Q_M</code> as polynomials in a per-call
   * sub-context, return the compiled
   * <code>ComplexFunction.express("ℛ", "z -> P(z)/Q(z)", subCtx)</code>.</li>
   * </ol>
   * </p>
   *
   * @param M    diagonal Padé order
   * @param bits working precision
   * @return callable R_M(z) at the current Context v
   */
  public ComplexFunction padeApproximant(int M, int bits)
  {
    if (M < 0)
    {
      throw new IllegalArgumentException("Padé order M must be ≥ 0, got " + M);
    }

    // Order-zero diagonal Padé approximant. With y(0)=0 → a_0 = 0, the (0,0)
    // Padé approximant is P_0/Q_0 = 0/1, i.e. the identically-zero function.
    // Returning it explicitly here lets callers (notably the M=2 branch of
    // successiveDifferenceErrorBound, which needs R_{M-2}=R_0) compute the
    // bound at the smallest non-trivial order without losing a data point
    // by starting the adaptive loop at M=3.
    if (M == 0)
    {
      return ComplexFunction.express("0");
    }

    ComplexPolynomial[] PQ = padePolynomials(M, bits);
    return assemblePadeFunction(PQ[0], PQ[1]);
  }

  /**
   * Diagonal (M,M) Padé numerator and denominator polynomials
   * <code>{P_M, Q_M}</code> of
   * <code>g(z) = y(z^{1/μ}) = Σ a_k(v) zᵏ</code> at the current Context
   * <code>v</code>, returned as a length-two array <code>{P_M, Q_M}</code>.
   *
   * <p>
   * Same construction as {@link #padeApproximant(int,int)} but exposes the
   * polynomials themselves rather than the rational function
   * <code>R_M(z) = P_M(z)/Q_M(z)</code>. Useful for tests that verify the
   * defining algebraic property
   *
   * <pre>
   *   Q_M(z)·g_{2M}(z) - P_M(z) = O(z^{M+1}),
   * </pre>
   *
   * i.e. that the diagonal (M,M) Padé approximant matches the first
   * <code>2M+1</code> Taylor coefficients of <code>g(z)</code> exactly
   * (qrh.tex §3.1).
   * </p>
   *
   * @param M    diagonal Padé order
   * @param bits working precision
   * @return <code>{P_M, Q_M}</code>
   * @throws ArithmeticException if the Hankel system is singular at every
   *         order from M down to 1
   */
  public ComplexPolynomial[] padePolynomials(int M, int bits)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("padePolynomials requires M ≥ 1, got " + M);
    }

    // Stage 2.1 — evaluate the first 2M Müntz coefficients at the current v.
    Complex coeff = evaluateMuntzCoefficientsAtV(2 * M, bits);

    // Stage 2.2 — assemble Hankel system. Try order M; on singular fall back.
    int currentM = M;
    while (currentM >= 1)
    {
      ComplexPolynomial[] PQ = solveHankel(coeff, currentM, bits);
      if (PQ != null)
      {
        return PQ;
      }
      currentM--;
    }
    throw new ArithmeticException("All Padé orders ≤ "
                                  + M
                                  + " produced singular Hankel matrices at the current v");
  }

  /**
   * Evaluate the first <code>n</code> Müntz coefficients
   * <code>α_k = a_k(v)</code> at the current Context <code>v</code>.
   *
   * <p>
   * Returned as scalars <code>α_k ∈ ℂ</code> for <code>k = 1..n</code>.
   * Index 0 of the array holds <code>α_1</code>, since
   * <code>a_0 ≡ 0</code> by the initial condition <code>y(0)=0</code>.
   * Public so tests can inspect the truncated Müntz series
   * <code>g_n(z) = Σ_{k=1}^{n} α_k z^k</code> directly.
   * </p>
   */
  public Complex muntzCoefficientsAtV(int n, int bits)
  {
    return evaluateMuntzCoefficientsAtV(n, bits);
  }

  /**
   * Solve the fractional Riccati equation. Returns a callable
   * <code>y(t)</code> evaluable on <code>[0,∞)</code> at the working precision
   * specified by <code>bits</code>. The Fourier parameter <code>v</code> is a
   * Context variable: generated code reads it by reference. To change
   * <code>v</code>, the caller mutates the bound <code>Complex</code> and
   * re-evaluates — no recompilation.
   *
   * <p>
   * Internally uses the Müntz–Padé construction: <code>M</code> Müntz
   * coefficients drive a diagonal <code>(M,M)</code> Padé approximant
   * <code>R_M(z)</code> of <code>g(z) = y(z^{1/μ})</code>, and
   * <code>y(t)</code> is recovered as <code>t → R_M(t^μ)</code>.
   * </p>
   *
   * <p>
   * Truncation order <code>M</code> is chosen adaptively from the
   * successive-difference error bound, capped at <code>maxOrder</code>.
   * </p>
   *
   * @param maxOrder upper bound on the diagonal Padé order M
   * @param bits     working precision in bits
   */
  public ComplexFunction solve(int maxOrder, int bits)
  {
    if (maxOrder < 1)
    {
      throw new IllegalArgumentException("maxOrder must be ≥ 1, got " + maxOrder);
    }

    // Stage 4 — adaptive selection. Probe at z=1 (canonical), grow M until
    // successive-difference bound stops decreasing or maxOrder is reached.
    int M = chooseAdaptiveOrder(maxOrder, bits);

    // Stage 2 — Padé approximant at the current v.
    ComplexFunction R_M = padeApproximant(M, bits);

    // Stage 3 — compose with the Müntz substitution z = t^μ. The result is a
    // ComplexFunction in t. ℛ is registered as a function in a per-call
    // sub-context so the expression compiler can resolve ℛ(t^μ). The script
    // capital ℛ (U+211B) is used instead of plain R because R is reserved
    // for the built-in real-number type (Expression.BUILTIN_FUNCTION_NAMES).
    Context subCtx = newSubContext();
    subCtx.registerFunction("ℛ", R_M);
    return ComplexFunction.express("y", "t➔ℛ(t^μ)", subCtx);
  }

  /**
   * The a-posteriori successive-difference error bound (qrh.tex
   * eq:error_bound):
   *
   * <pre>
   *   |y(t) - y_M(t)| ≤ |Δ_M(z)|² / ( |Δ_{M-1}(z)| - |Δ_M(z)| ),    z = t^μ
   * </pre>
   *
   * where <code>Δ_k(z) = R_k(z) - R_{k-1}(z)</code>, evaluated at the current
   * Context <code>v</code>.
   *
   * @param M    Padé order at which the bound is evaluated
   * @param z    test point z = t^μ
   * @param bits working precision
   * @return ball containing the bound
   */
  public Real successiveDifferenceErrorBound(int M, Complex z, int bits)
  {
    if (M < 2)
    {
      throw new IllegalArgumentException("Successive-difference bound requires M ≥ 2, got " + M);
    }

    ComplexFunction R_M     = padeApproximant(M, bits);
    ComplexFunction R_Mm1   = padeApproximant(M - 1, bits);
    ComplexFunction R_Mm2   = padeApproximant(M - 2, bits);

    Complex         valM    = new Complex().setName("R_M(z)");
    Complex         valMm1  = new Complex().setName("R_{M-1}(z)");
    Complex         valMm2  = new Complex().setName("R_{M-2}(z)");

    R_M.evaluate(z, 1, bits, valM);
    R_Mm1.evaluate(z, 1, bits, valMm1);
    R_Mm2.evaluate(z, 1, bits, valMm2);

    // Δ_M = R_M - R_{M-1}, Δ_{M-1} = R_{M-1} - R_{M-2}
    Complex deltaM   = new Complex();
    Complex deltaMm1 = new Complex();
    valM.sub(valMm1, bits, deltaM);
    valMm1.sub(valMm2, bits, deltaMm1);

    Real    absM    = new Real();
    Real    absMm1  = new Real();
    deltaM.abs(bits, absM);
    deltaMm1.abs(bits, absMm1);

    Real    num     = new Real();
    absM.mul(absM, bits, num);

    Real    denom   = new Real();
    absMm1.sub(absM, bits, denom);

    Real    bound   = new Real();
    num.div(denom, bits, bound);
    return bound;
  }

  // ────────────────────────────────────────────────────────────────────────
  // Internals
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Evaluate the first {@code n} Müntz coefficients at the current Context v.
   * Returns scalars α_k = a_k(v) ∈ ℂ for k=1..n as a {@link Complex}
   * vector of length n; <code>get(k-1)</code> retrieves α_k since
   * <code>a_0</code> is identically zero by the initial condition.
   */
  private Complex evaluateMuntzCoefficientsAtV(int n, int bits)
  {
    Complex     out = Complex.newVector(n);
    arb.Integer idx = new arb.Integer();
    for (int k = 1; k <= n; k++)
    {
      idx.set(k);
      a.evaluate(idx, 1, bits, out.get(k - 1));
    }
    return out;
  }

  /**
   * Solve the Hankel system for the Padé denominator coefficients and
   * back-substitute the numerator. Returns {P_M, Q_M} on success, null if the
   * Hankel matrix is singular at the current precision.
   *
   * <p>
   * Hankel layout (qrh.tex eq:H_M_def):
   *
   * <pre>
   *   H_M[i][j] = α_{M+i-j},   i,j = 0..M-1
   *   b[i]      = α_{M+1+i},   i = 0..M-1
   *   H_M · q = -b
   *   p_0 = 0
   *   p_n = α_n + Σ_{j=1..min(n,M)} q_j · α_{n-j},   n = 1..M
   * </pre>
   *
   * </p>
   */
  private ComplexPolynomial[] solveHankel(Complex coeff, int M, int bits)
  {
    // α-vector indexed as α_k = coeff.get(k-1); we need α_1..α_{2M}.
    // Hankel uses α_{M+i-j} for i,j ∈ [0,M-1] → indices in [1, 2M-1].
    // RHS uses α_{M+1+i} for i ∈ [0,M-1] → indices in [M+1, 2M].
    if (coeff.dim < 2 * M)
    {
      throw new IllegalStateException("Need 2M=" + (2 * M) + " coefficients, have " + coeff.dim);
    }

    ComplexMatrix H     = ComplexMatrix.newMatrix(M, M);
    ComplexMatrix neg_b = ComplexMatrix.newMatrix(M, 1);

    for (int i = 0; i < M; i++)
    {
      for (int j = 0; j < M; j++)
      {
        // α_{M+i-j}, k = M+i-j, coeff.get(k-1)
        H.set(i, j, coeff.get(M + i - j - 1));
      }
      // -b[i] = -α_{M+1+i}, written in place into the matrix slot.
      coeff.get(M + i).neg(neg_b.get(i, 0));
    }

    ComplexMatrix qMat = ComplexMatrix.newMatrix(M, 1);
    int            ok   = arblib.acb_mat_solve(qMat, H, neg_b, bits);
    if (ok == 0)
    {
      return null; // singular at this precision — caller falls back to M-1
    }

    // Build Q_M(z) = 1 + q_1 z + q_2 z² + ... + q_M z^M.
    // fitLength must precede the per-coefficient set() calls so the
    // underlying acb_poly struct allocates its coefficient array; without
    // it acb_poly_set_coeff_acb → _acb_poly_normalise reads beyond the
    // allocation and crashes (SIGSEGV) when the JVM heap is in a non-
    // zeroed state — which happens reliably when this test runs after
    // unrelated tests in the same surefire fork. setLength alone only
    // updates the length field; fitLength performs the realloc.
    ComplexPolynomial Q_M = new ComplexPolynomial();
    Q_M.fitLength(M + 1);
    Q_M.setLength(M + 1);
    Q_M.get(0).one();
    for (int j = 1; j <= M; j++)
    {
      Q_M.set(j, qMat.get(j - 1, 0));
    }

    // Back-substitute: p_0 = 0; p_n = α_n + Σ_{j=1}^{min(n,M)} q_j α_{n-j}.
    // Scratch instances are allocated once outside both loops and reused
    // across iterations — in-place arithmetic, no per-iteration allocation.
    ComplexPolynomial P_M  = new ComplexPolynomial();
    P_M.fitLength(M + 1);
    P_M.setLength(M + 1);
    P_M.get(0).zero();
    Complex pn   = new Complex();
    Complex acc  = new Complex();
    Complex term = new Complex();
    for (int n = 1; n <= M; n++)
    {
      pn.set(coeff.get(n - 1)); // α_n
      acc.zero();
      for (int j = 1; j <= Math.min(n, M); j++)
      {
        // q_j · α_{n-j}, n-j ∈ [0, n-1]; α_0 = 0, so skip n-j=0.
        if (n - j == 0)
        {
          continue;
        }
        qMat.get(j - 1, 0).mul(coeff.get(n - j - 1), bits, term);
        acc.add(term, bits, acc);
      }
      pn.add(acc, bits, pn);
      P_M.set(n, pn);
    }

    return new ComplexPolynomial[] { P_M, Q_M };
  }

  /**
   * Assemble R_M(z) = P_M(z) / Q_M(z) as a callable ComplexFunction.
   * P_M and Q_M are registered in a per-call sub-context that inherits the
   * parent Context's variables (μ, v, and any user-defined parameters), then
   * the rational expression is compiled.
   */
  private ComplexFunction assemblePadeFunction(ComplexPolynomial P_M, ComplexPolynomial Q_M)
  {
    Context subCtx = newSubContext();
    subCtx.registerFunction("P", P_M.setName("P"));
    subCtx.registerFunction("Q", Q_M.setName("Q"));
    return ComplexFunction.express("ℛ", "z➔P(z)/Q(z)", subCtx);
  }

  /**
   * Adaptive Padé order selection. Probes the successive-difference bound at
   * z = 1 (canonical scale; the substitution z = t^μ maps t=1 to z=1) and
   * grows M until the bound stops shrinking by more than a factor of 10
   * between consecutive orders or maxOrder is reached.
   *
   * <p>
   * The bound requires M≥2; for maxOrder=1 the choice is forced.
   * </p>
   */
  private int chooseAdaptiveOrder(int maxOrder, int bits)
  {
    if (maxOrder <= 2)
    {
      return maxOrder;
    }
    Complex zProbe = new Complex();
    zProbe.set(1);

    Real prevBound = null;
    int  best      = 2;
    for (int M = 2; M <= maxOrder; M++)
    {
      Real currentBound;
      try
      {
        currentBound = successiveDifferenceErrorBound(M, zProbe, bits);
      }
      catch (ArithmeticException e)
      {
        // Hankel singularity at this M; keep the best so far.
        return best;
      }
      best = M;
      if (prevBound != null)
      {
        // Stop when the relative improvement falls below 10x — heuristic
        // matching the Padé convergence rate in qrh.tex §3.5.
        Real ratio     = new Real();
        currentBound.div(prevBound, bits, ratio);
        Real threshold = new Real().set("0.1", bits);
        if (ratio.compareTo(threshold) >= 0)
        {
          return M;
        }
      }
      prevBound = currentBound;
    }
    return maxOrder;
  }

  /**
   * Build a sub-context that inherits the parent Context's variables and
   * functions, used as a scratch namespace for per-call registrations
   * (P, Q polynomials in {@link #padeApproximant}, R in {@link #solve}).
   */
  private Context newSubContext()
  {
    Context sub = new Context();
    // Re-register every variable from the parent so the compiler resolves
    // μ, v, and any user-defined parameters when compiling z➔P(z)/Q(z) etc.
    if (context.variables != null)
    {
      context.variables.forEach((name, var) -> sub.variables.put(name, var));
    }
    return sub;
  }

  public ComplexFunction discriminant()
  {
    return ComplexFunction.express("discriminant", "v➔q(v)²-4*p(v)*r(v)", context);
  }

  /**
   * Drop the static-subexpression caches of every compiled function whose
   * body references the Fourier parameter v (the Context variable driving
   * the Müntz coefficients): p, q, r, S, a. Call this whenever v is
   * mutated in place between a(k) or downstream evaluations—otherwise
   * hoisted v-dependent subtrees retain their values from the previous v
   * and a(k) returns stale results.
   *
   * <p>The {@link arb.functions.Function#invalidateStaticCache()} default
   * is a no-op, so functions without hoisted state are unaffected.
   *
   * @see arb.functions.Function#invalidateStaticCache()
   * @see <a href="https://github.com/crowlogic/arb4j/issues/958">issue #958</a>
   */
  public void invalidateStaticCache()
  {
    Set<Function<?, ?>> alreadyInvalidated = Collections.newSetFromMap(new IdentityHashMap<>());
    if (p != null) p.invalidateStaticCache(alreadyInvalidated);
    if (q != null) q.invalidateStaticCache(alreadyInvalidated);
    if (r != null) r.invalidateStaticCache(alreadyInvalidated);
    var sMapping = context.<Integer, Complex, ComplexSequence>getFunctionMapping("S");
    if (sMapping != null && sMapping.instance != null)
    {
      sMapping.instance.invalidateStaticCache(alreadyInvalidated);
    }
    if (a != null) a.invalidateStaticCache(alreadyInvalidated);
  }

  @Override
  public void close()
  {
    if (ownsAlpha && α != null)
    {
      α.close();
    }
    αSeed.close();
  }

}
