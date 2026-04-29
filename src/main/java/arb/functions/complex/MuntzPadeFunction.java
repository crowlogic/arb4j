package arb.functions.complex;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexFunctionSequence;
import arb.solvers.HankelSystem;

/**
 * Müntz–Padé re-summation of a Puiseux power series in {t^{kμ}}_{k≥1} into a
 * globally convergent diagonal Padé approximant in z = t^μ, currying the
 * external parameter v through the Müntz coefficient sequence.
 *
 * <p>
 * The mathematical object is fully characterized by the pair (μ, k ↦ v ↦
 * a_k(v)): a fractional order μ ∈ (0,1), and a curried sequence of v-dependent
 * Müntz coefficients. The formal series at fixed v
 *
 * <pre>
 *   y(t; v) = Σ_{k≥1} a_k(v) · t^{kμ}
 * </pre>
 *
 * has finite z-radius determined by complex singularities of the underlying
 * dynamics at v, but the diagonal (M, M) Padé approximant
 *
 * <pre>
 *   R_M(z; v) = P_M(z; v) / Q_M(z; v),     z = t^μ,
 * </pre>
 *
 * built from the first 2M coefficients via a Hankel system, converges to the
 * meromorphic continuation under the de Montessus de Ballore and
 * Nuttall–Pommerenke theorems. Order M is selected as the smallest integer for
 * which the successive-difference bound
 *
 * <pre>
 *   |y(t; v) − R_M(t^μ; v)| ≤ |Δ_M(z)|² / (|Δ_{M-1}(z)| − |Δ_M(z)|)
 * </pre>
 *
 * falls below 2^(−bits), where Δ_k(z) = R_k(z; v) − R_{k-1}(z; v).
 *
 * <p>
 * As a {@link ComplexFunctional}, this object IS the curry v ↦ (t ↦ R_M(t; v)).
 * Calling {@link #evaluate(Complex, int, int, ComplexFunction)} at a Fourier
 * point v returns a fresh {@link MuntzPadeApproximantAtV} — a callable
 * {@link ComplexFunction} of t bound to the Padé pair (P_M, Q_M) computed at
 * that v. Subclasses (and direct callers) supply the curried coefficient
 * sequence; everything else — the Hankel solve, the order-selection loop, the
 * error bound — belongs to the re-summation itself and lives here.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeFunction implements
                               ComplexFunctional,
                               AutoCloseable
{

  private static final Logger          log  = LoggerFactory.getLogger(MuntzPadeFunction.class);

  /** Fractional order μ ∈ (0,1). */
  public final Real                    α;

  /** Curried Müntz coefficient sequence k ↦ v ↦ a_k(v). */
  public final ComplexFunctionSequence a;

  /** Optional name for typeset/print purposes. */
  protected String                     name;

  /**
   * Stable matrix backing the Padé denominator coefficients q_1..q_M during a
   * single {@link #solveHankel} call. Resized in place to the current M.
   */
  private final ComplexMatrix          qMat = new ComplexMatrix().setName("q");

  public MuntzPadeFunction(Real α, ComplexFunctionSequence a)
  {
    this.α = α;
    this.a = a;
  }

  public MuntzPadeFunction(String name, Real α, ComplexFunctionSequence a)
  {
    this(α,
         a);
    this.name = name;
  }

  // ────────────────────────────────────────────────────────────────────────
  // ComplexFunctional.evaluate — the curry v ↦ (t ↦ R_M(t; v))
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The functional output at v is a callable {@link ComplexFunction} t ↦ R_M(t;
   * v) = P_M(t^μ; v) / Q_M(t^μ; v) at the order M selected from bits at a
   * representative point z = (1)^μ. The {@code result} parameter is unused —
   * function references are immutable handles, so a fresh
   * {@link MuntzPadeApproximantAtV} is returned and the caller takes ownership.
   */
  @Override
  public ComplexFunction evaluate(Complex v, int order, int bits, ComplexFunction result)
  {
    int M;
    try ( Complex zRep = new Complex())
    {
      zRep.set(1, 0);
      M = chooseOrderForPrecision(v, zRep, bits);
    }
    DiagonalPade pade = new DiagonalPade(M);
    padePade(v, M, bits, pade);
    return new MuntzPadeApproximantAtV(α,
                                       pade);
  }

  // ────────────────────────────────────────────────────────────────────────
  // Public surface — order selection, polynomials, error bound (all v-input)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The curried Müntz coefficient sequence k ↦ v ↦ a_k(v).
   */
  public ComplexFunctionSequence coefficients()
  {
    return a;
  }

  /**
   * Evaluate the first n Müntz coefficients at v into the caller-allocated
   * vector; a_k(v) lands at index k−1.
   */
  public Complex coefficientsAt(Complex v, int n, int bits, Complex result)
  {
    if (result == null || result.dim < n)
    {
      throw new IllegalArgumentException("result vector must have dim ≥ " + n + ", got " + (result == null ? "null" : result.dim));
    }
    try ( Integer kIdx = new Integer())
    {
      for (int k = 1; k <= n; k++)
      {
        ComplexFunction ak = a.evaluate(kIdx.set(k), 1, bits, null);
        ak.evaluate(v, 1, bits, result.get(k - 1));
      }
    }
    return result;
  }

  /**
   * Smallest integer M for which the successive-difference bound at z falls below
   * 2^(−bits) for the Müntz reorganization at v. Stall-guarded: returns M−1 if
   * the bound fails to decrease between successive orders. Builds the (P,Q) cache
   * out to the chosen M as a side effect.
   */
  public int chooseOrderForPrecision(Complex v, Complex z, int bits)
  {
    List<DiagonalPade> padeCache   = new ArrayList<>();
    Complex            cachedAlpha = null;
    try
    {
      cachedAlpha = ensureOrder(v, padeCache, cachedAlpha, 2, bits);
      try ( Real bound = new Real(); Real prevBound = new Real(); Real threshold = new Real())
      {
        threshold.one();
        threshold.mul2e(-bits, threshold);

        int M = 2;
        successiveDifferenceErrorBound(v, padeCache, M, z, bits, bound);
        log.debug("chooseOrderForPrecision: M={} bound={} threshold=2^(-{})", M, bound, bits);
        while (bound.compareTo(threshold) > 0)
        {
          prevBound.set(bound);
          M++;
          cachedAlpha = ensureOrder(v, padeCache, cachedAlpha, M, bits);
          successiveDifferenceErrorBound(v, padeCache, M, z, bits, bound);
          log.debug("chooseOrderForPrecision: M={} bound={} prev={}", M, bound, prevBound);
          if (bound.compareTo(prevBound) >= 0)
          {
            log.debug("chooseOrderForPrecision: bound stalled at M={} (prev={}, curr={}); returning M-1={}", M, prevBound, bound, M - 1);
            disposeCache(padeCache);
            return M - 1;
          }
        }
        log.debug("chooseOrderForPrecision: chose M={} for bits={}", M, bits);
        disposeCache(padeCache);
        return M;
      }
    }
    finally
    {
      if (cachedAlpha != null)
      {
        cachedAlpha.close();
      }
    }
  }

  /**
   * Diagonal (M, M) Padé pair filled into the caller-supplied
   * {@link DiagonalPade} at the supplied v. Falls back to lower orders on Hankel
   * singularity.
   *
   * @return the result parameter (fluent)
   */
  public DiagonalPade padePade(Complex v, int M, int bits, DiagonalPade result)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("padePade requires M ≥ 1, got " + M);
    }
    if (result == null)
    {
      throw new IllegalArgumentException("result must be a preallocated DiagonalPade");
    }
    try ( Complex coeff = Complex.newVector(2 * M))
    {
      coefficientsAt(v, 2 * M, bits, coeff);
      int currentM = M;
      while (currentM >= 1)
      {
        solveHankel(v, coeff, currentM, bits, result);
        if (!result.isSingularSentinel())
        {
          return result;
        }
        currentM--;
      }
    }
    throw new ArithmeticException("All Padé orders ≤ " + M + " produced singular Hankel matrices at v=" + v);
  }

  /**
   * Diagonal (M, M) Padé numerator and denominator at v. result[0] = P_M(·; v),
   * result[1] = Q_M(·; v).
   */
  public ComplexPolynomial[] padePolynomials(Complex v, int M, int bits, ComplexPolynomial[] result)
  {
    if (result == null || result.length < 2 || result[0] == null || result[1] == null)
    {
      throw new IllegalArgumentException("result must be a length-2 array of preallocated ComplexPolynomial");
    }
    try ( DiagonalPade pade = new DiagonalPade(M))
    {
      padePade(v, M, bits, pade);
      result[0].set(pade.P);
      result[1].set(pade.Q);
    }
    return result;
  }

  /**
   * Diagonal (M, M) Padé approximant R_M(z; v) = P_M(z; v)/Q_M(z; v) as a
   * callable ComplexFunction of z (NOT t). M = 0 returns the identically-zero
   * function.
   */
  public ComplexFunction padeApproximant(Complex v, int M, int bits)
  {
    if (M < 0)
    {
      throw new IllegalArgumentException("Padé order M must be ≥ 0, got " + M);
    }
    if (M == 0)
    {
      return ComplexFunction.express("0");
    }
    DiagonalPade pade = new DiagonalPade(M);
    padePade(v, M, bits, pade);
    return pade;
  }

  /**
   * The a-posteriori successive-difference bound at z evaluated against the (P,Q)
   * cache built for the supplied v at the given precision.
   */
  public Real successiveDifferenceErrorBound(Complex v, List<DiagonalPade> padeCache, int M, Complex z, int bits, Real result)
  {
    if (M < 2)
    {
      throw new IllegalArgumentException("Successive-difference bound requires M ≥ 2, got " + M);
    }
    try ( var valM = Complex.named("R_M(z;v)"); var valMm1 = Complex.named("R_{M-1}(z;v)"); var valMm2 = Complex.named("R_{M-2}(z;v)"))
    {
      padeCache.get(M - 1).evaluate(z, 1, bits, valM);
      padeCache.get(M - 2).evaluate(z, 1, bits, valMm1);
      if (M - 2 == 0)
      {
        valMm2.zero();
      }
      else
      {
        padeCache.get(M - 3).evaluate(z, 1, bits, valMm2);
      }
      try ( var deltaM = new Complex(); var deltaMm1 = new Complex(); var absM = result.borrowVariable(); var absMm1 = result.borrowVariable();
            var num = result.borrowVariable(); var denom = result.borrowVariable();)
      {
        valM.sub(valMm1, bits, deltaM).abs(bits, absM).mul(absM, bits, num);
        valMm1.sub(valMm2, bits, deltaMm1).abs(bits, absMm1).sub(absM, bits, denom);
        return num.div(denom, bits, result);
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // Internals
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Grow the per-call (P,Q) cache out to order M at the supplied v. Returns the
   * (possibly resized) coefficient buffer holding a_1(v)..a_{2M}(v).
   */
  private Complex ensureOrder(Complex v, List<DiagonalPade> padeCache, Complex cachedAlpha, int M, int bits)
  {
    if (M < 1)
    {
      return cachedAlpha;
    }
    int currentTop = padeCache.size();
    if (currentTop >= M)
    {
      return cachedAlpha;
    }
    log.debug("ensureOrder: growing Padé cache from M={} to M={} at bits={}", currentTop, M, bits);

    if (cachedAlpha != null)
    {
      cachedAlpha.close();
    }
    Complex coeff = Complex.newVector(2 * M);
    coefficientsAt(v, 2 * M, bits, coeff);

    Context parentCtx = padeParentContext();
    for (int m = currentTop + 1; m <= M; m++)
    {
      DiagonalPade pade = new DiagonalPade(m);
      solveHankel(v, coeff, m, bits, pade);
      padeCache.add(pade);
    }
    return coeff;
  }

  private void disposeCache(List<DiagonalPade> padeCache)
  {
    for (DiagonalPade pade : padeCache)
    {
      pade.close();
    }
    padeCache.clear();
  }

  /**
   * Hook for subclasses to supply a Context whose variables are imported into
   * each cached {@link DiagonalPade}'s sub-Context, so user-facing variables
   * (e.g. μ in the Riccati–Mittag-Leffler setting) continue to resolve when the
   * rational function is evaluated. Default returns null (a fresh empty
   * sub-Context).
   */
  protected Context padeParentContext()
  {
    return null;
  }

  private DiagonalPade solveHankel(Complex v, Complex coeff, int M, int bits, DiagonalPade result)
  {
    if (coeff.dim < 2 * M)
    {
      throw new IllegalStateException("Need 2M=" + (2 * M) + " coefficients, have " + coeff.dim);
    }

    ComplexPolynomial P_M = result.P;
    ComplexPolynomial Q_M = result.Q;

    qMat.resize(M, 1);

    try ( HankelSystem hankel = new HankelSystem(coeff,
                                                 M);
          ComplexMatrix neg_b = ComplexMatrix.newMatrix(M, 1))
    {
      for (int i = 0; i < M; i++)
      {
        coeff.get(M + i).neg(neg_b.get(i, 0));
      }

      hankel.solve(neg_b, bits, qMat);
      if (hankel.wasSingular())
      {
        result.markSingular();
        return result;
      }

      Q_M.fitLength(M + 1);
      Q_M.setLength(M + 1);
      Q_M.get(0).one();
      for (int j = 1; j <= M; j++)
      {
        Q_M.set(j, qMat.get(j - 1, 0));
      }

      // P_M(z) = [A(z)·Q_M(z)]_{<M+1}, where A(z) = Σ_{k=1..2M} a_k(v)·z^{k-1}.
      // Polynomial multiplication folds the convolution
      // p_n = a_n(v) + Σ_{j=1..n-1} q_j·a_{n-j}(v), n = 1..M
      // in one call; the slice keeps only the first M+1 coefficients (with
      // p_0 = 0 since A has no z^{-1} term and the leading term of Q is 1).
      try ( ComplexPolynomial A = new ComplexPolynomial(); ComplexPolynomial AQ = new ComplexPolynomial())
      {
        A.fitLength(2 * M);
        A.setLength(2 * M);
        for (int k = 1; k <= 2 * M; k++)
        {
          A.get(k - 1).set(coeff.get(k - 1));
        }
        A.mul(Q_M, bits, AQ);
        P_M.fitLength(M + 1);
        P_M.setLength(M + 1);
        P_M.get(0).zero();
        for (int n = 1; n <= M; n++)
        {
          P_M.get(n).set(AQ.get(n - 1));
        }
      }
      return result;
    }
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    qMat.close();
  }
}
