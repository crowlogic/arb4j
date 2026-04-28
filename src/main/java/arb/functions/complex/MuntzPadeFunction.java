package arb.functions.complex;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import arb.solvers.HankelSystem;

/**
 * Müntz–Padé re-summation of a Puiseux power series in {t^{kμ}}_{k≥1} into a
 * globally convergent diagonal Padé approximant in z = t^μ.
 *
 * <p>
 * The mathematical object is fully characterized by the pair (μ, k ↦ a_k):
 * a fractional order μ ∈ (0,1), and a sequence of Müntz coefficients. The
 * formal series
 *
 * <pre>
 *   y(t) = Σ_{k≥1} a_k · t^{kμ}
 * </pre>
 *
 * has finite z-radius determined by complex singularities of the underlying
 * dynamics, but the diagonal (M, M) Padé approximant
 *
 * <pre>
 *   R_M(z) = P_M(z) / Q_M(z),     z = t^μ,
 * </pre>
 *
 * built from the first 2M coefficients via a Hankel system, converges to the
 * meromorphic continuation under the de Montessus de Ballore and
 * Nuttall–Pommerenke theorems. Order M is selected as the smallest integer
 * for which the successive-difference bound
 *
 * <pre>
 *   |y(t) − R_M(t^μ)| ≤ |Δ_M(z)|² / (|Δ_{M-1}(z)| − |Δ_M(z)|)
 * </pre>
 *
 * falls below 2^(−bits), where Δ_k(z) = R_k(z) − R_{k-1}(z).
 *
 * <p>
 * Subclasses (and direct callers) supply the coefficient sequence; everything
 * else — the Hankel solve, the order-selection loop, the error bound, and the
 * diagonal Padé evaluation — belongs to the re-summation itself and lives
 * here.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeFunction implements
                                ComplexFunction,
                                AutoCloseable
{

  private static final Logger log = LoggerFactory.getLogger(MuntzPadeFunction.class);

  /** Fractional order μ ∈ (0,1). */
  public final Real             α;

  /** Müntz coefficient sequence k ↦ a_k. */
  public final ComplexSequence  a;

  /** Optional name for typeset/print purposes. */
  protected String              name;

  // ── derived state, rebuilt on demand ─────────────────────────────────────
  private final List<DiagonalPade> padeCache    = new ArrayList<>();
  private Complex                  cachedAlpha;
  private int                      cacheBits    = 0;
  private boolean                  cacheValid   = false;

  public MuntzPadeFunction(Real α, ComplexSequence a)
  {
    this.α = α;
    this.a = a;
  }

  public MuntzPadeFunction(String name, Real α, ComplexSequence a)
  {
    this(α, a);
    this.name = name;
  }

  // ────────────────────────────────────────────────────────────────────────
  // ComplexFunction.evaluate
  // ────────────────────────────────────────────────────────────────────────

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    try ( Complex z = new Complex())
    {
      t.pow(α, bits, z);
      int M = chooseOrderForPrecision(z, bits);
      return padeCache.get(M - 1).evaluate(z, order, bits, result);
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  // Public surface — order selection, polynomials, error bound
  // ────────────────────────────────────────────────────────────────────────

  /**
   * The Müntz coefficient sequence k ↦ a_k.
   */
  public ComplexSequence coefficients()
  {
    return a;
  }

  /**
   * Evaluate the first n Müntz coefficients into the caller-allocated vector;
   * a_k lands at index k−1.
   */
  public Complex coefficientsAt(int n, int bits, Complex result)
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
   * Smallest integer M for which the successive-difference bound at z falls
   * below 2^(−bits). Stall-guarded: returns M−1 if the bound fails to
   * decrease between successive orders.
   */
  public int chooseOrderForPrecision(Complex z, int bits)
  {
    refreshIfStale(bits);
    ensureOrder(2, bits);
    try ( Real bound = new Real(); Real prevBound = new Real(); Real threshold = new Real())
    {
      threshold.one();
      threshold.mul2e(-bits, threshold);

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
        if (bound.compareTo(prevBound) >= 0)
        {
          log.debug("chooseOrderForPrecision: bound stalled at M={} (prev={}, curr={}); returning M-1={}",
                    M,
                    prevBound,
                    bound,
                    M - 1);
          return M - 1;
        }
      }
      log.debug("chooseOrderForPrecision: chose M={} for bits={}", M, bits);
      return M;
    }
  }

  /**
   * Canonical: diagonal (M, M) Padé pair filled into the caller-supplied
   * {@link DiagonalPade}. Falls back to lower orders on Hankel singularity.
   *
   * @return the result parameter (fluent)
   */
  public DiagonalPade padePade(int M, int bits, DiagonalPade result)
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
      coefficientsAt(2 * M, bits, coeff);
      int currentM = M;
      while (currentM >= 1)
      {
        solveHankel(coeff, currentM, bits, result);
        if (!result.isSingularSentinel())
        {
          return result.onCoefficientsChanged();
        }
        currentM--;
      }
    }
    throw new ArithmeticException("All Padé orders ≤ " + M
                                  + " produced singular Hankel matrices at the current coefficients");
  }

  /**
   * Backward-compatible: diagonal (M, M) Padé numerator and denominator.
   * result[0] = P_M, result[1] = Q_M. Falls back to lower orders on Hankel
   * singularity. Prefer {@link #padePade(int, int, DiagonalPade)}.
   */
  public ComplexPolynomial[] padePolynomials(int M, int bits, ComplexPolynomial[] result)
  {
    if (result == null || result.length < 2 || result[0] == null || result[1] == null)
    {
      throw new IllegalArgumentException("result must be a length-2 array of preallocated ComplexPolynomial");
    }
    try ( DiagonalPade pade = new DiagonalPade(M))
    {
      padePade(M, bits, pade);
      result[0].set(pade.P);
      result[1].set(pade.Q);
    }
    return result;
  }

  /**
   * Diagonal (M, M) Padé approximant R_M(z) = P_M(z)/Q_M(z) as a callable
   * ComplexFunction. M = 0 returns the identically-zero function.
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
    DiagonalPade pade = new DiagonalPade(M, padeParentContext());
    padePade(M, bits, pade);
    return pade.asFunction();
  }

  /**
   * The a-posteriori successive-difference bound at z evaluated against the
   * cache built for the given precision.
   */
  public Real successiveDifferenceErrorBound(int M, Complex z, int bits, Real result)
  {
    if (M < 2)
    {
      throw new IllegalArgumentException("Successive-difference bound requires M ≥ 2, got " + M);
    }
    ensureOrder(M, bits);
    try ( Complex valM   = Complex.named("R_M(z)");
          Complex valMm1 = Complex.named("R_{M-1}(z)");
          Complex valMm2 = Complex.named("R_{M-2}(z)");
          Complex pz     = new Complex();
          Complex qz     = new Complex())
    {
      evaluatePadeAtCachedOrder(M, z, bits, pz, qz, valM);
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

  // ────────────────────────────────────────────────────────────────────────
  // Cache lifecycle (subclass-overridable for upstream symbolic invalidation)
  // ────────────────────────────────────────────────────────────────────────

  /**
   * Hook for subclasses: return true if upstream parameters have changed
   * since the last cache build. Default returns false (the (μ, a) pair fully
   * characterizes the function and never changes after construction).
   */
  protected boolean isUpstreamStale()
  {
    return false;
  }

  /**
   * Hook for subclasses: invalidate any upstream symbolic caches before
   * rebuilding. Default is a no-op.
   */
  protected void invalidateUpstream()
  {
  }

  /**
   * Hook for subclasses: snapshot upstream state after a successful rebuild,
   * so the next isUpstreamStale() call has something to compare against.
   * Default is a no-op.
   */
  protected void snapshotUpstream()
  {
  }

  @Override
  public void invalidateCache()
  {
    invalidateUpstream();
    clearLocal();
    cacheValid = false;
    cacheBits  = 0;
  }

  // ────────────────────────────────────────────────────────────────────────
  // Internals
  // ────────────────────────────────────────────────────────────────────────

  private void refreshIfStale(int bits)
  {
    boolean upstreamChanged = !cacheValid || isUpstreamStale();
    boolean bitsTooSmall    = bits > cacheBits;
    if (upstreamChanged || bitsTooSmall)
    {
      if (upstreamChanged)
      {
        invalidateUpstream();
      }
      clearLocal();
      snapshotUpstream();
      cacheValid = true;
      cacheBits  = bits;
    }
  }

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

    if (cachedAlpha != null)
    {
      cachedAlpha.close();
    }
    cachedAlpha = Complex.newVector(2 * M);
    for (int k = 1; k <= 2 * M; k++)
    {
      a.evaluate(k, bits, cachedAlpha.get(k - 1));
    }

    Context parentCtx = padeParentContext();
    for (int m = currentTop + 1; m <= M; m++)
    {
      DiagonalPade pade = new DiagonalPade(m, parentCtx);
      solveHankel(cachedAlpha, m, bits, pade);
      padeCache.add(pade);
    }
  }

  private void clearLocal()
  {
    padeCache.clear();
    cachedAlpha = null;
  }

  private void disposeLocal()
  {
    for (DiagonalPade pade : padeCache)
    {
      pade.close();
    }
    padeCache.clear();
    if (cachedAlpha != null)
    {
      cachedAlpha.close();
      cachedAlpha = null;
    }
  }

  /**
   * Hook for subclasses to supply a Context whose variables are imported
   * into each cached {@link DiagonalPade}'s sub-Context, so user-facing
   * variables (e.g. v, μ in the Riccati–Mittag-Leffler setting) continue
   * to resolve when the rational function is evaluated. Default returns
   * null (a fresh empty sub-Context).
   */
  protected Context padeParentContext()
  {
    return null;
  }

  private void evaluatePadeAtCachedOrder(int m, Complex z, int bits, Complex pz, Complex qz, Complex into)
  {
    padeCache.get(m - 1).evaluate(z, 1, bits, into);
  }

  private DiagonalPade solveHankel(Complex coeff, int M, int bits, DiagonalPade result)
  {
    if (coeff.dim < 2 * M)
    {
      throw new IllegalStateException("Need 2M=" + (2 * M) + " coefficients, have " + coeff.dim);
    }

    ComplexPolynomial P_M = result.P;
    ComplexPolynomial Q_M = result.Q;

    try ( HankelSystem  hankel = new HankelSystem(coeff, M);
          ComplexMatrix neg_b  = ComplexMatrix.newMatrix(M, 1);
          ComplexMatrix qMat   = ComplexMatrix.newMatrix(M, 1))
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

      // P(z) = (z·A(z)·Q(z)) mod z^{M+1}, where A(z) = Σ_{k=0..M-1} a_{k+1}·z^k
      // is the truncation of the input Müntz series f(z) = z·A(z). The convolution
      // p_n = Σ_{j=0..n-1} q_j·a_{n-j} for n=1..M is exactly [z^{n-1}](A·Q), so
      // we form B(z) = A(z)·Q(z) and copy B[0..M-1] into P[1..M].
      P_M.fitLength(M + 1);
      P_M.setLength(M + 1);
      P_M.get(0).zero();
      try ( ComplexPolynomial A = new ComplexPolynomial(); ComplexPolynomial B = new ComplexPolynomial())
      {
        A.fitLength(M);
        A.setLength(M);
        for (int k = 0; k < M; k++)
        {
          A.get(k).set(coeff.get(k));
        }
        A.mul(Q_M, bits, B);
        for (int n = 1; n <= M; n++)
        {
          P_M.get(n).set(B.get(n - 1));
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
    disposeLocal();
  }
}
