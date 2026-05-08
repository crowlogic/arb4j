package arb;

public class InverseHankelSolver {

  private final int prec;

  private ComplexMatrix inv;     // A_n^{-1}
  private ComplexMatrix u;       // column vector
  private ComplexMatrix v;       // row vector
  private ComplexMatrix b;       // new column
  private ComplexMatrix c;       // new row

  public InverseHankelSolver(int initialSize, int prec) {
    this.prec = prec;

    inv = ComplexMatrix.newMatrix(initialSize, initialSize);
    u   = ComplexMatrix.newMatrix(initialSize, 1);
    v   = ComplexMatrix.newMatrix(1, initialSize);
    b   = ComplexMatrix.newMatrix(initialSize, 1);
    c   = ComplexMatrix.newMatrix(initialSize, 1);
  }

  // ----------------------------
  // bootstrap ONLY place where solve is allowed
  // ----------------------------
  public void initialize(ComplexMatrix A0, ComplexMatrix A0inv) {
    inv.set(A0inv);
  }

  // ----------------------------
  // Hankel vector builder
  // ----------------------------
  private void buildVector(ComplexMatrix out, HankelSequence seq, int offset) {
    for (int i = 0; i < out.getNumRows(); i++) {
      out.set(i, 0, seq.get(i + offset));
    }
  }

  // ----------------------------
  // main incremental step
  // ----------------------------
  public void extend(HankelSequence seq, int n) {

    // resize buffers if needed
    if (b.getNumRows() != n) {
      b.resize(n, 1);
      c.resize(n, 1);
      u.resize(n, 1);
      v.resize(1, n);
    }

    buildVector(b, seq, n);
    buildVector(c, seq, n);

    // --------------------------------------------------
    // u = A^{-1} b   (matrix-vector multiply, NOT solve)
    // --------------------------------------------------
    matVec(inv, b, u);

    // --------------------------------------------------
    // v = A^{-T} c   (transpose matvec, NOT solve)
    // --------------------------------------------------
    ComplexMatrix invT = ComplexMatrix.newMatrix(n, n);
    inv.transpose(invT);
    matVec(invT, c, v);
    invT.close();

    // --------------------------------------------------
    // Schur complement s = d - c^T u
    // --------------------------------------------------
    Complex d = seq.get(2 * n);
    Complex s = Complex.newScalar();
    s.set(d);

    Complex cu = dot(c, u);
    s.sub(cu, prec, s);

    Complex invS = Complex.newScalar();
    invS.set(1);
    invS.div(s, prec, invS);

    // --------------------------------------------------
    // rank-1 update: inv += (u v^T)/s
    // --------------------------------------------------
    rank1Update(inv, u, v, invS, n);

    // --------------------------------------------------
    // border updates
    // --------------------------------------------------
    updateBorder(inv, u, v, invS, n);
  }

  // ----------------------------
  // matrix-vector multiply
  // ----------------------------
  private void matVec(ComplexMatrix A, ComplexMatrix x, ComplexMatrix y) {
    int n = A.getNumRows();

    for (int i = 0; i < n; i++) {
      Complex sum = Complex.newScalar();
      sum.set(0);

      for (int j = 0; j < n; j++) {
        Complex aij = A.get(i, j);
        Complex xj  = x.get(j, 0);

        Complex tmp = Complex.newScalar();
        tmp.set(aij);
        tmp.mul(xj, prec, tmp);

        sum.add(tmp, prec, sum);
      }

      y.set(i, 0, sum);
    }
  }

  // ----------------------------
  // dot product
  // ----------------------------
  private Complex dot(ComplexMatrix a, ComplexMatrix b) {
    Complex s = Complex.newScalar();
    s.set(0);

    for (int i = 0; i < a.getNumRows(); i++) {
      Complex tmp = Complex.newScalar();
      tmp.set(a.get(i, 0));
      tmp.mul(b.get(i, 0), prec, tmp);
      s.add(tmp, prec, s);
    }

    return s;
  }

  // ----------------------------
  // rank-1 update: A += u v^T * alpha
  // ----------------------------
  private void rank1Update(ComplexMatrix A,
                            ComplexMatrix u,
                            ComplexMatrix v,
                            Complex alpha,
                            int n) {

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {

        Complex uv = Complex.newScalar();
        uv.set(u.get(i, 0));
        uv.mul(v.get(0, j), prec, uv);
        uv.mul(alpha, prec, uv);

        Complex aij = A.get(i, j);
        aij.add(uv, prec, aij);

        A.set(i, j, aij);
      }
    }
  }

  // ----------------------------
  // last row/column extension
  // ----------------------------
  private void updateBorder(ComplexMatrix A,
                            ComplexMatrix u,
                            ComplexMatrix v,
                            Complex invS,
                            int n) {

    // last column
    for (int i = 0; i < n; i++) {
      Complex val = u.get(i, 0);
      val.mul(invS, prec, val);
      val.neg(val);
      A.set(i, n, val);
    }

    // last row
    for (int j = 0; j < n; j++) {
      Complex val = v.get(0, j);
      val.mul(invS, prec, val);
      val.neg(val);
      A.set(n, j, val);
    }

    // bottom-right
    Complex br = Complex.newScalar();
    br.set(invS);
    A.set(n, n, br);
  }

  public ComplexMatrix getInverse() {
    return inv;
  }
}