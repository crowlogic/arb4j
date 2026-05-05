package arb.solvers;

import arb.Complex;
import arb.ComplexMatrix;
import junit.framework.TestCase;

/**
 * Tests for {@link HankelSolver}.
 *
 * <p>
 * The 2×2 Hankel system built from c = (c0, c1, c2, c3) with the standard
 * indexing rule
 *
 * <pre>
 *   H[i,j] = c[M + i − j − 1]    (M = 2)
 * </pre>
 *
 * is
 *
 * <pre>
 *   H = | c1  c0 |
 *       | c2  c1 |
 * </pre>
 *
 * with determinant det(H) = c1² − c0·c2. With c = (1, 2, 3, 4) det(H) = 1.
 * Solving H · x = (5, 6) gives x_1 = 4, x_2 = −3 (closed form: Cramer's rule).
 *
 * <p>
 * The singular case uses c = (1, 1, 1, 1) (det H = 0).
 *
 * @author Stephen Crowley ©2024-2026
 */
public class HankelSystemTest extends
                              TestCase
{
  private static final int BITS = 128;

  /**
   * c = (1, 2, 3, 4); H = [[2,1],[3,2]]; rhs = (5, 6); exact solution
   * x = (4, −3).
   */
  public void testNonSingularSolveExact()
  {
    try ( Complex coeff = Complex.newVector(4))
    {
      coeff.get(0).set(1);
      coeff.get(1).set(2);
      coeff.get(2).set(3);
      coeff.get(3).set(4);
      try ( HankelSolver  H   = new HankelSolver(coeff, 2);
            ComplexMatrix rhs = ComplexMatrix.newMatrix(2, 1);
            ComplexMatrix x   = ComplexMatrix.newMatrix(2, 1))
      {
        rhs.get(0, 0).set(5);
        rhs.get(1, 0).set(6);
        H.solve(rhs, BITS, x);
        assertFalse("non-singular case must not flag singular", H.wasSingular());
        assertEquals(4.0, x.get(0, 0).re().doubleValue(), 1e-30);
        assertEquals(0.0, x.get(0, 0).im().doubleValue(), 1e-30);
        assertEquals(-3.0, x.get(1, 0).re().doubleValue(), 1e-30);
        assertEquals(0.0, x.get(1, 0).im().doubleValue(), 1e-30);
      }
    }
  }

  /**
   * c = (1, 1, 1, 1); H = [[1,1],[1,1]] is singular; solver must flag it.
   */
  public void testSingularDetectedViaFlag()
  {
    try ( Complex coeff = Complex.newVector(4))
    {
      coeff.get(0).set(1);
      coeff.get(1).set(1);
      coeff.get(2).set(1);
      coeff.get(3).set(1);
      try ( HankelSolver  H   = new HankelSolver(coeff, 2);
            ComplexMatrix rhs = ComplexMatrix.newMatrix(2, 1);
            ComplexMatrix x   = ComplexMatrix.newMatrix(2, 1))
      {
        rhs.get(0, 0).set(1);
        rhs.get(1, 0).set(2);
        H.solve(rhs, BITS, x);
        assertTrue("singular Hankel must flag wasSingular()", H.wasSingular());
      }
    }
  }

  /**
   * Same matrix, two different right-hand sides — verifies that the
   * H allocation is reused across solve() calls.
   */
  public void testReuseAcrossRightHandSides()
  {
    try ( Complex coeff = Complex.newVector(4))
    {
      coeff.get(0).set(1);
      coeff.get(1).set(2);
      coeff.get(2).set(3);
      coeff.get(3).set(4);
      try ( HankelSolver  H    = new HankelSolver(coeff, 2);
            ComplexMatrix rhs1 = ComplexMatrix.newMatrix(2, 1);
            ComplexMatrix rhs2 = ComplexMatrix.newMatrix(2, 1);
            ComplexMatrix x1   = ComplexMatrix.newMatrix(2, 1);
            ComplexMatrix x2   = ComplexMatrix.newMatrix(2, 1))
      {
        rhs1.get(0, 0).set(5);
        rhs1.get(1, 0).set(6);
        H.solve(rhs1, BITS, x1);
        assertFalse(H.wasSingular());
        assertEquals(4.0, x1.get(0, 0).re().doubleValue(), 1e-30);
        assertEquals(-3.0, x1.get(1, 0).re().doubleValue(), 1e-30);

        // H · (1, 0)ᵀ = (2, 3)ᵀ → solving with rhs (2, 3) gives (1, 0).
        rhs2.get(0, 0).set(2);
        rhs2.get(1, 0).set(3);
        H.solve(rhs2, BITS, x2);
        assertFalse(H.wasSingular());
        assertEquals(1.0, x2.get(0, 0).re().doubleValue(), 1e-30);
        assertEquals(0.0, x2.get(1, 0).re().doubleValue(), 1e-30);
      }
    }
  }
}
