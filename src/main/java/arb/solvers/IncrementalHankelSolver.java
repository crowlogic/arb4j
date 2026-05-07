package arb.solvers;

import arb.Complex;
import arb.ComplexMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Incremental Hankel QR solver.
 *
 * <p>
 * Maintains a QR factorization of the growing Hankel system:
 *
 *   H_M x = b
 *
 * without reconstructing H_M for each M.
 *
 * <p>
 * The Hankel structure ensures each extension M → M+1 is rank-structured,
 * enabling O(M²) QR updates instead of O(M³) refactorization.
 *
 * <p>
 * No arrays, no doubles, no reallocation of coefficient vectors.
 */
public final class IncrementalHankelSolver implements AutoCloseable
{
  private int M = 0;

  // Stored coefficient stream reference (not copied)
  private final Complex coeff;

  // QR decomposition stored explicitly
  private ComplexMatrix Q;
  private ComplexMatrix R;

  private boolean initialized = false;
  private boolean singular = false;

  public IncrementalHankelSolver(Complex coeff)
  {
    this.coeff = coeff;
  }

  // ───────────────────────────────────────────────────────────────
  // Public API
  // ───────────────────────────────────────────────────────────────

  public int size()
  {
    return M;
  }

  public boolean wasSingular()
  {
    return singular;
  }

  /**
   * Solve at order M, growing factorization if needed.
   */
  public ComplexMatrix solve(int targetM, ComplexMatrix rhs, int bits, ComplexMatrix x)
  {
    if (targetM < 1)
    {
      throw new IllegalArgumentException("M must be ≥ 1");
    }

    ensureUpTo(targetM, bits);

    // Solve R x = Q* rhs (back-substitution)
    ComplexMatrix y = rhs.clone();
    Q.adjointMultiply(rhs, bits, y); // y = Q* b

    R.backSubstitute(y, bits, x);

    return x;
  }

  // ───────────────────────────────────────────────────────────────
  // Incremental construction
  // ───────────────────────────────────────────────────────────────

  private void ensureUpTo(int targetM, int bits)
  {
    if (!initialized)
    {
      initialize(bits);
    }

    while (M < targetM)
    {
      extend(bits);
    }
  }

  private void initialize(int bits)
  {
    M = 1;

    Q = ComplexMatrix.identity(1);
    R = ComplexMatrix.newMatrix(1, 1);

    // R(0,0) = c_{M-1}
    R.set(0, 0, coeff.get(0));

    initialized = true;
  }

  /**
   * Extend QR factorization from M → M+1.
   */
  private void extend(int bits)
  {
    int newM = M + 1;

    ComplexMatrix Rnew = ComplexMatrix.newMatrix(newM, newM);

    // ── copy old R ─────────────────────────────────────────────
    for (int i = 0; i < M; i++)
    {
      for (int j = 0; j < M; j++)
      {
        Rnew.set(i, j, R.get(i, j));
      }
    }

    // ── compute new Hankel row/column contributions ───────────
    // Hankel entry: H[i,j] = c[M + i - j - 1]

    // last column of H_{M+1}
    for (int i = 0; i < newM; i++)
    {
      Complex hij = coeff.get(M + i - newM);
      Rnew.set(i, M, hij);
    }

    // bottom row (only last element new diagonal)
    Complex diag = coeff.get(2 * M);
    Rnew.set(M, M, diag);

    // ── QR update step (conceptual Givens sweep) ──────────────
    // We orthogonalize the last column against existing Q

    Q.expandTo(newM);
    R = Rnew;

    applyGivensRotations(newM, bits);

    M = newM;

    if (R.get(M - 1, M - 1).isZero())
    {
      singular = true;
    }
  }

  /**
   * Apply structured QR stabilization (Givens rotations).
   *
   * NOTE: This is the only numerically heavy step and replaces full solve().
   */
  private void applyGivensRotations(int n, int bits)
  {
    for (int i = n - 1; i > 0; i--)
    {
      Complex a = R.get(i - 1, n - 1);
      Complex b = R.get(i,     n - 1);

      if (b.isZero())
      {
        continue;
      }

      Complex c = new Complex();
      Complex s = new Complex();

      ComplexMatrix.computeGivens(a, b, c, s, bits);

      // Apply rotation to R rows
      for (int j = 0; j < n; j++)
      {
        Complex rij  = R.get(i - 1, j);
        Complex rij1 = R.get(i, j);

        R.set(i - 1, j, c.mul(rij, bits).add(s.mul(rij1, bits), bits));
        R.set(i, j,     c.mul(rij1, bits).sub(s.mul(rij, bits), bits));
      }

      // Apply rotation to Q columns
      for (int j = 0; j < n; j++)
      {
        Complex qij  = Q.get(j, i - 1);
        Complex qij1 = Q.get(j, i);

        Q.set(j, i - 1, c.mul(qij, bits).add(s.mul(qij1, bits), bits));
        Q.set(j, i,     c.mul(qij1, bits).sub(s.mul(qij, bits), bits));
      }
    }
  }

  @Override
  public void close()
  {
    if (Q != null) Q.close();
    if (R != null) R.close();
  }
}