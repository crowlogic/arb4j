package arb.functions.complex;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;

/**
 * Adaptive Müntz–Padé approximant.
 *
 * <p>
 * The entire diagonal Padé hierarchy—denominator construction, numerator
 * convolution, approximant evaluation, and adaptive convergence certification—
 * is expressed through the ARB4J expression compiler. Integer-domain sequences
 * are automatically memoized by the framework.
 *
 * <p>
 * The only procedural component is the bordered rank-one update of the Hankel
 * inverse, which the expression language cannot express. The inverse is kept
 * as a single mutable {@link ComplexMatrix} field; no lists or caches are
 * maintained.
 */
public final class MuntzPadeApproximant implements
                                         ComplexFunction,
                                         AutoCloseable
{

  public static final class PrecisionExhaustedException extends
                                                        ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;
    public final int          precisionUsed;

    public PrecisionExhaustedException(int orderM, int precisionUsed)
    {
      super(String.format("Schur complement straddles zero at M=%d with %d bits", orderM, precisionUsed));
      this.orderM        = orderM;
      this.precisionUsed = precisionUsed;
    }
  }

  public static final class HankelDegeneracyException extends
                                                    ArithmeticException
  {
    private static final long serialVersionUID = 1L;
    public final int          orderM;

    public HankelDegeneracyException(int orderM)
    {
      super(String.format("Hankel singular at M=%d", orderM));
      this.orderM = orderM;
    }
  }

  public final Real     α;
  public final Complex  v;
  private final int     workingBits;
  private final Context context;
  private final ComplexFunctionSequence Φ;

  private final ComplexSequence a;

  private int       currentOrder;
  private ComplexMatrix currentInverse;

  private ComplexMatrix uVec;
  private ComplexMatrix zVec;
  private ComplexMatrix wVec;
  private ComplexMatrix rhsVec;
  private ComplexMatrix qVec;

  private final Complex s     = new Complex();
  private final Complex alpha = new Complex();
  private final Complex tmp   = new Complex();
  private final Complex z     = new Complex();

  private boolean closed;

  public MuntzPadeApproximant(Real α, ComplexSequence a, Complex v, int bits)
  {
    this.α           = α;
    this.v           = new Complex(v);
    this.workingBits = bits;
    this.a           = a;
    this.context     = new Context();

    context.registerSequence("a", a);

    ComplexPolynomialSequence qSeq = (M, order, abits, result) ->
    {
      int m = M.getSignedValue();
      ensureOrder(m);
      return solveDenominator(m, result);
    };
    context.registerFunctionMapping("qSeq", qSeq, Integer.class, ComplexPolynomial.class);

    ComplexPolynomialSequence Φden =
        ComplexPolynomialSequence.express("Φden:M➔sum(j➔qSeq(M)[j-1]*z^j{j=1..M})+1", context);
    Φden.setName("Φden");

    ComplexPolynomialSequence Φnum =
        ComplexPolynomialSequence.express("Φnum:M➔sum(n➔(a(n)+sum(j➔qSeq(M)[j-1]*a(n-j){j=1..n-1}))*z^n{n=1..M})", context);
    Φnum.setName("Φnum");

    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);
    this.Φ.setName("Φ");
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    checkOpen();
    t.pow(α, bits, z);

    try ( Real    threshold = new Real();
          Real    bound     = new Real();
          Integer M         = new Integer();
          Integer Mm1       = new Integer();
          Integer Mm2       = new Integer() )
    {
      threshold.one().mul2e(-bits, threshold);

      int m = 3;
      while (true)
      {
        M.set(m);
        Mm1.set(m - 1);
        Mm2.set(m - 2);

        // B_M(z) = |Δ_M(z)|² / (|Δ_{M−1}(z)| − |Δ_M(z)|)
        // Compiled as a scalar expression in M, z, and the memoized Φ.
        // Cache hits for Φ(M−1) and Φ(M−2) after first iteration.
        bound.set(ΦBound.evaluate(M, Mm1, Mm2, z, bits));

        if (bound.isPositive() && bound.compareTo(threshold) <= 0)
        {
          return Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, result);
        }
        m++;
      }
    }
  }

  // ── Procedural Hankel layer (single inverse, no lists) ─────────────────

  private void ensureOrder(int target)
  {
    while (currentOrder < target) growOne();
  }

  private void growOne()
  {
    int oldM = currentOrder;
    if (oldM == 0)
    {
      bootstrapInverse();
    }
    else
    {
      ComplexMatrix prev = currentInverse;
      currentInverse = buildNextInverse(oldM, prev);
      prev.close();
    }
    currentOrder = oldM + 1;
  }

  private void bootstrapInverse()
  {
    Complex a1 = a.apply(1);
    if (a1.contains(Complex.ZERO))
    {
      if (a1.isZero()) throw new HankelDegeneracyException(1);
      throw new PrecisionExhaustedException(1, workingBits);
    }
    currentInverse = ComplexMatrix.newMatrix(1, 1);
    tmp.one().div(a1, workingBits, currentInverse.get(0, 0));
  }

  private ComplexMatrix buildNextInverse(int oldM, ComplexMatrix prevInv)
  {
    ensureVecCapacity(oldM);

    for (int i = 0; i < oldM; i++) uVec.get(i, 0).set(a.apply(i + oldM + 1));
    prevInv.mul(uVec, workingBits, zVec);

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

    s.set(a.apply(2 * oldM + 1));
    for (int i = 0; i < oldM; i++)
    {
      tmp.set(a.apply(2 * oldM - i));
      tmp.mul(zVec.get(i, 0), workingBits, tmp);
      s.sub(tmp, workingBits, s);
    }

    if (s.contains(Complex.ZERO))
    {
      if (s.isZero()) throw new HankelDegeneracyException(oldM + 1);
      throw new PrecisionExhaustedException(oldM + 1, workingBits);
    }

    alpha.one().div(s, workingBits, alpha);

    int newM = oldM + 1;
    ComplexMatrix newInv = ComplexMatrix.newMatrix(newM, newM);

    for (int i = 0; i < oldM; i++)
      for (int j = 0; j < oldM; j++)
      {
        zVec.get(i, 0).mul(wVec.get(j, 0), workingBits, tmp);
        tmp.mul(alpha, workingBits, tmp);
        prevInv.get(i, j).add(tmp, workingBits, newInv.get(i, j));
      }

    for (int i = 0; i < oldM; i++)
    {
      zVec.get(i, 0).mul(alpha, workingBits, tmp);
      tmp.neg(newInv.get(i, oldM));
    }

    for (int j = 0; j < oldM; j++)
    {
      wVec.get(j, 0).mul(alpha, workingBits, tmp);
      tmp.neg(newInv.get(oldM, j));
    }

    newInv.get(oldM, oldM).set(alpha);
    return newInv;
  }

  private ComplexPolynomial solveDenominator(int M, ComplexPolynomial result)
  {
    ensureRhsCapacity(M);
    for (int i = 0; i < M; i++)
      rhsVec.get(i, 0).set(a.apply(M + i + 1)).neg(rhsVec.get(i, 0));
    currentInverse.mul(rhsVec, workingBits, qVec);

    result.fitLength(M);
    result.setLength(M);
    for (int i = 0; i < M; i++) result.get(i).set(qVec.get(i, 0));
    return result;
  }

  // ── Scratch capacity (grown once) ────────────────────────────────────

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

  // ── Lifecycle ────────────────────────────────────────────────────────

  private void checkOpen()
  {
    if (closed) throw new IllegalStateException("closed");
  }

  @Override
  public void close()
  {
    if (closed) return;
    closed = true;

    if (currentInverse != null) currentInverse.close();
    if (uVec != null)  uVec.close();
    if (zVec != null)  zVec.close();
    if (wVec != null)  wVec.close();
    if (rhsVec != null) rhsVec.close();
    if (qVec != null)   qVec.close();

    s.close();
    alpha.close();
    tmp.close();
    z.close();
    v.close();

    if (context != null) context.close();
  }
}
