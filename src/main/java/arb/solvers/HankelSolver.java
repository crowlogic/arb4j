package arb.solvers;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A square Hankel linear system of dimension M built from a coefficient
 * sequence c = (c_0, c_1, …, c_{2M-1}) by the rule
 *
 * <pre>
 *   H[i,j] = c[M + i − j − 1],   0 ≤ i, j < M.
 * </pre>
 *
 * <p>
 * The matrix H is constructed once at instantiation and held as the only native
 * allocation owned by this object. Repeated calls to
 * {@link #solve(ComplexMatrix, int, ComplexMatrix)} reuse the same H against
 * different right-hand sides.
 *
 * <p>
 * The class is reusable wherever a Hankel system arises:
 * <ul>
 * <li>diagonal Padé denominators from a Taylor-coefficient sequence,</li>
 * <li>Müntz–Padé denominators from a Müntz coefficient sequence,</li>
 * <li>moment problems (Stieltjes, Hamburger),</li>
 * <li>signal-subspace identification from sample autocorrelations.</li>
 * </ul>
 *
 * <p>
 * Singularity is reported as a post-solve sentinel via {@link #wasSingular()}
 * rather than thrown, so callers (e.g. an order- fallback loop) can react
 * without exception flow.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class HankelSolver implements
                                AutoCloseable
{
  /** Dimension of the square system. */
  public final int            M;

  private final ComplexMatrix H;

  /** True iff the most recent call to {@link #solve} encountered a singular H. */
  private boolean             singular = false;

  /**
   * Build the Hankel matrix from the first 2M entries of {@code coeff}.
   *
   * @param coeff coefficient vector of length ≥ 2M
   * @param M     dimension of the system
   * @throws IllegalArgumentException when {@code coeff.dim < 2M} or {@code M < 1}
   */
  public HankelSolver(Complex coeff, int M)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("Hankel dimension must be ≥ 1, got " + M);
    }
    if (coeff.dim < 2 * M)
    {
      throw new IllegalArgumentException("Need 2M=" + (2 * M) + " coefficients, have " + coeff.dim);
    }
    this.M = M;
    this.H = ComplexMatrix.newMatrix(M, M);
    for (int i = 0; i < M; i++)
    {
      for (int j = 0; j < M; j++)
      {
        H.set(i, j, coeff.get(M + i - j - 1));
      }
    }
  }

  /**
   * Solve H · x = negB into {@code x} at the given precision. The flag
   * {@link #wasSingular()} is updated. When singular the contents of x are
   * unspecified and the caller is expected to consult the flag.
   *
   * @param negB right-hand side (M × 1)
   * @param bits working precision
   * @param x    M × 1 result, returned for fluency
   * @return x (the last parameter)
   */
  public ComplexMatrix solve(ComplexMatrix negB, int bits, ComplexMatrix x)
  {
    int ok = arblib.acb_mat_solve(x, H, negB, bits);
    singular = (ok == 0);
    return x;
  }

  /**
   * @return true iff the most recent {@link #solve} call could not invert H at
   *         the requested precision.
   */
  public boolean wasSingular()
  {
    return singular;
  }

  /** Releases the native storage backing H. */
  @Override
  public void close()
  {
    H.close();
  }
}
