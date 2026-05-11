package arb.functions.complex;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;

/**
 * Adaptive Müntz–Padé approximant.
 *
 * <p>
 * The entire diagonal Padé hierarchy—denominator construction, numerator
 * assembly, approximant evaluation, and adaptive convergence certification—is
 * expressed through the ARB4J expression compiler. Integer-domain sequences
 * are automatically memoized by the framework.
 *
 * <p>
 * The only procedural component is the orthogonal-polynomial three-term
 * recurrence (Sack–Donovan / Wheeler / Gautschi), driven by a sliding
 * three-row σ-table of size O(M). At each growth step the σ-row is updated,
 * h_j is read off the diagonal, β_{j+1} and γ_{j+1} are derived, and Q_{j+1},
 * P_{j+1} are advanced by the classical Favard recurrence. No matrix
 * inversion, no per-step allocation beyond one snapshot of Q_j, P_j into the
 * level caches consumed by the {@code qSeq} / {@code Φnum} memoizer.
 *
 * <p>
 * See qrh.tex §9.7, Theorems 9.23 and 9.31, and issue #1016.
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
      super(String.format("h_j straddles zero at j=%d with %d bits",
                          orderM,
                          precisionUsed));
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
      super(String.format("Moment functional indefinite: h_j = 0 at j=%d",
                          orderM));
      this.orderM = orderM;
    }
  }

  public final Real                       α;
  public final Complex                    v;
  private final int                       workingBits;
  private final Context                   context;
  private final ComplexFunctionSequence   Φ;
  private final ComplexSequence           ΦBound;
  private final ComplexPolynomialSequence a;

  // ── Recurrence state ───────────────────────────────────────────────────
  //
  // σ sliding window: three rows of length 2·sigmaWidth (the half-row count
  // 2M from the proposal). Grown lazily on first ensureOrder() call so we
  // can size based on the requested order budget.
  private int             sigmaWidth;        // half-width; arrays have length 2*sigmaWidth
  private Complex[]       sigmaPrev;         // σ_{j-1, ·}
  private Complex[]       sigmaCurr;         // σ_{j,   ·}
  private Complex[]       sigmaNext;         // σ_{j+1, ·} (scratch, rotated in)

  // Q_{j-1}, Q_j, scratch for Q_{j+1}; same for P
  private ComplexPolynomial Qprev, Qcurr, Qbuf;
  private ComplexPolynomial Pprev, Pcurr, Pbuf;

  // Memoized snapshots indexed by level: Q.get(j) = Q_j, P.get(j) = P_j
  // (deep copies — Qcurr/Pcurr keep rotating).
  private final ArrayList<ComplexPolynomial> Q = new ArrayList<>();
  private final ArrayList<ComplexPolynomial> P = new ArrayList<>();

  private final Complex h_prev = new Complex();   // h_{j-1}
  private final Complex h_curr = new Complex();   // h_j
  private final Complex beta   = new Complex();   // β_{j+1}
  private final Complex gamma  = new Complex();   // γ_{j+1}
  private final Complex tmp    = new Complex();
  private final Complex tmp2   = new Complex();
  private final Complex z      = new Complex();   // z = t^α, registered into context

  // currentOrder = j: Qcurr / Pcurr hold Q_j / P_j; Q.size() == P.size() == j+1
  private int currentOrder = 0;

  private boolean closed;

  public MuntzPadeApproximant(Real α, ComplexPolynomialSequence a, Complex v, int bits)
  {
    this.α           = α;
    this.v           = new Complex(v);
    this.workingBits = bits;
    this.a           = a;
    this.context     = new Context();

    context.registerVariable("z", z);

    ComplexSequence aScalars = (k, order, abits, result) ->
    {
      int               idx = k.getSignedValue();
      ComplexPolynomial pIn = this.a.apply(idx);
      return pIn.evaluate(this.v, 1, abits, result);
    };
    context.registerSequence("a", aScalars);

    // qSeq(M): reverse-coefficient form of monic Q_M.
    //   qSeq(M)[k] = Q_M.get(M-1-k)   for k = 0 .. M-1
    // so that Φden = 1 + Σⱼ qSeq(M)[j-1]·zʲ = z^M · Q_M(1/z).
    ComplexPolynomialSequence qSeq = (M, order, abits, result) ->
    {
      int m = M.getSignedValue();
      ensureOrder(m);
      return reverseMonicCoefficients(Q.get(m), m, result);
    };
    context.registerFunctionMapping("qSeq",
                                    qSeq,
                                    Integer.class,
                                    ComplexPolynomial.class);

    ComplexPolynomialSequence Φden =
        ComplexPolynomialSequence.express("Φden:M➔sum(j➔qSeq(M)[j-1]*z^j{j=1..M})+1",
                                          context);
    Φden.setName("Φden");

    // Φnum(M) = z · P_M(z). The leading z factor is per Definition 9.21
    // (Φ_M(z) = z · P_M(z) / Q̂_M(z)). Computed directly from the recurrence;
    // replaces the old convolution
    //   Φnum:M➔sum(n➔(a(n)+sum(j➔qSeq(M)[j-1]*a(n-j){j=1..n-1}))*z^n{n=1..M})
    ComplexPolynomialSequence Φnum = (M, order, abits, result) ->
    {
      int m = M.getSignedValue();
      ensureOrder(m);
      return P.get(m).shiftLeft(1, result);
    };
    context.registerFunctionMapping("Φnum",
                                    Φnum,
                                    Integer.class,
                                    ComplexPolynomial.class);

    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)",
                                             context);
    this.Φ.setName("Φ");

    this.ΦBound = ComplexSequence.express(
        "ΦBound:M➔abs(Φ(M)(z)-Φ(M-1)(z))^2/(abs(Φ(M-1)(z)-Φ(M-2)(z))-abs(Φ(M)(z)-Φ(M-1)(z)))",
        context);
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    checkOpen();
    t.pow(α, bits, z);

    try ( Real    threshold = new Real();
          Real    bound     = new Real();
          Integer M         = new Integer() )
    {
      threshold.one().mul2e(-bits, threshold);

      int m = 3;
      while (true)
      {
        M.set(m);

        bound.set(ΦBound.evaluate(M, 1, bits, null));

        if (bound.isPositive() && bound.compareTo(threshold) <= 0)
        {
          return Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, result);
        }
        m++;
      }
    }
  }

  // ── Chebyshev recurrence (σ sliding window) ─────────────────────────────
  //
  // qrh.tex §9.7, Theorem 9.23 / equation 9.35:
  //
  //   σ_{j+1, k} = σ_{j, k+1} − β_{j+1}·σ_{j, k} − γ_{j+1}·σ_{j-1, k}
  //   h_j        = σ_{j, j}
  //   β_{j+1}    = σ_{j, j+1} / h_j
  //   γ_{j+1}    = h_j / h_{j-1}
  //   Q_{j+1}    = (z − β_{j+1})·Q_j − γ_{j+1}·Q_{j-1}
  //   P_{j+1}    = (z − β_{j+1})·P_j − γ_{j+1}·P_{j-1}
  //
  // Bootstrap: Q_{-1}=0, Q_0=1, P_{-1}=-1, P_0=0, h_{-1}=1, σ_{0,k}=a_{k+1}(v).

  private void ensureOrder(int target)
  {
    if (target <= currentOrder) return;
    if (sigmaPrev == null) initRecurrence(target);
    else if (target > sigmaWidth)
    {
      // Caller wants higher order than initial budget. Expand σ arrays.
      // (Should be rare — initRecurrence sizes generously.)
      growSigmaCapacity(target);
    }
    while (currentOrder < target) growOne();
  }

  /**
   * Allocate σ arrays sized for orders up to {@code budgetM} and fill row 0
   * with the moment scalars {@code a_{k+1}(v)} for k = 0..2·budgetM−1.
   * Bootstrap Q_0 = 1, P_0 = 0 and snapshot them at level 0.
   */
  private void initRecurrence(int budgetM)
  {
    // Size σ-rows to cover orders up to budgetM with generous slack so we
    // don't have to reallocate for typical convergence M's (~10–30). For
    // M > sigmaWidth the user must construct with a larger initial budget;
    // mid-recurrence expansion would require replaying lost σ rows.
    sigmaWidth = Math.max(budgetM * 2, 64);
    int len    = 2 * sigmaWidth;
    sigmaPrev  = new Complex[len];
    sigmaCurr  = new Complex[len];
    sigmaNext  = new Complex[len];
    for (int k = 0; k < len; k++)
    {
      sigmaPrev[k] = new Complex();              // σ_{-1, k} = 0
      sigmaCurr[k] = new Complex();
      sigmaNext[k] = new Complex();
    }

    // σ_{0, k} = a_{k+1}(v)  for k = 0..len-1
    for (int k = 0; k < len; k++)
    {
      ComplexPolynomial pIn = this.a.apply(k + 1);
      pIn.evaluate(this.v, 1, workingBits, sigmaCurr[k]);
    }

    // h_{-1} = 1
    h_prev.one();

    // Q_0 = 1, P_0 = 0; Q_{-1} = 0, P_{-1} = -1
    Qprev = new ComplexPolynomial();   // 0
    Qcurr = new ComplexPolynomial().one();
    Qbuf  = new ComplexPolynomial();
    Pprev = new ComplexPolynomial();
    Pprev.fitLength(1);
    Pprev.setLength(1);
    Pprev.get(0).one().neg(Pprev.get(0));    // P_{-1} = -1
    Pcurr = new ComplexPolynomial();         // P_0 = 0
    Pbuf  = new ComplexPolynomial();

    Q.add(new ComplexPolynomial().set(Qcurr));   // Q.get(0) = Q_0 = 1
    P.add(new ComplexPolynomial().set(Pcurr));   // P.get(0) = P_0 = 0
    currentOrder = 0;
  }

  /** Expand σ arrays when caller exceeds the initial order budget. */
  private void growSigmaCapacity(int newBudget)
  {
    int newWidth = Math.max(newBudget, 2 * sigmaWidth);
    int newLen   = 2 * newWidth;
    Complex[] newPrev = new Complex[newLen];
    Complex[] newCurr = new Complex[newLen];
    Complex[] newNext = new Complex[newLen];
    int oldLen = 2 * sigmaWidth;
    for (int k = 0; k < newLen; k++)
    {
      if (k < oldLen)
      {
        newPrev[k] = sigmaPrev[k];
        newCurr[k] = sigmaCurr[k];
        newNext[k] = sigmaNext[k];
      }
      else
      {
        newPrev[k] = new Complex();
        newCurr[k] = new Complex();
        newNext[k] = new Complex();
      }
    }
    // Fill any newly-needed σ_{currentOrder, k} entries with fresh moments.
    // The current row σ_{currentOrder, ·} is what's *currently* in sigmaCurr
    // for k = 0..oldLen-1; for k >= oldLen we'd need to *replay* the σ
    // recurrence from row 0 to row currentOrder which we don't keep. So if
    // a caller exceeds the initial budget we throw — initRecurrence's
    // budget should always be tight enough that this doesn't fire.
    if (currentOrder > 0)
    {
      throw new IllegalStateException(
          "σ-window expansion after recurrence has advanced is not supported; "
          + "increase initial budget");
    }
    sigmaPrev = newPrev;
    sigmaCurr = newCurr;
    sigmaNext = newNext;
    sigmaWidth = newWidth;
    // Re-fill σ_{0, k} for the newly added range
    int len = 2 * sigmaWidth;
    for (int k = oldLen; k < len; k++)
    {
      ComplexPolynomial pIn = this.a.apply(k + 1);
      pIn.evaluate(this.v, 1, workingBits, sigmaCurr[k]);
    }
  }

  /**
   * Advance the recurrence by one level: compute σ_{j+1, ·}, β_{j+1},
   * γ_{j+1}, Q_{j+1}, P_{j+1} from the current state.
   */
  private void growOne()
  {
    int j   = currentOrder;
    int len = 2 * sigmaWidth;

    // h_j is the diagonal entry σ_{j, j}.
    h_curr.set(sigmaCurr[j]);

    if (h_curr.containsZero())
    {
      if (h_curr.isZero()) throw new HankelDegeneracyException(j);
      throw new PrecisionExhaustedException(j, workingBits);
    }

    // β_{j+1} = σ_{j, j+1} / h_j
    sigmaCurr[j + 1].div(h_curr, workingBits, beta);
    // γ_{j+1} = h_j / h_{j-1}
    h_curr.div(h_prev, workingBits, gamma);

    // σ_{j+1, k} = σ_{j, k+1} − β_{j+1}·σ_{j, k} − γ_{j+1}·σ_{j-1, k}
    // Range: k must cover at least k = j+1 .. 2*(targetM) - j - 2 so that
    // future steps still have the entries they need. Using k = j+1 .. len-2
    // is safe (and σ_{j+1, k} for k > 2M-j-2 is just unused work).
    int kMax = len - 2;
    for (int k = j + 1; k <= kMax; k++)
    {
      sigmaPrev[k].mul(gamma, workingBits, tmp);           // γ_{j+1}·σ_{j-1, k}
      sigmaCurr[k].mul(beta,  workingBits, tmp2);          // β_{j+1}·σ_{j, k}
      sigmaCurr[k + 1].sub(tmp2, workingBits, sigmaNext[k]);
      sigmaNext[k].sub(tmp, workingBits, sigmaNext[k]);
    }

    // Q_{j+1}(z) = (z − β_{j+1})·Q_j(z) − γ_{j+1}·Q_{j-1}(z)
    threeTermInto(Qbuf, Qcurr, Qprev);
    // P_{j+1}(z) = (z − β_{j+1})·P_j(z) − γ_{j+1}·P_{j-1}(z)
    threeTermInto(Pbuf, Pcurr, Pprev);

    // Snapshot Q_{j+1}, P_{j+1} into the level caches.
    Q.add(new ComplexPolynomial().set(Qbuf));
    P.add(new ComplexPolynomial().set(Pbuf));

    // Rotate σ rows by reference swap (no allocation, no copy).
    Complex[] sTmp = sigmaPrev;
    sigmaPrev      = sigmaCurr;
    sigmaCurr      = sigmaNext;
    sigmaNext      = sTmp;

    // Rotate Q triple: (Qprev, Qcurr) ← (Qcurr, Qbuf); old Qprev → new Qbuf
    ComplexPolynomial pTmp = Qprev;
    Qprev = Qcurr;
    Qcurr = Qbuf;
    Qbuf  = pTmp;
    // Same for P
    pTmp  = Pprev;
    Pprev = Pcurr;
    Pcurr = Pbuf;
    Pbuf  = pTmp;

    // h_{j-1} ← h_j for the next step
    h_prev.set(h_curr);

    currentOrder = j + 1;
  }

  /**
   * Compute {@code out ← (z − β)·curr − γ·prev} where β = {@link #beta},
   * γ = {@link #gamma}. Aliasing-safe: {@code out} must not alias
   * {@code curr} or {@code prev}.
   */
  private void threeTermInto(ComplexPolynomial out,
                             ComplexPolynomial curr,
                             ComplexPolynomial prev)
  {
    // out = z · curr           (shiftLeft by 1)
    curr.shiftLeft(1, out);
    // out -= β · curr
    // curr.mul(beta, …) gives β·curr; use Qbuf-class scratch via a temp poly?
    // Simpler: do it coefficient-wise by hand.
    int n = curr.getLength();
    for (int i = 0; i < n; i++)
    {
      curr.get(i).mul(beta, workingBits, tmp);
      out.get(i).sub(tmp, workingBits, out.get(i));
    }
    // out -= γ · prev
    int m = prev.getLength();
    if (m > 0)
    {
      if (out.getLength() < m)
      {
        out.fitLength(m);
        out.setLength(m);
      }
      for (int i = 0; i < m; i++)
      {
        prev.get(i).mul(gamma, workingBits, tmp);
        out.get(i).sub(tmp, workingBits, out.get(i));
      }
    }
  }

  /**
   * Pack reverse-monic coefficients of {@code Qm} (a monic degree-M
   * polynomial) into {@code result}: result.get(k) = Qm.get(M-1-k) for
   * k = 0..M-1. Result has degree M-1 (length M).
   */
  private ComplexPolynomial reverseMonicCoefficients(ComplexPolynomial Qm,
                                                    int M,
                                                    ComplexPolynomial result)
  {
    if (M == 0)
    {
      // Φden(0) = 1 (empty sum). Return a length-0 polynomial; the consumer
      // expression sums j=1..0 which is empty.
      result.fitLength(0);
      result.setLength(0);
      return result;
    }
    result.fitLength(M);
    result.setLength(M);
    for (int k = 0; k < M; k++)
    {
      result.get(k).set(Qm.get(M - 1 - k));
    }
    return result;
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

    if (sigmaPrev != null)
    {
      for (Complex c : sigmaPrev) c.close();
      for (Complex c : sigmaCurr) c.close();
      for (Complex c : sigmaNext) c.close();
    }
    if (Qprev != null) Qprev.close();
    if (Qcurr != null) Qcurr.close();
    if (Qbuf  != null) Qbuf.close();
    if (Pprev != null) Pprev.close();
    if (Pcurr != null) Pcurr.close();
    if (Pbuf  != null) Pbuf.close();
    for (ComplexPolynomial p : Q) p.close();
    for (ComplexPolynomial p : P) p.close();

    h_prev.close();
    h_curr.close();
    beta.close();
    gamma.close();
    tmp.close();
    tmp2.close();
    z.close();
    v.close();

    if (ΦBound != null) ΦBound.close();
    if (Φ != null) Φ.close();
    if (context != null) context.close();
  }
}
