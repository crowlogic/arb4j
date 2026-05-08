package arb.solvers;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexSequence;

public class IncrementalHankelSolver implements AutoCloseable {

  private final int           prec;
  private final ComplexSequence a;        // k ↦ a_k(v): Hankel entries
  private final ComplexSequence b;        // k ↦ b_k(v): RHS (neg‑coeff / q‑vec)

  private int         currentM = 0;       // 0 = no state
  private ComplexMatrix inv;              // A_n^{-1}
  private ComplexMatrix u;                // u = A^{-1} hankelB
  private ComplexMatrix v;                // v = A^{-T} hankelC
  private ComplexMatrix hankelB;          // new column of H
  private ComplexMatrix hankelC;          // new row    of H

  public IncrementalHankelSolver(ComplexSequence a, ComplexSequence b, int prec) {
    this.a   = a;
    this.b   = b;            // b is stored once at construction
    this.prec = prec;
  }

  // Bootstrap Hankel at order M0 from the sequence a.
  private void bootstrapFromSequence(int M0) {
    if (M0 < 1) {
      throw new IllegalArgumentException("M0 must be ≥ 1");
    }

    currentM = M0;

    if (inv == null || inv.getNumRows() != M0) {
      if (inv != null)  inv.close();
      if (u   != null)  u.close();
      if (v   != null)  v.close();
      if (hankelB != null) hankelB.close();
      if (hankelC != null) hankelC.close();

      inv = ComplexMatrix.newMatrix(M0, M0);
      u   = ComplexMatrix.newMatrix(M0, 1);
      v   = ComplexMatrix.newMatrix(1, M0);
      hankelB = ComplexMatrix.newMatrix(M0, 1);
      hankelC = ComplexMatrix.newMatrix(1, M0);
    }

    ComplexMatrix H = ComplexMatrix.newMatrix(M0, M0);
    for (int i = 0; i < M0; i++) {
      for (int j = 0; j < M0; j++) {
        H.set(i, j, a.get(M0 + i - j - 1));
      }
    }

    int ok = arblib.acb_mat_solve(inv, H, ComplexMatrix.identity(M0), prec);
    if (ok == 0) {
      throw new ArithmeticException("Hankel matrix is singular at order " + M0);
    }

    H.close();
  }

  public void growToOrder(int desiredM) {
    if (desiredM < 1) {
      throw new IllegalArgumentException("desiredM must be ≥ 1");
    }

    if (currentM == 0) {
      bootstrapFromSequence(1);
    }

    while (currentM < desiredM) {
      int n = currentM + 1;

      if (hankelB.getNumRows() != n || hankelB.getNumCols() != 1) hankelB.resize(n, 1);
      if (hankelC.getNumRows() != 1 || hankelC.getNumCols() != n) hankelC.resize(1, n);
      if (u.getNumRows() != n || u.getNumCols() != 1) u.resize(n, 1);
      if (v.getNumRows() != 1 || v.getNumCols() != n) v.resize(1, n);

      if (inv.getNumRows() != n) {
        ComplexMatrix newInv = ComplexMatrix.newMatrix(n, n);
        for (int i = 0; i < currentM; i++) {
          for (int j = 0; j < currentM; j++) {
            newInv.set(i, j, inv.get(i, j));
          }
        }
        inv.close();
        inv = newInv;
      }

      for (int i = 0; i < n; i++) {
        hankelB.set(i, 0, a.get(n + i));
        hankelC.set(0, i, a.get(n + i));
      }

      inv.mulVec(hankelB, u, prec);

      ComplexMatrix invT = ComplexMatrix.newMatrix(n, n);
      inv.transpose(invT);
      invT.mulTVec(hankelC, v, prec);
      invT.close();

      Complex d = a.get(2 * n);
      Complex s = Complex.newScalar();
      s.set(d);

      Complex cu = Complex.newScalar();
      hankelC.mulVec(u, cu, prec);
      s.sub(cu, prec, s);

      if (s.isZero()) {
        throw new ArithmeticException("Rank‑1 update denominator s = 0 at order n = " + n);
      }

      Complex alpha = Complex.newScalar();
      alpha.set(1);
      alpha.div(s, prec, alpha);

      ComplexMatrix uv = ComplexMatrix.newMatrix(n, n);
      u.outer(v, uv, 1, 1);
      uv.mul(alpha, prec, uv);
      inv.add(uv, 1, 1, prec, inv);
      uv.close();

      updateBorder(inv, n, alpha);

      currentM = n;
    }
  }

  private void updateBorder(ComplexMatrix A, int n, Complex alpha) {
    for (int i = 0; i < n; i++) {
      A.get(i, n).set(u.get(i, 0));
      A.get(i, n).mul(alpha, prec, A.get(i, n)).neg(A.get(i, n));
    }
    for (int j = 0; j < n; j++) {
      A.get(n, j).set(v.get(0, j));
      A.get(n, j).mul(alpha, prec, A.get(n, j)).neg(A.get(n, j));
    }
    A.get(n, n).set(alpha);
  }

  // ==========================================================
  // One and only solve: q = H⁻¹ b at order M
  // ==========================================================

  /**
   * Solve q = H⁻¹ b at order M, growing the Hankel if needed,
   * then returning the M×1 denominator coefficient vector q_1..q_M.
   *
   * b is fixed in the constructor; no RHS is passed here.
   */
  public ComplexMatrix solve(int M) {
    if (M < 1) {
      throw new IllegalArgumentException("M must be ≥ 1");
    }

    if (currentM < M) {
      growToOrder(M);
    }

    ComplexMatrix rhs = ComplexMatrix.newMatrix(M, 1);
    for (int i = 0; i < M; i++) {
      rhs.set(i, 0, b.get(i));
    }

    // invM is the leading M×M block of inv
    ComplexMatrix invM = ComplexMatrix.newMatrix(M, M);
    for (int i = 0; i < M; i++) {
      for (int j = 0; j < M; j++) {
        invM.set(i, j, inv.get(i, j));
      }
    }

    ComplexMatrix q = ComplexMatrix.newMatrix(M, 1);
    invM.mulVec(rhs, q, prec);

    invM.close();
    rhs.close();

    return q;
  }

  // ==========================================================
  // Close resources
  // ==========================================================

  @Override
  public void close() {
    if (inv     != null)  inv.close();
    if (u       != null)  u.close();
    if (v       != null)  v.close();
    if (hankelB != null) hankelB.close();
    if (hankelC != null) hankelC.close();
  }
}