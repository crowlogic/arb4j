package arb.functions.complex;

import java.util.ArrayList;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Real;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;

/**
 * Adaptive Müntz–Padé evaluator at fixed external parameter v.
 *
 * <p>
 * The diagonal Padé hierarchy is expressed entirely through the arb4j
 * expression compiler. The only procedural component is maintenance of the
 * Hankel inverse hierarchy via Sherman–Morrison bordered updates, which the
 * expression language cannot express because it lacks block-matrix assembly
 * and submatrix extraction. The denominator coefficients computed from each
 * Hankel inverse are deposited into a bound {@link ComplexPolynomialSequence}
 * named {@code qSeq} in the expression context. Every sequence above that
 * boundary is compiled bytecode and cached automatically by the framework.
 *
 * <h2>Naming convention</h2>
 *
 * <p>
 * The Riccati equation
 * {@code Đ^μ u(z;v) = P(v) + Q(v)·u(z;v) + R(v)·u(z;v)²} reserves the names
 * {@code P}, {@code Q}, {@code R} for its polynomial parameters, following
 * the convention of {@link RiccatiMuntzPadeFunctional}. The Padé approximant
 * sequence is therefore named {@code Φ} to avoid the namespace collision; its
 * denominator and numerator polynomial sequences are named {@code Φden} and
 * {@code Φnum} respectively. The Hankel-derived denominator coefficient
 * sequence — populated procedurally and read symbolically from compiled
 * expression bodies — is named {@code qSeq}.
 *
 * <h2>Compiled expression tower</h2>
 *
 * <pre>
 *   Φden : M ➔ sum(j ➔ qSeq(M)[j-1]·z^j {j=1..M}) + 1
 *   Φnum : M ➔ sum(k ➔ a(k+1)·z^k {k=0..M-1}) · Φden(M)
 *   Φ    : M ➔ z ➔ Φnum(M)(z) / Φden(M)(z)
 * </pre>
 *
 * <p>
 * The successive-difference bound
 * {@code B_M = |Δ_M|² / (|Δ_{M-1}| − |Δ_M|)} of Theorem 5.2 is a scalar at
 * each evaluation point, not a function of {@code z}, so it is assembled in
 * Java from three cached evaluations of {@code Φ} rather than being authored
 * as a separate compiled sequence. The framework caches each {@code Φ(M)}
 * automatically, so the three evaluations needed by the bound at iteration
 * {@code M} reduce to one fresh evaluation of {@code Φ(M)(z)} plus two cache
 * hits for {@code Φ(M-1)(z)} and {@code Φ(M-2)(z)}.
 *
 * <h2>Convergence and pre-asymptotic guard</h2>
 *
 * <p>
 * The convergence loop accepts the smallest {@code M ≥ 3} at which the bound
 * is positive (Proposition 5.3 guard: {@code |Δ_{M-1}| > |Δ_M|}) and below
 * the precision threshold {@code 2^(-bits)}. Theorem 5.4 guarantees this
 * occurs in finitely many steps for every evaluation point in the maximal
 * domain of single-valued meromorphic continuation.
 *
 * <h2>Singularity handling</h2>
 *
 * <p>
 * A Schur complement that contains zero is distinguished from one that is
 * certifiably zero. The former indicates precision exhaustion (caller should
 * rebuild at higher precision); the latter indicates genuine Hankel
 * degeneracy (caller may skip M and try M+1, per Remark 4.6 of the paper).
 */
public final class MuntzPadeApproximant implements
                                         AutoCloseable
{

  /**
   * Raised when a Schur complement is certifiably non-zero only at higher
   * working precision than the evaluator was constructed with.
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
                          + "rebuild the evaluator at higher precision",
                          orderM,
                          precisionUsed));
      this.orderM        = orderM;
      this.precisionUsed = precisionUsed;
    }
  }

  /**
   * Raised when a Schur complement is exactly zero at full precision,
   * indicating genuine Hankel determinant degeneracy.
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

  /** Fractional exponent μ. */
  public final Real                          α;

  /** Fixed external parameter. */
  public final Complex                       v;

  /** Working precision used for Padé construction. */
  private final int                          workingBits;

  /** Expression context owning {@code a}, {@code z}, {@code qSeq}, {@code Φden}, {@code Φnum}, {@code Φ}. */
  private final Context                      context;

  /**
   * Procedurally maintained backing store for the bound {@code qSeq}
   * sequence. {@code denomPolys.get(M-1)} is the denominator coefficient
   * polynomial for Padé order M, with coefficient at index {@code j-1}
   * holding the Hankel-derived denominator entry {@code q_j}. Compiled
   * expression bodies read these coefficients through bracket indexing
   * on {@code qSeq(M)}.
   */
  private final ArrayList<ComplexPolynomial> denomPolys = new ArrayList<>();

  /**
   * Cached Hankel inverses. {@code inverses.get(M-1) == H_M^{-1}}. Maintained
   * incrementally via Sherman–Morrison bordered updates. The expression
   * language cannot express the bordered update because it has no
   * block-assembly syntax, so this hierarchy is the single procedural
   * component of the evaluator.
   */
  private final ArrayList<ComplexMatrix>     inverses   = new ArrayList<>();

  /** Compiled Padé approximant sequence {@code Φ : M ➔ z ➔ Φnum(M)(z) / Φden(M)(z)}. */
  private final ComplexFunctionSequence      Φ;

  /** Underlying coefficient sequence {@code a(k)} bound in the context. */
  private final ComplexSequence              a;

  // ── Per-growth scratch (allocated once, reused across all orders). ─────

  /** u_i = a_{i + oldM + 1}, oldM × 1 column vector. */
  private ComplexMatrix                      uVec;

  /** v = H_oldM^{-1} · u, oldM × 1 column vector. */
  private ComplexMatrix                      vVec;

  /** Right-hand side scratch −b_M for the denominator solve. */
  private ComplexMatrix                      rhsVec;

  /** Solution vector q = H_M^{-1} · (−b_M), reused for each order. */
  private ComplexMatrix                      qVec;

  /** Schur complement, its inverse, and a Complex scratch register. */
  private final Complex                      s          = new Complex();
  private final Complex                      alpha      = new Complex();
  private final Complex                      tmp        = new Complex();

  /** Evaluation point z = t^μ. */
  private final Complex                      z          = new Complex();

  private boolean                            closed     = false;

  /**
   * Construct the evaluator. The Müntz coefficient sequence {@code a} must
   * already be registered in {@code context} under the name {@code "a"} as a
   * {@link ComplexSequence}, with the polynomial parameter values bound. A
   * unit polynomial named {@code "z"} must likewise be registered as the
   * indeterminate.
   *
   * @param context owning context with {@code a} and {@code z} pre-registered
   * @param α       fractional order μ ∈ (0, 1)
   * @param v       fixed external parameter (copied)
   * @param bits    working precision in bits
   */
  public MuntzPadeApproximant(Context context, Real α, Complex v, int bits)
  {
    this.context     = context;
    this.α           = α;
    this.v           = new Complex(v);
    this.workingBits = bits;
    this.a           = (ComplexSequence) context.functions.get("a").instance;

    // qSeq: integer-indexed sequence of polynomials backed by denomPolys.
    // The procedural Hankel layer appends to the backing store; the bound
    // sequence simply returns the polynomial at the requested index. The
    // framework caches each evaluation, so the lookup is O(1) and incurs
    // no copy.
    ComplexPolynomialSequence qSeq = (M, order, abits, result) ->
    {
      ensureOrder(M.getSignedValue());
      return result.set(denomPolys.get(M.getSignedValue() - 1));
    };
    context.registerFunctionMapping("qSeq",
                                    arb.Integer.class,
                                    ComplexPolynomial.class,
                                    ComplexPolynomialSequence.class)
           .instance = qSeq;

    // Compile the expression tower. Each level depends only on previously-
    // resolved symbols; the framework caches each compiled sequence on its
    // integer index.

    ComplexPolynomialSequence Φden =
        ComplexPolynomialSequence.express("Φden:M➔sum(j➔qSeq(M)[j-1]*z^j{j=1..M})+1", context);
    Φden.setName("Φden");

    ComplexPolynomialSequence Φnum =
        ComplexPolynomialSequence.express("Φnum:M➔sum(k➔a(k+1)*z^k{k=0..M-1})*Φden(M)", context);
    Φnum.setName("Φnum");

    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);
    this.Φ.setName("Φ");
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Public API
  // ──────────────────────────────────────────────────────────────────────

  /**
   * Evaluate the adaptive Padé approximant at t. Walks {@code M = 3, 4, 5, …}
   * (the bound is undefined for {@code M < 3} because it references
   * {@code Φ(M-2)}), accepting the smallest {@code M} for which the
   * successive-difference bound is positive and below {@code 2^(-bits)}.
   *
   * @param t      argument of the original (pre-Müntz) function
   * @param bits   target bits of precision
   * @param result caller-owned buffer; populated with {@code Φ_M(z)} at convergence
   * @return {@code result}
   */
  public Complex evaluate(Complex t, int bits, Complex result)
  {
    checkOpen();
    t.pow(α, bits, z);

    try ( Real    threshold = new Real();
          Real    absDeltaM = new Real();
          Real    absDeltaMm1 = new Real();
          Real    num = new Real();
          Real    denom = new Real();
          Real    bound = new Real();
          Complex valM = new Complex();
          Complex valMm1 = new Complex();
          Complex valMm2 = new Complex();
          Complex deltaM = new Complex();
          Complex deltaMm1 = new Complex();
          arb.Integer M = new arb.Integer();
          arb.Integer Mm1 = new arb.Integer();
          arb.Integer Mm2 = new arb.Integer() )
    {
      threshold.one().mul2e(-bits, threshold);

      for (int m = 3; ; m++)
      {
        M.set(m);
        Mm1.set(m - 1);
        Mm2.set(m - 2);

        // Three Φ evaluations: Φ(M-2) and Φ(M-1) are framework cache hits
        // after the first M=3 iteration; only Φ(M) is computed fresh.
        Φ.evaluate(M,   1, bits, null).evaluate(z, 1, bits, valM);
        Φ.evaluate(Mm1, 1, bits, null).evaluate(z, 1, bits, valMm1);
        Φ.evaluate(Mm2, 1, bits, null).evaluate(z, 1, bits, valMm2);

        // B_M = |Δ_M|² / (|Δ_{M-1}| − |Δ_M|)
        valM.sub(valMm1, bits, deltaM).abs(bits, absDeltaM);
        absDeltaM.mul(absDeltaM, bits, num);

        valMm1.sub(valMm2, bits, deltaMm1).abs(bits, absDeltaMm1);
        absDeltaMm1.sub(absDeltaM, bits, denom);

        // Pre-asymptotic guard: if |Δ_{M-1}| ≤ |Δ_M| then denom ≤ 0, the
        // geometric assumption fails, and M is insufficient. Continue.
        if (!denom.isPositive())
        {
          continue;
        }

        num.div(denom, bits, bound);

        if (bound.compareTo(threshold) <= 0)
        {
          // Reuse the already-computed Φ(M)(z).
          return result.set(valM);
        }
      }
    }
  }

  /**
   * Greatest Padé order currently materialised by the procedural layer.
   * The framework cache may hold further dependent values from compiled
   * sequence evaluations.
   */
  public int currentOrder()
  {
    return inverses.size();
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Procedural Hankel hierarchy maintenance
  // ──────────────────────────────────────────────────────────────────────

  /**
   * Ensure the inverse and denomPolys hierarchies are populated through
   * order M. Called from the bound {@code qSeq} body whenever the framework
   * evaluates {@code qSeq(M)} at an order beyond the current high-water
   * mark, propagated up from {@code Φden(M)} → {@code Φnum(M)} → {@code Φ(M)}
   * during convergence-loop evaluation.
   */
  private void ensureOrder(int M)
  {
    while (currentOrder() < M)
    {
      growOne();
    }
  }

  /**
   * Extend the procedural hierarchy by one order. Computes
   * {@code H_{newM}^{-1}} from {@code H_{oldM}^{-1}} via Sherman–Morrison,
   * then computes the denominator coefficient polynomial and appends it to
   * the backing store of the bound {@code qSeq} sequence.
   */
  private void growOne()
  {
    int oldM = inverses.size();
    int newM = oldM + 1;

    if (oldM == 0)
    {
      bootstrapInverse();
    }
    else
    {
      inverses.add(buildNextInverse(oldM));
    }

    denomPolys.add(buildDenominatorPolynomial(newM));
  }

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
    ComplexMatrix h1Inv = ComplexMatrix.newMatrix(1, 1);
    tmp.one().div(a1, workingBits, h1Inv.get(0, 0));
    inverses.add(h1Inv);
  }

  private ComplexMatrix buildNextInverse(int oldM)
  {
    int newM = oldM + 1;
    ensureVecCapacity(oldM);

    ComplexMatrix prevInv = inverses.get(oldM - 1);

    // u_i = a_{i + oldM + 1}
    for (int i = 0; i < oldM; i++)
    {
      uVec.get(i, 0).set(a.apply(i + oldM + 1));
    }

    // v = prevInv · u
    prevInv.mul(uVec, workingBits, vVec);

    // s = d − uᵀ·v, where d = a_{2·oldM + 1}
    s.set(a.apply(2 * oldM + 1));
    for (int i = 0; i < oldM; i++)
    {
      uVec.get(i, 0).mul(vVec.get(i, 0), workingBits, tmp);
      s.sub(tmp, workingBits, s);
    }

    if (s.contains(Complex.ZERO))
    {
      if (s.isZero())
      {
        throw new HankelDegeneracyException(newM);
      }
      throw new PrecisionExhaustedException(newM, workingBits);
    }

    alpha.one().div(s, workingBits, alpha);

    ComplexMatrix newInv = ComplexMatrix.newMatrix(newM, newM);
    return assembleBorderedInverse(oldM, prevInv, newInv);
  }

  /**
   * Assemble the bordered inverse
   * {@code newInv = [prevInv + α·v·vᵀ, −α·v; −α·vᵀ, α]} into {@code result}.
   */
  private ComplexMatrix assembleBorderedInverse(int oldM, ComplexMatrix prevInv, ComplexMatrix result)
  {
    for (int i = 0; i < oldM; i++)
    {
      Complex vi = vVec.get(i, 0);
      for (int j = 0; j < oldM; j++)
      {
        vi.mul(vVec.get(j, 0), workingBits, tmp);
        tmp.mul(alpha, workingBits, tmp);
        prevInv.get(i, j).add(tmp, workingBits, result.get(i, j));
      }
    }
    for (int i = 0; i < oldM; i++)
    {
      vVec.get(i, 0).mul(alpha, workingBits, tmp);
      tmp.neg(result.get(i, oldM));
    }
    for (int j = 0; j < oldM; j++)
    {
      vVec.get(j, 0).mul(alpha, workingBits, tmp);
      tmp.neg(result.get(oldM, j));
    }
    result.get(oldM, oldM).set(alpha);
    return result;
  }

  /**
   * Solve {@code H_M · q = −b_M} using the cached inverse, then package the
   * solution as a {@link ComplexPolynomial} of length M whose coefficient
   * at index {@code j-1} is {@code q_j}. The bound {@code qSeq} sequence
   * reads these coefficients through bracket indexing inside the compiled
   * expression {@code Φden}.
   */
  private ComplexPolynomial buildDenominatorPolynomial(int M)
  {
    ensureRhsAndSolutionCapacity(M);

    for (int i = 0; i < M; i++)
    {
      rhsVec.get(i, 0).set(a.apply(M + i + 1)).neg(rhsVec.get(i, 0));
    }
    inverses.get(M - 1).mul(rhsVec, workingBits, qVec);

    ComplexPolynomial qPoly = new ComplexPolynomial();
    qPoly.fitLength(M);
    qPoly.setLength(M);
    for (int j = 0; j < M; j++)
    {
      qPoly.get(j).set(qVec.get(j, 0));
    }
    return qPoly;
  }

  // ──────────────────────────────────────────────────────────────────────
  //  Scratch capacity
  // ──────────────────────────────────────────────────────────────────────

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

  private void ensureRhsAndSolutionCapacity(int n)
  {
    if (rhsVec == null || rhsVec.getNumRows() < n)
    {
      if (rhsVec != null)
      {
        rhsVec.close();
      }
      if (qVec != null)
      {
        qVec.close();
      }
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
    if (closed)
    {
      return;
    }
    closed = true;

    for (ComplexMatrix m : inverses)
    {
      m.close();
    }
    inverses.clear();

    for (ComplexPolynomial p : denomPolys)
    {
      p.close();
    }
    denomPolys.clear();

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
    if (qVec != null)
    {
      qVec.close();
      qVec = null;
    }

    s.close();
    alpha.close();
    tmp.close();
    z.close();
    v.close();

    if (Φ != null)
    {
      Φ.close();
    }
  }
}
