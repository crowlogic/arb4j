package arb.solvers;

import arb.Complex;
import arb.ComplexMatrix;
import arb.functions.integer.ComplexSequence;

/**
 * Incremental inverse Hankel solver.
 *
 * <p>
 * Maintains the inverse of the nested Hankel family
 *
 * <pre>
 *   H_M(i,j) = a_{i+j+1},   0 ≤ i,j < M
 * </pre>
 *
 * via Sherman–Morrison rank-1 bordered updates as M grows. For a given order M
 * the system solved is
 *
 * <pre>
 *   H_M · q = −b_M,   b_M(i) = a_{M+i+1},   0 ≤ i < M.
 * </pre>
 *
 * <p>
 * Per-step complexity is O(M²), matching the quadratic-complexity claim in the
 * accompanying convergence paper (Corollary 4.5).
 *
 * <h2>Design notes</h2>
 *
 * <ul>
 * <li><b>Fluent, allocation-free solve.</b> {@link #solve(int, ComplexMatrix)}
 * writes the result into a caller-owned matrix and returns that matrix for
 * chaining, in keeping with the arb4j convention that the last argument is the
 * return value.</li>
 *
 * <li><b>Pointer-swap growth.</b> {@link #growOnce(ComplexMatrix)} is fluent:
 * the caller hands in the destination matrix, the new bordered inverse is
 * assembled into it, and {@code inv.become(result)} swaps the underlying
 * native handle so the {@code inv} Java reference is preserved across all
 * growth steps. The previous handle ends up in the caller's matrix and is
 * reused as the destination on subsequent growth calls.</li>
 *
 * <li><b>Bordering extracted.</b> {@link #assembleBorderedInverse} contains
 * the four-block assembly (top-left rank-one update, two borders, bottom-right
 * corner) and is independent of growth bookkeeping.</li>
 *
 * <li><b>Interval-aware singularity handling.</b> A Schur complement that
 * contains zero may be genuinely zero (Hankel degeneracy) or merely
 * uncertified at the configured precision; the two are distinguished by
 * dedicated exception types so the caller can either skip M or rebuild at
 * higher precision.</li>
 *
 * <li><b>Bounded resource ownership.</b> {@link #close()} is idempotent and
 * releases all scratch state exactly once.</li>
 *
 * <li><b>No coefficient caching.</b> The {@link ComplexSequence} contract
 * already memoises evaluated terms; the solver simply calls
 * {@link ComplexSequence#apply(int)} wherever a coefficient is needed.</li>
 * </ul>
 */
public class IncrementalHankelSolver implements
                                     AutoCloseable
{

  /**
   * Raised when the Schur complement is certifiably non-zero only at higher
   * working precision than the solver was constructed with.
   */
  public static final class PrecisionExhaustedException extends
                                                        ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;
    public final int          precisionUsed;

    public PrecisionExhaustedException(int orderM, int precisionUsed)
    {
      super(String.format("Schur complement straddles zero at order M=%d with %d bits of working precision; "
                          + "rebuild the solver at higher precision",
                          orderM,
                          precisionUsed));
      this.orderM        = orderM;
      this.precisionUsed = precisionUsed;
    }
  }

  /**
   * Raised when the Schur complement is exactly zero at full precision,
   * indicating a genuine Hankel determinant degeneracy.
   */
  public static final class HankelDegeneracyException extends
                                                      ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;

    public HankelDegeneracyException(int orderM)
    {
      super(String.format("Hankel matrix singular at order M=%d (genuine degeneracy)", orderM));
      this.orderM = orderM;
    }
  }

  private final ComplexSequence a;
  private final int             prec;

  private int                   currentM = 0;
  private ComplexMatrix         inv;

  // Working vectors (M×1) — resized on demand, never allocated in the hot loop.
  private ComplexMatrix         uVec;
  private ComplexMatrix         vVec;

  // Right-hand side scratch (M×1) — resized on demand, reused across solves.
  private ComplexMatrix         rhsVec;

  // Scalar scratch — allocated once, reused across all growth steps.
  private final Complex         s        = new Complex();
  private final Complex         alpha    = new Complex();
  private final Complex         tmp      = new Complex();

  private boolean               closed   = false;

  public IncrementalHankelSolver(ComplexSequence a, int prec)
  {
    this.a    = a;
    this.prec = prec;
  }

  /**
   * Solve H_M · q = −b_M, writing the M×1 result into the caller-owned
   * {@code result} matrix and returning it for chaining.
   *
   * @throws PrecisionExhaustedException if the Schur complement cannot be
   *                                     certified non-zero at the configured
   *                                     working precision
   * @throws HankelDegeneracyException   if the Hankel matrix at some
   *                                     intermediate order is genuinely
   *                                     singular
   */
  public ComplexMatrix solve(int M, ComplexMatrix result)
  {
    checkOpen();
    if (M < 1)
    {
      throw new IllegalArgumentException("M must be ≥ 1, got " + M);
    }
    if (result.getNumRows() != M || result.getNumCols() != 1)
    {
      throw new IllegalArgumentException(String.format("result must be %d × 1, got %d × %d",
                                                       M,
                                                       result.getNumRows(),
                                                       result.getNumCols()));
    }
    growTo(M);
    return computeQ(M, result);
  }

  /**
   * Current order of the maintained inverse.
   */
  public int currentOrder()
  {
    return currentM;
  }

  /* ── incremental inverse maintenance ────────────────────────────────── */

  private void growTo(int M)
  {
    if (currentM == 0)
    {
      bootstrap();
    }
    // Single reusable destination matrix for the bordered inverse, sized to
    // the final target order. After each growOnce call its handle holds the
    // previous (smaller) inverse and is reused as the next destination; only
    // its leading (currentM+1)×(currentM+1) submatrix is written and read.
    ComplexMatrix dest = (currentM < M) ? ComplexMatrix.newMatrix(M, M) : null;
    try
    {
      while (currentM < M)
      {
        growOnce(dest);
      }
    }
    finally
    {
      if (dest != null)
      {
        dest.close();
      }
    }
  }

  private void bootstrap()
  {
    Complex h11 = a.apply(1);
    if (h11.contains(Complex.ZERO))
    {
      if (h11.isZero())
      {
        throw new HankelDegeneracyException(1);
      }
      throw new PrecisionExhaustedException(1, prec);
    }
    inv = ComplexMatrix.newMatrix(1, 1);
    tmp.one().div(h11, prec, inv.get(0, 0));
    currentM = 1;
  }

  private void ensureVecCapacity(int n)
  {
    if (uVec == null || uVec.getNumRows() < n)
    {
      if (uVec != null)
      {
        uVec.close();
      }
      if (vVec != null)
      {
        vVec.close();
      }
      uVec = ComplexMatrix.newMatrix(n, 1);
      vVec = ComplexMatrix.newMatrix(n, 1);
    }
  }

  private void ensureRhsCapacity(int n)
  {
    if (rhsVec == null || rhsVec.getNumRows() < n)
    {
      if (rhsVec != null)
      {
        rhsVec.close();
      }
      rhsVec = ComplexMatrix.newMatrix(n, 1);
    }
  }

  /**
   * Extend the maintained inverse from order {@code currentM} to
   * {@code currentM + 1} via a Sherman–Morrison rank-1 bordered update.
   *
   * <p>
   * Fluent style: the caller supplies the destination matrix, the new
   * bordered inverse is assembled into it, and {@code inv.become(result)}
   * swaps the underlying native handle so that the {@code inv} reference is
   * preserved.
   *
   * @param result destination matrix, sized at least (currentM+1)×(currentM+1).
   *               Its previous contents are overwritten and its handle is
   *               swapped with {@link #inv}.
   * @return {@code result} (now holding the previous inverse, ready for the
   *         next growth step).
   */
  private ComplexMatrix growOnce(ComplexMatrix result)
  {
    int oldM = currentM;
    int newM = oldM + 1;

    ensureVecCapacity(oldM);

    // u_i = a_{i + oldM + 1}
    for (int i = 0; i < oldM; i++)
    {
      uVec.get(i, 0).set(a.apply(i + oldM + 1));
    }

    // v = inv · u
    inv.mul(uVec, prec, vVec);

    // s = d − uᵀ·v, where d = a_{2·oldM + 1}
    s.set(a.apply(2 * oldM + 1));
    for (int i = 0; i < oldM; i++)
    {
      uVec.get(i, 0).mul(vVec.get(i, 0), prec, tmp);
      s.sub(tmp, prec, s);
    }

    // Distinguish certified zero (degeneracy) from uncertified zero (precision).
    if (s.contains(Complex.ZERO))
    {
      if (s.isZero())
      {
        throw new HankelDegeneracyException(newM);
      }
      throw new PrecisionExhaustedException(newM, prec);
    }

    // alpha = 1 / s
    alpha.one().div(s, prec, alpha);

    // Assemble the bordered inverse into `result`.
    assembleBorderedInverse(oldM, result);

    // Swap the new inverse into `inv` while preserving the Java reference.
    inv.become(result);
    currentM = newM;
    return result;
  }

  /**
   * Assemble the bordered inverse
   *
   * <pre>
   *   newInv = [ inv + α·v·vᵀ   −α·v ]
   *            [ −α·vᵀ           α   ]
   * </pre>
   *
   * into the {@code result} matrix, sized at least (oldM+1)×(oldM+1).
   * Reads {@link #inv}, {@link #vVec}, and {@link #alpha}; writes
   * {@code result}.
   *
   * @return {@code result} for chaining.
   */
  private ComplexMatrix assembleBorderedInverse(int oldM, ComplexMatrix result)
  {
    // Top-left block: inv + α · v · vᵀ
    for (int i = 0; i < oldM; i++)
    {
      Complex vi = vVec.get(i, 0);
      for (int j = 0; j < oldM; j++)
      {
        vi.mul(vVec.get(j, 0), prec, tmp);
        tmp.mul(alpha, prec, tmp);
        inv.get(i, j).add(tmp, prec, result.get(i, j));
      }
    }

    // Right border: −α · v
    for (int i = 0; i < oldM; i++)
    {
      vVec.get(i, 0).mul(alpha, prec, tmp);
      tmp.neg(result.get(i, oldM));
    }

    // Bottom border: −α · vᵀ (symmetric Hankel ⇒ identical to right border).
    for (int j = 0; j < oldM; j++)
    {
      vVec.get(j, 0).mul(alpha, prec, tmp);
      tmp.neg(result.get(oldM, j));
    }

    // Bottom-right corner: α
    result.get(oldM, oldM).set(alpha);

    return result;
  }

  /* ── RHS / solve ────────────────────────────────────────────────────── */

  private ComplexMatrix computeQ(int M, ComplexMatrix result)
  {
    ensureRhsCapacity(M);
    for (int i = 0; i < M; i++)
    {
      rhsVec.get(i, 0).set(a.apply(M + i + 1)).neg(rhsVec.get(i, 0));
    }
    inv.mul(rhsVec, prec, result);
    return result;
  }

  /* ── lifecycle ──────────────────────────────────────────────────────── */

  private void checkOpen()
  {
    if (closed)
    {
      throw new IllegalStateException("IncrementalHankelSolver is closed");
    }
  }

  @Override
  public void close()
  {
    if (closed)
    {
      return;
    }
    closed = true;

    if (inv != null)
    {
      inv.close();
      inv = null;
    }
    if (uVec != null)
    {
      uVec.close();
      uVec = null;
    }
    if (vVec != null)
    {
      vVec.close();
      vVec = null;
    }
    if (rhsVec != null)
    {
      rhsVec.close();
      rhsVec = null;
    }

    s.close();
    alpha.close();
    tmp.close();
  }
}
