package arb.functions.complex;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;

/**
 * Adaptive Müntz–Padé approximant with incremental Hankel inversion.
 *
 * <p>
 * The diagonal Padé hierarchy is expressed entirely through the ARB4J
 * expression compiler. The only procedural component is the bordered
 * rank-one update of the Hankel inverse, which the expression language
 * cannot express because it lacks block-matrix assembly. The compiler
 * automatically memoizes every integer-domain sequence ({@code qSeq},
 * {@code Φden}, {@code Φnum}, {@code Φ}), so no external caches are
 * maintained.
 *
 * <p>
 * The successive-difference a-posteriori bound
 * {@code |g(z)−R_M(z)| ≤ |Δ_M|²/(|Δ_{M−1}|−|Δ_M|)} drives adaptive order
 * selection. Convergence is certified when the bound drops below
 * {@code 2^(−bits)}.
 *
 * <p>
 * All scratch storage is pre-allocated at construction or lazily grown
 * once; no allocation occurs in the adaptive evaluation loop or the
 * Hankel update loops.
 */
public final class MuntzPadeApproximant implements
                                         ComplexFunction,
                                         AutoCloseable
{

  /** Precision exhausted: Schur complement straddles zero. */
  public static final class PrecisionExhaustedException extends
                                                        ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;
    public final int          precisionUsed;

    public PrecisionExhaustedException(int orderM, int precisionUsed)
    {
      super(String.format("Schur complement straddles zero at order M=%d with %d bits; "
                          + "rebuild at higher precision", orderM, precisionUsed));
      this.orderM        = orderM;
      this.precisionUsed = precisionUsed;
    }
  }

  /** Genuine Hankel determinant degeneracy. */
  public static final class HankelDegeneracyException extends
                                                    ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;

    public HankelDegeneracyException(int orderM)
    {
      super(String.format("Hankel matrix singular at order M=%d", orderM));
      this.orderM = orderM;
    }
  }

  /** Fractional exponent μ. */
  public final Real                          α;

  /** Fixed external parameter (copied). */
  public final Complex                       v;

  /** Working precision for Padé construction. */
  private final int                          workingBits;

  /** Expression context owning the compiled tower. */
  private final Context                      context;

  /** Compiled approximant sequence Φ : M ↦ ( z ↦ Φnum(M)(z)/Φden(M)(z) ). */
  private final ComplexFunctionSequence      Φ;

  /** Underlying Müntz coefficient sequence a(k). */
  private final ComplexSequence              a;

  // ── Procedural Hankel state (single current inverse, no lists). ────────

  /** Highest order for which currentInverse is valid. */
  private int                                currentOrder;

  /** H_{currentOrder}^{−1}, or null when currentOrder == 0. */
  private ComplexMatrix                      currentInverse;

  // ── Scratch vectors (grown once, reused forever). ──────────────────────

  /** u = (a_{M+1},…,a_{2M})^T  (M×1). */
  private ComplexMatrix                      uVec;

  /** zVec = H^{-1} · u  (M×1), i.e. the vector 𝐳 in Theorem 9.26. */
  private ComplexMatrix                      zVec;

  /** wVec = 𝐯^T · H^{-1} stored as an M×1 column, i.e. 𝐰^T transposed. */
  private ComplexMatrix                      wVec;

  /** Right-hand side −𝐛_M (M×1). */
  private ComplexMatrix                      rhsVec;

  /** Solution 𝐪 = H_M^{-1} · (−𝐛_M) (M×1). */
  private ComplexMatrix                      qVec;

  // ── Scalar scratch (pre-allocated). ──────────────────────────────────

  private final Complex                      s          = new Complex();
  private final Complex                      alpha      = new Complex();
  private final Complex                      tmp        = new Complex();
  private final Complex                      z          = new Complex();

  private boolean                            closed     = false;

  /**
   * Construct the approximant. The coefficient sequence {@code a} must be
   * fully configured (parameter {@code v} already bound) before passing.
   *
   * @param α     fractional order μ ∈ (0,1)
   * @param a     Müntz coefficient sequence k ↦ a_k(v)
   * @param v     external parameter (copied)
   * @param bits  working precision in bits
   */
  public MuntzPadeApproximant(Real α, ComplexSequence a, Complex v, int bits)
  {
    this.α           = α;
    this.v           = new Complex(v);
    this.workingBits = bits;
    this.a           = a;
    this.context     = new Context();

    // Register the coefficient sequence so compiled bodies can call a(k).
    context.registerSequence("a", a);

    // qSeq(M) is the single procedural bridge: it grows the Hankel
    // hierarchy to order M, solves H_M · q = −b_M, and returns the
    // denominator coefficient polynomial. The framework memoizes the
    // result automatically because the domain is Integer.
    ComplexPolynomialSequence qSeq = (M, order, abits, result) ->
    {
      int m = M.getSignedValue();
      ensureOrder(m);
      return solveDenominator(m, result);
    };
    context.registerFunctionMapping("qSeq",
                                    qSeq,
                                    Integer.class,
                                    ComplexPolynomial.class);

    // Compile the expression tower. Each level depends only on symbols
    // already registered; the framework caches every integer-indexed
    // sequence on first evaluation.

    ComplexPolynomialSequence Φden =
        ComplexPolynomialSequence.express("Φden:M➔sum(j➔qSeq(M)[j-1]*z^j{j=1..M})+1",
                                          context);
    Φden.setName("Φden");

    // Numerator via the convolution formula p_n = a_n + Σ_{j=1}^{n-1} q_j a_{n-j}.
    // The inner sum is empty for n=1, yielding p_1 = a_1 automatically.
    ComplexPolynomialSequence Φnum =
        ComplexPolynomialSequence.express("Φnum:M➔sum(n➔(a(n)+sum(j➔qSeq(M)[j-1]*a(n-j){j=1..n-1}))*z^n{n=1..M})",
                                          context);
    Φnum.setName("Φnum");

    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)",
                                             context);
    this.Φ.setName("Φ");
  }

  // ──────────────────────────────────────────────────────────────────────
  //  ComplexFunction API
  // ──────────────────────────────────────────────────────────────────────

  /**
   * Evaluate the adaptive Padé approximant at {@code t}. The method
   * computes z = t^μ and then walks M = 3,4,5,… until the successive-
   * difference bound is positive and below {@code 2^(−bits)}.
   *
   * <p>All temporaries are pre-allocated; no allocation occurs inside the
   * convergence loop.</p>
   *
   * @param t      argument of the original (pre-Müntz) function
   * @param order  unused (order is adaptive)
   * @param bits   target bits of precision
   * @param result caller-owned buffer
   * @return {@code result} populated with the converged value
   */
  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    checkOpen();
    t.pow(α, bits, z);

    try ( Real    threshold   = new Real();
          Real    absDeltaM   = new Real();
          Real    absDeltaMm1 = new Real();
          Real    num         = new Real();
          Real    denom       = new Real();
          Real    bound       = new Real();
          Complex valM        = new Complex();
          Complex valMm1      = new Complex();
          Complex valMm2      = new Complex();
          Complex deltaM      = new Complex();
          Complex deltaMm1    = new Complex();
          Integer M           = new Integer();
          Integer Mm1         = new Integer();
          Integer Mm2         = new Integer() )
    {
      threshold.one().mul2e(-bits, threshold);

      int m = 3;
      while (true)
      {
        M.set(m);
        Mm1.set(m - 1);
        Mm2.set(m - 2);

        // Φ(M) and Φ(M−1) are cache hits after the first iteration;
        // only Φ(M) is fresh work each step.
        Φ.evaluate(M,   1, bits, null).evaluate(z, 1, bits, valM);
        Φ.evaluate(Mm1, 1, bits, null).evaluate(z, 1, bits, valMm1);
        Φ.evaluate(Mm2, 1, bits, null).evaluate(z, 1, bits, valMm2);

        // |Δ_M|²
        valM.sub(valMm1, bits, deltaM).abs(bits, absDeltaM);
        absDeltaM.mul(absDeltaM, bits, num);

        // |Δ_{M−1}| − |Δ_M|
        valMm1.sub(valMm2, bits, deltaMm1).abs(bits, absDeltaMm1);
        absDeltaMm1.sub(absDeltaM, bits, denom);

        // Pre-asymptotic guard: contraction assumption fails.
        if (!denom.isPositive())
        {
          m++;
          continue;
        }

        num.div(denom, bits, bound);

        if (bound.compareTo(threshold) <= 0)
        {
          return result.set(valM);
        }
        m++;
      }
    }
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Procedural Hankel hierarchy (single current inverse, no lists)
  // ──────────────────────────────────────────────────────────────────────

  /** Grow the Hankel inverse from currentOrder up to target (inclusive). */
  private void ensureOrder(int target)
  {
    while (currentOrder < target)
    {
      growOne();
    }
  }

  /** Extend by one order using the bordered Sherman–Morrison formula. */
  private void growOne()
  {
    int oldM = currentOrder;
    int newM = oldM + 1;

    if (oldM == 0)
    {
      bootstrapInverse();
    }
    else
    {
      ComplexMatrix prevInv = currentInverse;
      currentInverse        = buildNextInverse(oldM, prevInv);
      prevInv.close();
    }
    currentOrder = newM;
  }

  /** H_1 = [a_1];  H_1^{-1} = [1/a_1]. */
  private void bootstrapInverse()
  {
    Complex a1 = a.apply(1);
    if (a1.contains(Complex.ZERO))
    {
      if (a1.isZero())
      {
        throw new HankelDegeneracyException(1);
      }
      throw new PrecisionExhaustedException(1, workingBits);
    }
    currentInverse = ComplexMatrix.newMatrix(1, 1);
    tmp.one().div(a1, workingBits, currentInverse.get(0, 0));
  }

  /**
   * Build H_{newM}^{-1} from H_{oldM}^{-1} via the bordered rank-one
   * update of Theorem 9.26.
   *
   * <pre>
   *   u_i = a_{i+oldM+1}          (new column, minus bottom)
   *   v^T = (a_{2·oldM},…,a_{oldM+1})  (last row of first oldM columns)
   *   d   = a_{2·oldM+1}          (bottom-right corner)
   *   z   = H^{-1} · u
   *   w^T = v^T · H^{-1}
   *   s   = d − w^T · u  (= d − v^T · z)
   * </pre>
   */
  private ComplexMatrix buildNextInverse(int oldM, ComplexMatrix prevInv)
  {
    ensureVecCapacity(oldM);

    // u_i = a_{i + oldM + 1}
    for (int i = 0; i < oldM; i++)
    {
      uVec.get(i, 0).set(a.apply(i + oldM + 1));
    }

    // 𝐳 = H^{-1} · 𝐮
    prevInv.mul(uVec, workingBits, zVec);

    // 𝐰^T = 𝐯^T · H^{-1}, stored as a column vector.
    // v_i = a_{2·oldM − i}  (0-indexed: v_0 = a_{2M}, v_{M-1} = a_{M+1})
    for (int j = 0; j < oldM; j++)
    {
      wVec.get(j, 0).zero();
      for (int i = 0; i < oldM; i++)
      {
        tmp.set(a.apply(2 * oldM - i));
        tmp.mul(prevInv.get(i, j), workingBits, tmp);
        wVec.get(j, 0).add(tmp, workingBits, wVec.get(j, 0));
      }
    }

    // Schur complement s = d − Σ_i v_i · z_i
    s.set(a.apply(2 * oldM + 1));
    for (int i = 0; i < oldM; i++)
    {
      tmp.set(a.apply(2 * oldM - i));
      tmp.mul(zVec.get(i, 0), workingBits, tmp);
      s.sub(tmp, workingBits, s);
    }

    if (s.contains(Complex.ZERO))
    {
      if (s.isZero())
      {
        throw new HankelDegeneracyException(oldM + 1);
      }
      throw new PrecisionExhaustedException(oldM + 1, workingBits);
    }

    alpha.one().div(s, workingBits, alpha);

    int         newM   = oldM + 1;
    ComplexMatrix newInv = ComplexMatrix.newMatrix(newM, newM);

    // Top-left block: H^{-1} + α · 𝐳 · 𝐰^T
    for (int i = 0; i < oldM; i++)
    {
      for (int j = 0; j < oldM; j++)
      {
        zVec.get(i, 0).mul(wVec.get(j, 0), workingBits, tmp);
        tmp.mul(alpha, workingBits, tmp);
        prevInv.get(i, j).add(tmp, workingBits, newInv.get(i, j));
      }
    }

    // Right border (except bottom): −α · 𝐳
    for (int i = 0; i < oldM; i++)
    {
      zVec.get(i, 0).mul(alpha, workingBits, tmp);
      tmp.neg(newInv.get(i, oldM));
    }

    // Bottom border (except right): −α · 𝐰^T
    for (int j = 0; j < oldM; j++)
    {
      wVec.get(j, 0).mul(alpha, workingBits, tmp);
      tmp.neg(newInv.get(oldM, j));
    }

    // Bottom-right corner: α
    newInv.get(oldM, oldM).set(alpha);

    return newInv;
  }

  /**
   * Solve H_M · 𝐪 = −𝐛_M using the cached inverse and package the
   * result as a {@link ComplexPolynomial} whose coefficient at index
   * {@code j−1} is 𝐪_j.
   */
  private ComplexPolynomial solveDenominator(int M, ComplexPolynomial result)
  {
    ensureRhsCapacity(M);

    for (int i = 0; i < M; i++)
    {
      rhsVec.get(i, 0).set(a.apply(M + i + 1)).neg(rhsVec.get(i, 0));
    }
    currentInverse.mul(rhsVec, workingBits, qVec);

    result.fitLength(M);
    result.setLength(M);
    for (int i = 0; i < M; i++)
    {
      result.get(i).set(qVec.get(i, 0));
    }
    return result;
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Scratch capacity (reallocates only when size increases)
  // ──────────────────────────────────────────────────────────────────────

  private void ensureVecCapacity(int n)
  {
    if (uVec == null || uVec.getNumRows() < n)
    {
      if (uVec != null)  uVec.close();
      if (zVec != null)  zVec.close();
      if (wVec != null)  wVec.close();

      uVec = ComplexMatrix.newMatrix(n, 1);
      zVec = ComplexMatrix.newMatrix(n, 1);
      wVec = ComplexMatrix.newMatrix(n, 1);
    }
  }

  private void ensureRhsCapacity(int n)
  {
    if (rhsVec == null || rhsVec.getNumRows() < n)
    {
      if (rhsVec != null) rhsVec.close();
      if (qVec != null)   qVec.close();

      rhsVec = ComplexMatrix.newMatrix(n, 1);
      qVec   = ComplexMatrix.newMatrix(n, 1);
    }
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Lifecycle
  // ──────────────────────────────────────────────────────────────────────

  private void checkOpen()
  {
    if (closed)
    {
      throw new IllegalStateException("MuntzPadeApproximant is closed");
    }
  }

  @Override
  public void close()
  {
    if (closed) return;
    closed = true;

    if (currentInverse != null) currentInverse.close();

    if (uVec != null) uVec.close();
    if (zVec != null) zVec.close();
    if (wVec != null) wVec.close();
    if (rhsVec != null) rhsVec.close();
    if (qVec != null) qVec.close();

    s.close();
    alpha.close();
    tmp.close();
    z.close();
    v.close();

    // The context owns Φ, Φden, Φnum, qSeq and a; closing it closes them.
    if (context != null) context.close();
  }
}
