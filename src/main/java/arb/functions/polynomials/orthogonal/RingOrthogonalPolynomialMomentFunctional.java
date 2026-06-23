package arb.functions.polynomials.orthogonal;

import arb.GenericRing;
import arb.GenericRingPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Monic orthogonal polynomial sequence (OPS) of a quasi-definite moment
 * functional whose recurrence coefficients live in a single {@link GenericRing}
 * supplied at construction. The class is parameterized by a phantom element
 * type {@code <E>} that lets the Java compiler distinguish moment functionals
 * over different rings at the type level — instances over
 * {@code RingComplex} cannot be confused with instances over
 * {@code RingReal} or {@code RingComplexRationalFunction} even though the
 * underlying SWIG carrier is the same.
 *
 * <p>The ring is what specifies the algebra: pass
 * {@link GenericRing#complexBalls(int)} and α/β/h are complex ball values;
 * pass {@link GenericRing#realBalls(int)} and they are real; pass
 * {@code GenericRing.fractionFieldOf(GenericRing.polynomialsOver(...))} and
 * they are rational functions. The code below is identical across all three:
 * every operation is a {@code gr_poly_*} call against the supplied ring, and
 * the ring decides what arithmetic happens.</p>
 *
 * <h2>What this returns</h2>
 *
 * Given a moment sequence {@code m(k)} with each value a length-1
 * {@link GenericRingPolynomial} carrying one ring element, this class produces
 *
 * <pre>
 *   h(n) = ⟨P_n, P_n⟩
 *   α(n) = σ(n, n+1)/h(n) − σ(n−1, n)/h(n−1)      (Chebyshev–Wheeler form)
 *   β(n) = h(n)/h(n−1)                            β(0) := 0
 * </pre>
 *
 * and the monic OPS satisfies
 *
 * <pre>
 *   P(0)   = 1
 *   P(n+1) = (x − α(n))·P(n) − β(n)·P(n−1)
 * </pre>
 *
 * <h2>Recurrence and access</h2>
 *
 * The σ-table is built bottom-up by
 *
 * <pre>
 *   σ(0, k) := m(k)
 *   σ(j, k) := σ(j−1, k+1) − α(j−1)·σ(j−1, k) − β(j−1)·σ(j−2, k)    j ≥ 1
 * </pre>
 *
 * with {@code σ(−1, k) := 0}. Reads of α(n), β(n), h(n), σ(j, k) populate
 * every cell their definition requires, in dependency order, then return the
 * requested element. There is no separate population stage; the dependency
 * graph is the algorithm.
 *
 * @param <E> phantom element type — used only to distinguish OPS over
 *            different rings at compile time
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RingOrthogonalPolynomialMomentFunctional<E> implements
                                                       AutoCloseable
{

  /** Supplies one moment per index; values live in {@link #ring}. */
  public interface MomentSequence<E>
  {
    /**
     * Write {@code m(k)} into {@code result} as an element of the ring of the
     * surrounding {@link RingOrthogonalPolynomialMomentFunctional}. The
     * returned handle MUST be the same {@code result} object passed in (the
     * SWIG handle is reused; we never allocate on the caller's behalf).
     */
    GenericRingPolynomial evaluate(int k, GenericRingPolynomial result);
  }

  /** The ring in which every α(n), β(n), h(n), σ(j, k) is an element. */
  public final GenericRing       ring;

  /** Moments supplied by the caller; not owned by this instance. */
  public final MomentSequence<E> m;

  /** σ-table: {@code sigma[j][k]} is σ(j, k) when populated, else null. */
  private GenericRingPolynomial[][] sigma  = new GenericRingPolynomial[0][];

  /** h(n) = σ(n, n), one ring element per index. */
  private GenericRingPolynomial[]   h      = new GenericRingPolynomial[0];

  /** α(n), one ring element per index. */
  private GenericRingPolynomial[]   alpha  = new GenericRingPolynomial[0];

  /** β(n), one ring element per index; β(0) := 0. */
  private GenericRingPolynomial[]   beta   = new GenericRingPolynomial[0];

  /**
   * Allocate the OPS over the supplied ring. The phantom type parameter
   * {@code <E>} lets the caller annotate which kind of ring this is at
   * compile time; the runtime never inspects it.
   */
  public RingOrthogonalPolynomialMomentFunctional(GenericRing ring, MomentSequence<E> m)
  {
    if (ring == null) throw new IllegalArgumentException("ring must not be null");
    if (m    == null) throw new IllegalArgumentException("moment sequence must not be null");
    this.ring = ring;
    this.m    = m;
  }

  // ------------------------------------------------------------------
  // Public accessors — each populates exactly the cells its definition
  // requires, then returns. No notion of warm-up; the dependency graph
  // is the algorithm.
  // ------------------------------------------------------------------

  /** Recurrence coefficient α(n) ∈ {@link #ring}. */
  public GenericRingPolynomial alpha(int n)
  {
    ensureAlpha(n);
    return alpha[n];
  }

  /** Recurrence coefficient β(n) ∈ {@link #ring}; β(0) is the ring's zero. */
  public GenericRingPolynomial beta(int n)
  {
    ensureBeta(n);
    return beta[n];
  }

  /** Self-inner-product h(n) = σ(n, n). */
  public GenericRingPolynomial h(int n)
  {
    ensureH(n);
    return h[n];
  }

  /** σ(j, k) at any cell of the trapezoid. */
  public GenericRingPolynomial sigma(int j, int k)
  {
    ensureSigma(j, k);
    return sigma[j][k];
  }

  // ------------------------------------------------------------------
  // Cell builders. Each is idempotent — if the cell is populated, return.
  // ------------------------------------------------------------------

  private void ensureSigma(int j, int k)
  {
    growToCapacity(j + 1, k + 1);
    if (sigma[j][k] != null) return;
    sigma[j][k] = GenericRingPolynomial.in(ring);
    if (j == 0)
    {
      m.evaluate(k, sigma[0][k]);
      return;
    }
    // σ(j, k) = σ(j−1, k+1) − α(j−1)·σ(j−1, k) − β(j−1)·σ(j−2, k)
    GenericRingPolynomial sJm1Kp1 = pullSigma(j - 1, k + 1);
    GenericRingPolynomial sJm1K   = pullSigma(j - 1, k);
    GenericRingPolynomial aJm1    = pullAlpha(j - 1);
    GenericRingPolynomial t       = GenericRingPolynomial.in(ring);
    arblib.gr_poly_mul(t, aJm1, sJm1K, ring);
    arblib.gr_poly_sub(sigma[j][k], sJm1Kp1, t, ring);
    if (j >= 2)
    {
      GenericRingPolynomial bJm1  = pullBeta(j - 1);
      GenericRingPolynomial sJm2K = pullSigma(j - 2, k);
      arblib.gr_poly_mul(t, bJm1, sJm2K, ring);
      arblib.gr_poly_sub(sigma[j][k], sigma[j][k], t, ring);
    }
    arblib.gr_poly_clear(t, ring);
  }

  private void ensureH(int n)
  {
    growToCapacity(n + 1, n + 1);
    if (h[n] != null) return;
    h[n] = GenericRingPolynomial.in(ring);
    GenericRingPolynomial sNN = pullSigma(n, n);
    arblib.gr_poly_set(h[n], sNN, ring);
  }

  private void ensureAlpha(int n)
  {
    growToCapacity(n + 1, n + 2);
    if (alpha[n] != null) return;
    // α(n) = σ(n, n+1)/h(n) − σ(n−1, n)/h(n−1)         (n ≥ 1)
    // α(0) = σ(0, 1)/h(0)                              (n = 0)
    alpha[n] = GenericRingPolynomial.in(ring);
    GenericRingPolynomial sNNp1 = pullSigma(n, n + 1);
    GenericRingPolynomial hN    = pullH(n);
    arblib.gr_poly_div(alpha[n], sNNp1, hN, ring);
    if (n >= 1)
    {
      GenericRingPolynomial sNm1N = pullSigma(n - 1, n);
      GenericRingPolynomial hNm1  = pullH(n - 1);
      GenericRingPolynomial tmp   = GenericRingPolynomial.in(ring);
      arblib.gr_poly_div(tmp, sNm1N, hNm1, ring);
      arblib.gr_poly_sub(alpha[n], alpha[n], tmp, ring);
      arblib.gr_poly_clear(tmp, ring);
    }
  }

  private void ensureBeta(int n)
  {
    growToCapacity(n + 1, n + 1);
    if (beta[n] != null) return;
    beta[n] = GenericRingPolynomial.in(ring);
    if (n == 0)
    {
      arblib.gr_poly_zero(beta[0], ring);
      return;
    }
    GenericRingPolynomial hN   = pullH(n);
    GenericRingPolynomial hNm1 = pullH(n - 1);
    arblib.gr_poly_div(beta[n], hN, hNm1, ring);
  }

  // ------------------------------------------------------------------
  // Internal pulls — call the appropriate ensure*, then return the cell.
  // Distinct from the public accessors only in that they do not re-enter
  // grow logic (grow already happened in the outer ensure call).
  // ------------------------------------------------------------------

  private GenericRingPolynomial pullSigma(int j, int k) { ensureSigma(j, k); return sigma[j][k]; }
  private GenericRingPolynomial pullAlpha(int n)        { ensureAlpha(n);    return alpha[n];   }
  private GenericRingPolynomial pullBeta (int n)        { ensureBeta(n);     return beta[n];    }
  private GenericRingPolynomial pullH    (int n)        { ensureH(n);        return h[n];       }

  // ------------------------------------------------------------------
  // Storage growth
  // ------------------------------------------------------------------

  private void growToCapacity(int J, int K)
  {
    int curJ = sigma.length;
    int curK = curJ == 0 ? 0 : sigma[0].length;
    if (curJ >= J && curK >= K) return;
    int newJ = Math.max(curJ, J);
    int newK = Math.max(curK, K);
    GenericRingPolynomial[][] s2 = new GenericRingPolynomial[newJ][];
    for (int j = 0; j < newJ; j++)
    {
      s2[j] = new GenericRingPolynomial[newK];
      if (j < curJ)
        System.arraycopy(sigma[j], 0, s2[j], 0, sigma[j].length);
    }
    GenericRingPolynomial[] h2     = new GenericRingPolynomial[newJ];
    GenericRingPolynomial[] alpha2 = new GenericRingPolynomial[newJ];
    GenericRingPolynomial[] beta2  = new GenericRingPolynomial[newJ];
    System.arraycopy(h,     0, h2,     0, h.length);
    System.arraycopy(alpha, 0, alpha2, 0, alpha.length);
    System.arraycopy(beta,  0, beta2,  0, beta.length);
    sigma = s2; h = h2; alpha = alpha2; beta = beta2;
  }

  @Override
  public void close()
  {
    if (sigma != null)
    {
      for (GenericRingPolynomial[] row : sigma)
        if (row != null)
          for (GenericRingPolynomial cell : row)
            if (cell != null) arblib.gr_poly_clear(cell, ring);
    }
    if (h != null)
      for (GenericRingPolynomial p : h) if (p != null) arblib.gr_poly_clear(p, ring);
    if (alpha != null)
      for (GenericRingPolynomial p : alpha) if (p != null) arblib.gr_poly_clear(p, ring);
    if (beta != null)
      for (GenericRingPolynomial p : beta) if (p != null) arblib.gr_poly_clear(p, ring);
    sigma = null; h = null; alpha = null; beta = null;
  }
}
