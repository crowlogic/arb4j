package arb.functions.complex;

import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.ComplexSequence;

/**
 * The Riccati–Mittag-Leffler function
 *
 * <pre>
 *   Y_α(p, q, r; t) := unique analytic solution on a neighborhood of t = 0 of
 *
 *       Đᵅ y(t) = p(v) + q(v)·y(t) + r(v)·y(t)²,    y(0) = 0,    α = μ ∈ (0,1)
 * </pre>
 *
 * <p>
 * A three-parameter family of transcendental functions of t parametrized by a
 * fractional order α ∈ (0,1) and three analytic functions p(v), q(v), r(v) of
 * an external Fourier parameter v. The family generalizes the Mittag-Leffler
 * function E_α (recovered when r ≡ 0, q ≢ 0: Y_α(p, q, 0; t) = (p/q)·(E_α(q·tᵅ)
 * − 1)) and the pure power tᵅ (recovered when q ≡ 0, r ≡ 0: Y_α(p, 0, 0; t) =
 * p·tᵅ/Γ(α+1)). It is strictly larger than ₂F₁ — Gauss hypergeometric is a
 * linear ODE; this is genuinely nonlinear in y. At α = 1 the equation reduces
 * to the classical autonomous Riccati ODE whose solution is rational in tan or
 * tanh of √(q² − 4pr)·t/2 depending on the sign of the discriminant.
 * </p>
 *
 * <h2>Construction</h2>
 *
 * The Riccati–Mittag-Leffler function is constructed in two stages:
 *
 * <ol>
 * <li><b>Local stage (Müntz–Tau).</b> Form the Puiseux series y(t) = Σ a_k(v)·tᵏᵘ
 * from the algebraic recurrence
 *
 * <pre>
 *   a_1(v) = p(v) / Γ(μ+1)
 *   γ_k    = Γ((k-1)μ+1) / Γ(kμ+1)
 *   a_k(v) = γ_k · ( q(v)·a_{k-1}(v) + r(v)·Σ_{j=1}^{k-2} a_j(v)·a_{k-1-j}(v) ),  k≥2
 * </pre>
 *
 * The recurrence is one expression compiled once, not a Java loop with manual
 * arithmetic.</li>
 *
 * <li><b>Global stage (Padé reorganization).</b> Re-sum g(z) = y(z^{1/μ}) = Σ
 * a_k(v) zᵏ by diagonal R_M(z) = P_M(z)/Q_M(z) whose denominator coefficients
 * solve the Hankel system H_M·q = -b. Under de Montessus de Ballore /
 * Nuttall–Pommerenke, the diagonal sequence R_M(tᵘ) converges to y(t) for every
 * t ≥ 0 not at a pole abscissa, recovering global validity that the raw Müntz
 * series cannot provide.</li>
 * </ol>
 *
 * <h2>Order selection from precision</h2>
 *
 * The user does not specify a Padé order. They specify the working precision
 * <code>bits</code> on each {@link #evaluate(Complex, int, int, Complex)} call;
 * the order M is chosen as the smallest integer for which the
 * successive-difference bound at the evaluation point z = tᵘ falls below
 * 2^(−bits). The function maintains a cache of (M, P_M, Q_M) triples that
 * grows monotonically as larger orders are needed. When v changes, the entire
 * cache is invalidated. When bits increases beyond the precision at which the
 * cache was built, the cache is rebuilt at the new precision.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiccatiMittagLefflerFunction implements
                                          ComplexFunction,
                                          Initializable,
                                          AutoCloseable
{

  private static final Logger log = LoggerFactory.getLogger(RiccatiMittagLefflerFunction.class);

  /** Documentation-only string of the equation in standard form. */
  public static final String FRACTIONAL_RICCATI_EQUATION = "t➔Đ^(μ)y(t)=t➔p(v)+q(v)*y(t)+r(v)*y(t)²";

  /**
   * Fractional order μ ∈ (0,1), bound into the Context as the variable named
   * "μ". After {@link #initialize()} runs, {@code this.α} is the very same
   * {@link Real} instance that lives at name "μ" in the Context.
   */
  public Real                α;

  private boolean            ownsAlpha;
  private final Real         αSeed                  = new Real();

  /** Source expressions for p(v), q(v), r(v). */
  public String              constantTerm;
  public String              linearTerm;
  public String              quadraticTerm;

  /** Compiled p(v), q(v), r(v). */
  public ComplexFunction     p;
  public ComplexFunction     q;
  public ComplexFunction     r;

  /** Compiled Müntz coefficient sequence k ↦ a_k. */
  public ComplexSequence     a;

  /** The Fourier parameter v as a Complex Context variable. */
  public Complex             v;

  /** The Context holding all symbolic state. */
  public Context             context;

  /**
   * Cached (P_M, Q_M) triples in order of increasing M. Index in the list
   * corresponds to the cached Padé order: {@code padeCache.get(i)} holds
   * {P_{i+1}, Q_{i+1}} (since M starts at 1). Grown monotonically by
   * {@link #ensureOrder(int, int)}.
   */
  private List<ComplexPolynomial[]> padeCache = new ArrayList<>();

  /**
   * Cached evaluated Müntz coefficients α_1..α_{2M} at the current v, where M
   * is the highest cached Padé order. Grown alongside {@link #padeCache}.
   */
  private Complex            cachedAlpha;

  /** Snapshot of v's value at the time the cache was built. */
  private final Complex      cachedV                = new Complex();
  private boolean            cachedVValid           = false;

  /** Working precision at which the cache was built. */
  private int                cacheBits              = 0;

  // ────────────────────────────────────────────────────────────────────────
  // Constructors
  // ────────────────────────────────────────────────────────────────────────

  public RiccatiMittagLefflerFunction(Context context, Real α, String p, String q, String r)
  {
    this.context = context;
    this.αSeed.set(α);
    this.constantTerm  = p;
    this.linearTerm    = q;
    this.quadraticTerm = r;
    initialize();
  }

  public RiccatiMittagLefflerFunction(Real α, String p, String q, String r)
  {
    this(new Context(), α, p, q, r);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Symbolic initialization (Stage 1)
  // ────────────────────────────────────────────────────────────────────────

  @Override
  public void initialize()
  {
    // Bind μ. If the caller's Context already has μ, adopt it (seed value
    // poured in); otherwise register a fresh Real.
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

    // Bind v. If already present, reuse; otherwise register a fresh Complex.
    Complex existingV = context.getVariable("v");
    if (existingV == null)
    {
      v = context.registerVariable("v", new Complex().setName("v"));
    }
    else
    {
      v = existingV;
    }

    // Compile p(v), q(v), r(v).
    p = ComplexFunction.express("p", constantTerm, context);
    q = ComplexFunction.express("q", linearTerm, context);
    r = ComplexFunction.express("r", quadraticTerm, context);

    // Compile the Müntz recurrence as two mutually-recursive sequences.
    // S(k) = Σ_{j=1}^{k-2} a(j)·a(k-1-j) is split out so the expression
    // compiler doesn't recurse infinitely on the sum-with-recursion-inline
    // pattern. Both sequences resolve each other through Context lookups.
    context.registerFunctionMapping("a", Integer.class, Complex.class, ComplexSequence.class);

    String sExpr = "S:k➔sum(j➔a(j)*a(k-1-j){j=1..k-2})";
    arb.functions.integer.Sequence.parseCompileAndRegister("S", Complex.class, sExpr, ComplexSequence.class, context);

    String aExpr = "a:k➔when(k=1, p(v)/Γ(μ+1)," + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))" + "       *(q(v)*a(k-1)+r(v)*S(k)))";
    a = ComplexSequence.express(aExpr, context);
  }

  // ────────────────────────────────────────────────────────────────────────
  // ComplexFunction.evaluate — the entry point
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Evaluate y(t) at the requested precision. Order M is selected as the
   * smallest integer for which the successive-difference bound at z = tᵘ falls
   * below 2^(−bits). The Padé cache is grown as needed; if v has changed since
   * the cache was last built, the cache is invalidated and rebuilt; if bits
   * exceeds the precision the cache was built at, the cache is rebuilt at the
   * new precision.
   *
   * @param t      evaluation point on [0, ∞) (passed as Complex; for genuine
   *               complex t the same construction works on a star domain)
   * @param order  derivative order (currently only order = 1 is supported,
   *               i.e. value)
   * @param bits   working precision; drives Padé order selection
   * @param result caller-allocated; on return holds y(t)
   * @return the same {@code result}, populated
   */
  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    // z = t^μ
    try ( Complex z = new Complex())
    {
      t.pow(α, bits, z);

      // Find the smallest cached M whose successive-difference bound at z
      // falls below 2^(−bits); grow the cache until either we find such an M
      // or M starts diverging (which we do not cap — caller's machine is the
      // limit). chooseOrderForPrecision handles cache freshness internally.
      int M = chooseOrderForPrecision(z, bits);

      // Evaluate R_M(z) = P_M(z) / Q_M(z) into result.
      ComplexPolynomial[] PQ = padeCache.get(M - 1);
      try ( Complex pz = new Complex(); Complex qz = new Complex())
      {
        PQ[0].evaluate(z, order, bits, pz);
        PQ[1].evaluate(z, order, bits, qz);
        return pz.div(qz, bits, result);
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // Cache management
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Invalidate and rebuild the cache if v has changed since it was last built,
   * or if {@code bits} exceeds the precision the cache was built at.
   */
  private void refreshCacheIfStale(int bits)
  {
    boolean vChanged    = !cachedVValid || !cachedV.equals(v);
    boolean bitsTooSmall = bits > cacheBits;
    if (vChanged || bitsTooSmall)
    {
      // Compiled symbolic objects (p, q, r, S, a) hoist v-dependent
      // sub-expressions; drop those caches whenever v changes.
      if (vChanged)
      {
        invalidateSymbolicCaches();
      }
      disposeCache();
      cachedV.set(v);
      cachedVValid = true;
      cacheBits    = bits;
    }
  }

  /**
   * Grow the Padé cache until the successive-difference bound at z falls below
   * 2^(−bits), then return the chosen order M. Bound requires M ≥ 2; if the
   * cache has fewer than two entries, two are built first.
   *
   * <p>
   * Public so the order-vs-bits relationship can be tested directly without
   * triggering an evaluate, which depends on the entire pipeline being correct.
   * </p>
   *
   * @param z    test point z = tᵘ (or any complex point at which the bound is
   *             evaluated)
   * @param bits target accuracy: bound must fall below 2^(−bits)
   * @return the chosen Padé order M
   */
  public int chooseOrderForPrecision(Complex z, int bits)
  {
    refreshCacheIfStale(bits);
    ensureOrder(2, bits);
    try ( Real bound = new Real(); Real prevBound = new Real(); Real threshold = new Real())
    {
      threshold.one();
      threshold.mul2e(-bits, threshold); // 2^(−bits)

      int M = 2;
      successiveDifferenceErrorBound(M, z, bits, bound);
      log.debug("chooseOrderForPrecision: M={} bound={} threshold=2^(-{})", M, bound, bits);
      while (bound.compareTo(threshold) > 0)
      {
        prevBound.set(bound);
        M++;
        ensureOrder(M, bits);
        successiveDifferenceErrorBound(M, z, bits, bound);
        log.debug("chooseOrderForPrecision: M={} bound={} prev={}", M, bound, prevBound);
        // Convergence guard: if the bound does not strictly decrease
        // between successive orders, the diagonal Padé sequence is not
        // converging at this z and further growth is futile. Return the
        // last finite-improvement order.
        if (bound.compareTo(prevBound) >= 0)
        {
          log.debug("chooseOrderForPrecision: bound stalled at M={} (prev={}, curr={}); returning M-1={}",
                    M, prevBound, bound, M - 1);
          return M - 1;
        }
      }
      log.debug("chooseOrderForPrecision: chose M={} for bits={}", M, bits);
      return M;
    }
  }

  /**
   * Ensure the Padé cache contains entries for orders 1..M at the current
   * precision. Grows the α-vector and the cache list in lockstep.
   */
  private void ensureOrder(int M, int bits)
  {
    if (M < 1)
    {
      return;
    }
    int currentTop = padeCache.size();
    if (currentTop >= M)
    {
      return;
    }
    log.debug("ensureOrder: growing Padé cache from M={} to M={} at bits={}", currentTop, M, bits);

    // Grow the evaluated α-vector to length 2M. cachedAlpha may currently be
    // shorter; allocate fresh and re-evaluate from scratch (cheap relative to
    // Hankel solve).
    if (cachedAlpha != null)
    {
      cachedAlpha.close();
    }
    cachedAlpha = Complex.newVector(2 * M);
    for (int k = 1; k <= 2 * M; k++)
    {
      a.evaluate(k, bits, cachedAlpha.get(k - 1));
    }

    // Build (P_m, Q_m) for every m from currentTop+1 up to M.
    for (int m = currentTop + 1; m <= M; m++)
    {
      ComplexPolynomial P_m = new ComplexPolynomial();
      ComplexPolynomial Q_m = new ComplexPolynomial();
      ComplexPolynomial[] PQ = new ComplexPolynomial[]
      { P_m, Q_m };
      solveHankel(cachedAlpha, m, bits, PQ);
      padeCache.add(PQ);
    }
  }

  private void disposeCache()
  {
    for (ComplexPolynomial[] PQ : padeCache)
    {
      PQ[0].close();
      PQ[1].close();
    }
    padeCache.clear();
    if (cachedAlpha != null)
    {
      cachedAlpha.close();
      cachedAlpha = null;
    }
  }

  private void invalidateSymbolicCaches()
  {
    Set<Function<?, ?>> alreadyInvalidated = Collections.newSetFromMap(new IdentityHashMap<>());
    if (p != null)
      p.invalidateCache(alreadyInvalidated);
    if (q != null)
      q.invalidateCache(alreadyInvalidated);
    if (r != null)
      r.invalidateCache(alreadyInvalidated);
    var sMapping = context.<Integer, Complex, ComplexSequence>getFunctionMapping("S");
    if (sMapping != null && sMapping.instance != null)
    {
      sMapping.instance.invalidateCache(alreadyInvalidated);
    }
    if (a != null)
      a.invalidateCache(alreadyInvalidated);
  }

  /**
   * Drop every cached state so the next {@link #evaluate(Complex, int, int, Complex)}
   * call rebuilds from scratch: the symbolic static-hoist caches inside p, q, r,
   * S, a, plus the entire (M, P_M, Q_M) Padé cache and the cached α-vector.
   * Used by callers that mutate parameters (ρ, λ, ν, etc.) registered in this
   * function's Context between evaluation calls.
   */
  @Override
  public void invalidateCache()
  {
    invalidateSymbolicCaches();
    disposeCache();
    cachedVValid = false;
    cacheBits    = 0;
  }

  // ────────────────────────────────────────────────────────────────────────
  // Inspection methods (public, fluent shape)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The compiled Müntz coefficient sequence a_k.
   */
  public ComplexSequence muntzCoefficients()
  {
    return a;
  }

  /**
   * Evaluate the first n Müntz coefficients α_k = a_k(v) at the current v
   * into the caller-allocated Complex vector. α_k lands at index k-1.
   */
  public Complex muntzCoefficientsAtV(int n, int bits, Complex result)
  {
    if (result == null || result.dim < n)
    {
      throw new IllegalArgumentException("result vector must have dim ≥ " + n + ", got "
                                         + (result == null ? "null" : result.dim));
    }
    for (int k = 1; k <= n; k++)
    {
      a.evaluate(k, bits, result.get(k - 1));
    }
    return result;
  }

  /**
   * Diagonal (M, M) Padé numerator P_M and denominator Q_M of g(z) = y(z^{1/μ})
   * = Σ a_k(v) zᵏ at the current v. Caller passes a length-2 array of
   * preallocated polynomials; on return result[0] = P_M, result[1] = Q_M.
   * Falls back to lower orders on Hankel singularity. Throws on total failure.
   */
  public ComplexPolynomial[] padePolynomials(int M, int bits, ComplexPolynomial[] result)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("padePolynomials requires M ≥ 1, got " + M);
    }
    if (result == null || result.length < 2 || result[0] == null || result[1] == null)
    {
      throw new IllegalArgumentException("result must be a length-2 array of preallocated ComplexPolynomial");
    }

    try ( Complex coeff = Complex.newVector(2 * M))
    {
      muntzCoefficientsAtV(2 * M, bits, coeff);
      int currentM = M;
      while (currentM >= 1)
      {
        solveHankel(coeff, currentM, bits, result);
        if (result[0].get(0).isFinite())
        {
          return result;
        }
        currentM--;
      }
    }
    throw new ArithmeticException("All Padé orders ≤ " + M + " produced singular Hankel matrices at the current v");
  }

  /**
   * Diagonal (M, M) Padé approximant R_M(z) = P_M(z)/Q_M(z) at the current v
   * as a callable ComplexFunction. M = 0 returns the identically-zero function
   * (consistent with y(0) = 0 ⇒ a_0 = 0 ⇒ R_0 ≡ 0/1).
   */
  public ComplexFunction padeApproximant(int M, int bits)
  {
    if (M < 0)
    {
      throw new IllegalArgumentException("Padé order M must be ≥ 0, got " + M);
    }
    if (M == 0)
    {
      return ComplexFunction.express("0");
    }
    ComplexPolynomial[] PQ = new ComplexPolynomial[]
    { new ComplexPolynomial(), new ComplexPolynomial() };
    padePolynomials(M, bits, PQ);
    return assemblePadeFunction(PQ[0], PQ[1]);
  }

  /**
   * The a-posteriori successive-difference error bound:
   *
   * <pre>
   *   |y(t) - y_M(t)| ≤ |Δ_M(z)|² / ( |Δ_{M-1}(z)| - |Δ_M(z)| ),    z = tᵘ
   * </pre>
   *
   * where Δ_k(z) = R_k(z) - R_{k-1}(z), evaluated at the current v.
   */
  public Real successiveDifferenceErrorBound(int M, Complex z, int bits, Real result)
  {
    if (M < 2)
    {
      throw new IllegalArgumentException("Successive-difference bound requires M ≥ 2, got " + M);
    }
    ensureOrder(M, bits);

    // R_k(z) for k = M, M-1, M-2 from cache. R_0 ≡ 0 if M = 2.
    try ( Complex valM   = Complex.named("R_M(z)");
          Complex valMm1 = Complex.named("R_{M-1}(z)");
          Complex valMm2 = Complex.named("R_{M-2}(z)");
          Complex pz     = new Complex();
          Complex qz     = new Complex())
    {
      evaluatePadeAtCachedOrder(M,     z, bits, pz, qz, valM);
      evaluatePadeAtCachedOrder(M - 1, z, bits, pz, qz, valMm1);
      if (M - 2 == 0)
      {
        valMm2.zero();
      }
      else
      {
        evaluatePadeAtCachedOrder(M - 2, z, bits, pz, qz, valMm2);
      }

      try ( Complex deltaM   = new Complex();
            Complex deltaMm1 = new Complex();
            Real    absM     = new Real();
            Real    absMm1   = new Real();
            Real    num      = new Real();
            Real    denom    = new Real())
      {
        valM.sub(valMm1, bits, deltaM);
        valMm1.sub(valMm2, bits, deltaMm1);
        deltaM.abs(bits, absM);
        deltaMm1.abs(bits, absMm1);
        absM.mul(absM, bits, num);
        absMm1.sub(absM, bits, denom);
        return num.div(denom, bits, result);
      }
    }
  }

  /**
   * Discriminant q(v)² − 4·p(v)·r(v) as a callable ComplexFunction of v.
   */
  public ComplexFunction discriminant()
  {
    return ComplexFunction.express("discriminant", "v➔q(v)²-4*p(v)*r(v)", context);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Internals
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Evaluate the cached R_m(z) = P_m(z)/Q_m(z) into {@code into} using
   * caller-supplied scratch {@code pz, qz}.
   */
  private void evaluatePadeAtCachedOrder(int m, Complex z, int bits, Complex pz, Complex qz, Complex into)
  {
    ComplexPolynomial[] PQ = padeCache.get(m - 1);
    PQ[0].evaluate(z, 1, bits, pz);
    PQ[1].evaluate(z, 1, bits, qz);
    pz.div(qz, bits, into);
  }

  /**
   * Solve the Hankel system for the Padé denominator coefficients and
   * back-substitute the numerator. Writes P_M into result[0], Q_M into
   * result[1] and returns result. On Hankel singularity, writes the infinity
   * polynomial sentinel (a degree-0 polynomial whose only coefficient is +∞)
   * into both slots; caller detects via {@code result[0].get(0).isFinite()}.
   */
  private ComplexPolynomial[] solveHankel(Complex coeff, int M, int bits, ComplexPolynomial[] result)
  {
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
        H.set(i, j, coeff.get(M + i - j - 1));
      }
      coeff.get(M + i).neg(neg_b.get(i, 0));
    }

    ComplexMatrix     qMat = ComplexMatrix.newMatrix(M, 1);
    ComplexPolynomial P_M  = result[0];
    ComplexPolynomial Q_M  = result[1];

    int               ok   = arblib.acb_mat_solve(qMat, H, neg_b, bits);
    if (ok == 0)
    {
      P_M.fitLength(1);
      P_M.setLength(1);
      P_M.get(0).posInf();
      Q_M.fitLength(1);
      Q_M.setLength(1);
      Q_M.get(0).posInf();
      return result;
    }

    Q_M.fitLength(M + 1);
    Q_M.setLength(M + 1);
    Q_M.get(0).one();
    for (int j = 1; j <= M; j++)
    {
      Q_M.set(j, qMat.get(j - 1, 0));
    }

    P_M.fitLength(M + 1);
    P_M.setLength(M + 1);
    P_M.get(0).zero();
    try ( Complex pn = new Complex(); Complex acc = new Complex(); Complex term = new Complex())
    {
      for (int n = 1; n <= M; n++)
      {
        pn.set(coeff.get(n - 1));
        acc.zero();
        for (int j = 1; j <= Math.min(n, M); j++)
        {
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
    }
    return result;
  }

  /**
   * Assemble R_M(z) = P_M(z)/Q_M(z) as a callable ComplexFunction. P_M and Q_M
   * are registered in a per-call sub-context that inherits the parent
   * Context's variables.
   */
  private ComplexFunction assemblePadeFunction(ComplexPolynomial P_M, ComplexPolynomial Q_M)
  {
    Context subCtx = newSubContext();
    subCtx.registerFunction("P", P_M.setName("P"));
    subCtx.registerFunction("Q", Q_M.setName("Q"));
    return ComplexFunction.express("ℛ", "z➔P(z)/Q(z)", subCtx);
  }

  private Context newSubContext()
  {
    Context sub = new Context();
    if (context.variables != null)
    {
      context.variables.forEach((name, var) -> sub.variables.put(name, var));
    }
    return sub;
  }

  @Override
  public void close()
  {
    disposeCache();
    if (ownsAlpha && α != null)
    {
      α.close();
    }
    αSeed.close();
  }

}
