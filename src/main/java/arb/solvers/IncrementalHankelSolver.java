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
 * via Sherman–Morrison rank-1 updates as M grows. For a given order M the
 * system solved is
 *
 * <pre>
 *   H_M · q = −b_M,   b_M(i) = a_{M+i+1},   0 ≤ i < M.
 * </pre>
 */
public class IncrementalHankelSolver implements AutoCloseable {

    private final ComplexSequence a;
    private final int             prec;

    private int           currentM = 0;
    private ComplexMatrix inv;

    // Working vectors (M×1) — resized on demand, never allocated in loops
    private ComplexMatrix uVec;
    private ComplexMatrix vVec;

    // Scalar scratch — allocated once, reused forever
    private final Complex s     = new Complex();
    private final Complex alpha = new Complex();
    private final Complex tmp   = new Complex();

    public IncrementalHankelSolver(ComplexSequence a, int prec) {
        this.a    = a;
        this.prec = prec;
    }

    /**
     * Solve H_M · q = −b_M and return q (M × 1). Caller must close the result.
     */
    public ComplexMatrix solve(int M) {
        if (M < 1) {
            throw new IllegalArgumentException("M must be ≥ 1, got " + M);
        }
        growTo(M);
        return computeQ(M);
    }

    /* ── incremental inverse maintenance ─────────────────────────────────── */

    private void growTo(int M) {
        if (currentM == 0) {
            bootstrap();
        }
        while (currentM < M) {
            growOnce();
        }
    }

    private void bootstrap() {
        Complex h11 = a.apply(1);
        inv = ComplexMatrix.newMatrix(1, 1);
        tmp.one().div(h11, prec, inv.get(0, 0));
        currentM = 1;
    }

    private void ensureVecCapacity(int n) {
        if (uVec == null || uVec.getNumRows() < n) {
            if (uVec != null) uVec.close();
            if (vVec != null) vVec.close();
            uVec = ComplexMatrix.newMatrix(n, 1);
            vVec = ComplexMatrix.newMatrix(n, 1);
        }
    }

    private void growOnce() {
        int oldM = currentM;
        int newM = oldM + 1;

        ensureVecCapacity(oldM);

        // u_i = a_{i+oldM+1}
        for (int i = 0; i < oldM; i++) {
            uVec.get(i, 0).set(a.apply(i + oldM + 1));
        }

        // v = inv · u   (standard matrix multiply: M×M · M×1)
        inv.mul(uVec, prec, vVec);

        // d = a_{2·oldM+1}
        Complex d = a.apply(2 * oldM + 1);

        // s = d − uᵀ·v
        s.set(d);
        for (int i = 0; i < oldM; i++) {
            uVec.get(i, 0).mul(vVec.get(i, 0), prec, tmp);
            s.sub(tmp, prec, s);
        }

        if (s.isZero()) {
            throw new ArithmeticException("Singular Hankel update at order " + newM);
        }

        // alpha = 1 / s
        alpha.one().div(s, prec, alpha);

        // newInv = [ inv + alpha·v·vᵀ   −alpha·v ]
        //          [ −alpha·vᵀ          alpha    ]
        ComplexMatrix newInv = ComplexMatrix.newMatrix(newM, newM);

        // top-left block
        for (int i = 0; i < oldM; i++) {
            for (int j = 0; j < oldM; j++) {
                vVec.get(i, 0).mul(vVec.get(j, 0), prec, tmp);
                tmp.mul(alpha, prec, tmp);
                inv.get(i, j).add(tmp, prec, newInv.get(i, j));
            }
        }

        // right border
        for (int i = 0; i < oldM; i++) {
            vVec.get(i, 0).mul(alpha, prec, tmp);
            tmp.neg(newInv.get(i, oldM));
        }

        // bottom border
        for (int j = 0; j < oldM; j++) {
            vVec.get(j, 0).mul(alpha, prec, tmp);
            tmp.neg(newInv.get(oldM, j));
        }

        // bottom-right corner
        newInv.get(oldM, oldM).set(alpha);

        // replace state
        inv.close();
        inv = newInv;
        currentM = newM;
    }

    /* ── RHS / solve ───────────────────────────────────────────────────── */

    private ComplexMatrix computeQ(int M) {
        ComplexMatrix rhs = ComplexMatrix.newMatrix(M, 1);
        for (int i = 0; i < M; i++) {
            rhs.get(i, 0).set(a.apply(M + i + 1)).neg(rhs.get(i, 0));
        }

        ComplexMatrix q = ComplexMatrix.newMatrix(M, 1);
        inv.mul(rhs, prec, q);   // q = inv · rhs
        rhs.close();
        return q;
    }

    @Override
    public void close() {
        if (inv != null) inv.close();
        if (uVec != null) uVec.close();
        if (vVec != null) vVec.close();
        s.close();
        alpha.close();
        tmp.close();
    }
}