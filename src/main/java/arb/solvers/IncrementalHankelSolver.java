package arb.solvers;

import arb.*;
import arb.functions.integer.ComplexSequence;

/**
 * Incremental Hankel solver using Sherman–Morrison updates.
 *
 * A and B are fixed from construction. A is updated via rank-1 updates. A⁻¹ is
 * maintained explicitly. M controls truncation of output only.
 */
public class IncrementalHankelSolver implements
                                     AutoCloseable
{
  private final ComplexSequence A;
  private final ComplexSequence B;

  private final int             bits;

  public IncrementalHankelSolver(ComplexSequence A, ComplexSequence B, int bits)
  {
    this.A    = A;
    this.B    = B;
    this.bits = bits;

  }

  /**
   * Solve x = A⁻¹ B and return only first M entries.
   *
   * M is truncation order (not matrix size).
   */
  public ComplexMatrix solve(int M, Complex x)
  {
    ComplexMatrix full = ComplexMatrix.newMatrix(M, 1);

  //  Ainv.mul(B, bits, full);

    for (int i = 0; i < M; i++)
    {
      x.set(i, full.get(i, 0));
    }

    full.close();
    return x;
  }

  /**
   * Rank-1 update: A ← A + u vᵀ
   *
   * Sherman–Morrison: A⁻¹ ← A⁻¹ − (A⁻¹ u vᵀ A⁻¹) / (1 + vᵀ A⁻¹ u)
   */
  public void rank1Update(ComplexMatrix u, ComplexMatrix v)
  {
    int           n = A.getNumRows();

    ComplexMatrix p = ComplexMatrix.newMatrix(n, 1);
    Ainv.mul(u, bits, p);

    ComplexMatrix vt = ComplexMatrix.newMatrix(1, n);
    v.transpose(vt);

    ComplexMatrix qT = ComplexMatrix.newMatrix(1, n);
    vt.mul(Ainv, bits, qT);

    Complex denom = new Complex(1,
                                0);

    for (int i = 0; i < n; i++)
    {
      denom.add(v.get(0, i).mul(p.get(i, 0), bits, new Complex()), bits);
    }

    Complex scale = new Complex();
    ComplexConstants.one.div(denom, bits, scale);

    ComplexMatrix correction = ComplexMatrix.newMatrix(n, n);

    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < n; j++)
      {
        Complex term = p.get(i, 0).mul(qT.get(0, j), bits, new Complex()).mul(scale, bits, new Complex());

        correction.set(i, j, term);
      }
    }

    Ainv.sub(correction, bits, Ainv);

    p.close();
    vt.close();
    qT.close();
    correction.close();
  }

  @Override
  public void close()
  {
    Ainv.close();
  }
}