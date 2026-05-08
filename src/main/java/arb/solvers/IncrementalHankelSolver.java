package arb.solvers;

import arb.arblib;
import arb.Complex;
import arb.ComplexMatrix;
import arb.functions.integer.ComplexSequence;

public class IncrementalHankelSolver implements
                                     AutoCloseable
{

  private final int             prec;
  private final ComplexSequence a;            // k ↦ a_k(v): Hankel entries
  private final ComplexSequence b;            // k ↦ b_k(v): RHS (neg-coeff / q-vec)

  private int                   currentM = 0; // 0 = no state
  private ComplexMatrix         inv;          // H_m^{-1}, size m × m
  private ComplexMatrix         u;            // u = H^{-1} hankelB, size m × 1
  private ComplexMatrix         v;            // v = H^{-T} hankelC, size 1 × m
  private ComplexMatrix         hankelB;      // new column of H, size m × 1
  private ComplexMatrix         hankelC;      // new row of H, size 1 × m

  public IncrementalHankelSolver(ComplexSequence a, ComplexSequence b, int prec)
  {
    this.a    = a;
    this.b    = b;
    this.prec = prec;
  }

  private void bootstrapFromSequence(int M0)
  {
    if (M0 < 1)
    {
      throw new IllegalArgumentException("M0 must be ≥ 1");
    }

    currentM = M0;

    if (inv == null || inv.getNumRows() != M0)
    {
      if (inv != null)
        inv.close();
      if (u != null)
        u.close();
      if (v != null)
        v.close();
      if (hankelB != null)
        hankelB.close();
      if (hankelC != null)
        hankelC.close();

      inv     = ComplexMatrix.newMatrix(M0, M0);
      u       = ComplexMatrix.newMatrix(M0, 1);
      v       = ComplexMatrix.newMatrix(1, M0);
      hankelB = ComplexMatrix.newMatrix(M0, 1);
      hankelC = ComplexMatrix.newMatrix(1, M0);
    }

    ComplexMatrix H = ComplexMatrix.newMatrix(M0, M0);
    for (int i = 0; i < M0; i++)
    {
      for (int j = 0; j < M0; j++)
      {
        H.set(i, j, a.apply(i + j + 1));
      }
    }

    int ok = arblib.acb_mat_solve(inv, H, ComplexMatrix.newMatrix(M0,M0).identity(), prec);
    if (ok == 0)
    {
      throw new ArithmeticException("Hankel matrix is singular at order " + M0);
    }

    H.close();
  }

  public void growToOrder(int desiredM)
  {
    if (desiredM < 1)
    {
      throw new IllegalArgumentException("desiredM must be ≥ 1");
    }

    if (currentM == 0)
    {
      bootstrapFromSequence(1);
    }

    while (currentM < desiredM)
    {
      int oldM = currentM;
      int newM = oldM + 1;

      if (hankelB.getNumRows() != oldM || hankelB.getNumCols() != 1)
        hankelB.resize(oldM, 1);
      if (hankelC.getNumRows() != 1 || hankelC.getNumCols() != oldM)
        hankelC.resize(1, oldM);
      if (u.getNumRows() != oldM || u.getNumCols() != 1)
        u.resize(oldM, 1);
      if (v.getNumRows() != 1 || v.getNumCols() != oldM)
        v.resize(1, oldM);

      if (inv.getNumRows() != newM)
      {
        ComplexMatrix newInv = ComplexMatrix.newMatrix(newM, newM);
        for (int i = 0; i < oldM; i++)
        {
          for (int j = 0; j < oldM; j++)
          {
            newInv.set(i, j, inv.get(i, j));
          }
        }
        inv.close();
        inv = newInv;
      }

      for (int i = 0; i < oldM; i++)
      {
        hankelB.set(i, 0, a.apply(i + oldM + 1));
        hankelC.set(0, i, a.apply(i + oldM + 1));
      }

      inv.mulVec(hankelB, u, prec);

      ComplexMatrix invT = ComplexMatrix.newMatrix(oldM, oldM);
      inv.transpose(invT);
      invT.mulTVec(hankelC, v, prec);
      invT.close();

      Complex d = a.get(2 * oldM + 1);
      Complex s = Complex.newScalar();
      s.set(d);

      Complex cu = Complex.newScalar();
      hankelC.mulVec(u, cu, prec);
      s.sub(cu, prec, s);

      if (s.isZero())
      {
        throw new ArithmeticException("Rank-1 update denominator s = 0 at order newM = " + newM);
      }

      Complex alpha = Complex.newScalar();
      alpha.set(1);
      alpha.div(s, prec, alpha);

      ComplexMatrix uv = ComplexMatrix.newMatrix(newM, newM);
      u.outer(v, uv, 1, 1);
      uv.mul(alpha, prec, uv);
      inv.add(uv, 1, 1, prec, inv);
      uv.close();

      updateBorder(inv, oldM, alpha);

      currentM = newM;
    }
  }

  private void updateBorder(ComplexMatrix A, int oldM, Complex alpha)
  {
    for (int i = 0; i < oldM; i++)
    {
      A.get(i, oldM).set(u.get(i, 0));
      A.get(i, oldM).mul(alpha, prec, A.get(i, oldM)).neg(A.get(i, oldM));
    }
    for (int j = 0; j < oldM; j++)
    {
      A.get(oldM, j).set(v.get(0, j));
      A.get(oldM, j).mul(alpha, prec, A.get(oldM, j)).neg(A.get(oldM, j));
    }
    A.get(oldM, oldM).set(alpha);
  }

  public ComplexMatrix solve(int M)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("M must be ≥ 1");
    }

    if (currentM < M)
    {
      growToOrder(M);
    }

    ComplexMatrix rhs = ComplexMatrix.newMatrix(M, 1);
    for (int i = 0; i < M; i++)
    {
      rhs.set(i, 0, b.apply(i));
    }

    ComplexMatrix invM = ComplexMatrix.newMatrix(M, M);
    for (int i = 0; i < M; i++)
    {
      for (int j = 0; j < M; j++)
      {
        invM.set(i, j, inv.get(i, j));
      }
    }

    ComplexMatrix q = ComplexMatrix.newMatrix(M, 1);
    invM.mulVec(rhs, q, prec);

    invM.close();
    rhs.close();

    return q;
  }

  @Override
  public void close()
  {
    if (inv != null)
      inv.close();
    if (u != null)
      u.close();
    if (v != null)
      v.close();
    if (hankelB != null)
      hankelB.close();
    if (hankelC != null)
      hankelC.close();
  }
}