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
 * <h2>Recurrence</h2>
 *
 * The σ-table is built bottom-up by
 *
 * <pre>
 *   σ(0, k) := m(k)
 *   σ(j, k) := σ(j−1, k+1) − α(j−1)·σ(j−1, k) − β(j−1)·σ(j−2, k)    j ≥ 1
 * </pre>
 *
 * with {@code σ(−1, k) := 0}. The k-reach of σ(j) is exactly {@code 2M − j}
 * when α/β/h are needed up to index M; the warmer in {@link #warmTo(int)}
 * fills the trapezoid in dependency order so every later read is a cache
 * hit.
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

  /** Triangular σ-table: {@code sigma[j][k]} is σ(j, k) when populated. */
  private GenericRingPolynomial[][] sigma;

  /** h(n) = σ(n, n), one ring element per index. */
  private GenericRingPolynomial[]   h;

  /** α(n), one ring element per index. */
  private GenericRingPolynomial[]   alpha;

  /** β(n), one ring element per index; β(0) := 0. */
  private GenericRingPolynomial[]   beta;

  /** Highest index for which α(M), β(M), h(M) are populated. */
  private int                       warmedTo = -1;

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

  /**
   * Ensure the σ-table and α/β/h arrays are populated up to index {@code M}.
   * Idempotent — calling with a smaller {@code M} is a no-op; calling with a
   * larger one extends in place.
   *
   * <p>The k-reach needed to compute α(M) and β(M) is {@code σ(M, M+1)},
   * which requires {@code σ(0, K)} for {@code K = 2M + 1}. The warmer
   * materialises every cell in dependency order so each subsequent read is
   * a cache hit.</p>
   */
  public void warmTo(int M)
  {
    if (M <= warmedTo) return;

    final int K = 2 * M + 2;
    final int J = M + 1;
    growToCapacity(J, K);

    // Row 0: moments from the supplier.
    for (int k = 0; k < K; k++)
    {
      if (sigma[0][k] == null)
      {
        sigma[0][k] = GenericRingPolynomial.in(ring);
        m.evaluate(k, sigma[0][k]);
      }
    }

    // Walk j from 1 upward.
    for (int j = 1; j <= J - 1; j++)
    {
      ensureRowCoefficients(j - 1);
      final int kMax = K - j - 1;
      for (int k = 0; k <= kMax; k++)
      {
        if (sigma[j][k] != null) continue;
        sigma[j][k] = GenericRingPolynomial.in(ring);
        GenericRingPolynomial t1 = GenericRingPolynomial.in(ring);
        arblib.gr_poly_mul(t1, alpha[j - 1], sigma[j - 1][k], ring);
        arblib.gr_poly_sub(sigma[j][k], sigma[j - 1][k + 1], t1, ring);
        if (j >= 2)
        {
          arblib.gr_poly_mul(t1, beta[j - 1], sigma[j - 2][k], ring);
          arblib.gr_poly_sub(sigma[j][k], sigma[j][k], t1, ring);
        }
      }
    }
    ensureRowCoefficients(M);
    warmedTo = M;
  }

  /**
   * Materialise h(n), α(n), β(n) at index {@code n} from the σ(n, *) row,
   * assuming σ(n, *) and all lower rows are already filled.
   */
  private void ensureRowCoefficients(int n)
  {
    if (h[n] == null)
    {
      h[n] = GenericRingPolynomial.in(ring);
      arblib.gr_poly_set(h[n], sigma[n][n], ring);
    }
    if (alpha[n] == null)
    {
      alpha[n] = GenericRingPolynomial.in(ring);
      arblib.gr_poly_div(alpha[n], sigma[n][n + 1], h[n], ring);
      if (n >= 1)
      {
        GenericRingPolynomial tmp = GenericRingPolynomial.in(ring);
        arblib.gr_poly_div(tmp, sigma[n - 1][n], h[n - 1], ring);
        arblib.gr_poly_sub(alpha[n], alpha[n], tmp, ring);
      }
    }
    if (beta[n] == null)
    {
      beta[n] = GenericRingPolynomial.in(ring);
      if (n == 0)
        arblib.gr_poly_zero(beta[0], ring);
      else
        arblib.gr_poly_div(beta[n], h[n], h[n - 1], ring);
    }
  }

  private void growToCapacity(int J, int K)
  {
    if (sigma == null)
    {
      sigma = new GenericRingPolynomial[J + 1][];
      for (int j = 0; j <= J; j++) sigma[j] = new GenericRingPolynomial[K];
      h     = new GenericRingPolynomial[J + 1];
      alpha = new GenericRingPolynomial[J + 1];
      beta  = new GenericRingPolynomial[J + 1];
      return;
    }
    if (sigma.length >= J + 1 && sigma[0].length >= K) return;

    int newJ = Math.max(sigma.length,    J + 1);
    int newK = Math.max(sigma[0].length, K);
    GenericRingPolynomial[][] s2 = new GenericRingPolynomial[newJ][];
    for (int j = 0; j < newJ; j++)
    {
      s2[j] = new GenericRingPolynomial[newK];
      if (j < sigma.length)
        System.arraycopy(sigma[j], 0, s2[j], 0, sigma[j].length);
    }
    GenericRingPolynomial[] h2     = new GenericRingPolynomial[newJ];
    GenericRingPolynomial[] alpha2 = new GenericRingPolynomial[newJ];
    GenericRingPolynomial[] beta2  = new GenericRingPolynomial[newJ];
    System.arraycopy(h,     0, h2,     0, h.length);
    System.arraycopy(alpha, 0, alpha2, 0, alpha.length);
    System.arraycopy(beta,  0, beta2,  0, beta.length);
    sigma = s2;
    h     = h2;
    alpha = alpha2;
    beta  = beta2;
  }

  /** Recurrence coefficient α(n). */
  public GenericRingPolynomial alpha(int n)
  {
    warmTo(n);
    return alpha[n];
  }

  /** Recurrence coefficient β(n); β(0) is the ring's zero. */
  public GenericRingPolynomial beta(int n)
  {
    warmTo(n);
    return beta[n];
  }

  /** Self-inner-product h(n) = σ(n, n). */
  public GenericRingPolynomial h(int n)
  {
    warmTo(n);
    return h[n];
  }

  /** σ(j, k) at any populated cell of the trapezoid. */
  public GenericRingPolynomial sigma(int j, int k)
  {
    warmTo(Math.max(j, k));
    return sigma[j][k];
  }

  @Override
  public void close()
  {
    sigma = null;
    h     = null;
    alpha = null;
    beta  = null;
  }
}
