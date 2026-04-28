package arb.functions.complex;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;

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
  private final List<ComplexPolynomial[]> padeCache    = new ArrayList<>();
  private Complex                         cachedAlpha;
  private int                             cacheBits    = 0;
  private boolean                         cacheValid   = false;

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
   * Diagonal (M, M) Padé numerator and denominator. result[0] = P_M,
   * result[1] = Q_M. Falls back to lower orders on Hankel singularity.
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
      coefficientsAt(2 * M, bits, coeff);
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
    throw new ArithmeticException("All Padé orders ≤ " + M
                                  + " produced singular Hankel matrices at the current coefficients");
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
    ComplexPolynomial[] PQ = new ComplexPolynomial[]
    { new ComplexPolynomial(), new ComplexPolynomial() };
    padePolynomials(M, bits, PQ);
    return assemblePadeFunction(PQ[0], PQ[1]);
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

    for (int m = currentTop + 1; m <= M; m++)
    {
      ComplexPolynomial   P_m = new ComplexPolynomial();
      ComplexPolynomial   Q_m = new ComplexPolynomial();
      ComplexPolynomial[] PQ  = new ComplexPolynomial[]
      { P_m, Q_m };
      solveHankel(cachedAlpha, m, bits, PQ);
      padeCache.add(PQ);
    }
  }

  private void clearLocal()
  {
    padeCache.clear();
    cachedAlpha = null;
  }

  private void disposeLocal()
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

  private void evaluatePadeAtCachedOrder(int m, Complex z, int bits, Complex pz, Complex qz, Complex into)
  {
    ComplexPolynomial[] PQ = padeCache.get(m - 1);
    PQ[0].evaluate(z, 1, bits, pz);
    PQ[1].evaluate(z, 1, bits, qz);
    pz.div(qz, bits, into);
  }

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
   * Assemble R_M(z) = P_M(z)/Q_M(z) as a callable ComplexFunction. Subclasses
   * may override to register the polynomials in a richer Context (e.g. one
   * that inherits parametric variables); the default uses a fresh empty
   * Context.
   */
  protected ComplexFunction assemblePadeFunction(ComplexPolynomial P_M, ComplexPolynomial Q_M)
  {
    Context subCtx = new Context();
    subCtx.registerFunction("P", P_M.setName("P"));
    subCtx.registerFunction("Q", Q_M.setName("Q"));
    return ComplexFunction.express("ℛ", "z➔P(z)/Q(z)", subCtx);
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
