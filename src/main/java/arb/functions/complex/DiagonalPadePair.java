package arb.functions.complex;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * The diagonal (M, M) Padé pair (P_M, Q_M) and the rational function
 *
 * <pre>
 *   R_M(z) = P_M(z) / Q_M(z),     deg P_M ≤ M,  deg Q_M = M,  Q_M(0) = 1.
 * </pre>
 *
 * <p>
 * Holds the two coefficient polynomials as owned native allocations, exposes
 * the rational evaluation directly via {@link #evaluate}, and lazily compiles
 * the symbolic expression z ↦ P(z)/Q(z) the first time {@link #asFunction} is
 * called. The compiled function is cached on the pair for the pair's lifetime;
 * the optional parent {@link Context} supplied at construction has its
 * variables imported into a private sub-Context so user-supplied free variables
 * (e.g. v, μ in the Riccati–Mittag-Leffler setting) continue to resolve when
 * the rational function is evaluated.
 *
 * <p>
 * An indefinite moment functional (equivalently a singular Hankel system, or
 * an h_j that contains zero in the Chebyshev recurrence) is signaled by the
 * sentinel pair (P, Q) = (∞, ∞) — both polynomials of length 1 with their
 * constant term set to positive infinity. Callers test
 * {@link #isSingularSentinel}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class DiagonalPadePair implements
                                ComplexFunction,
                                AutoCloseable
{
  /** Padé order — the common degree bound on P and Q. */
  public final int               M;

  /** Numerator polynomial. */
  public final ComplexPolynomial P;

  /** Denominator polynomial. */
  public final ComplexPolynomial Q;


  /**
   * Allocate a (P, Q) pair of Padé order M with capacity M+1 each. The parent
   * Context is optional; pass null to start with an empty sub-Context. The
   * polynomials start zero-length; the producer (typically a Chebyshev
   * recurrence in {@link MuntzPadeApproximant}, or any equivalent solver of
   * the diagonal Padé normal equations) fills them via {@link #set}.
   */
  public DiagonalPadePair(int M)
  {
    if (M < 0)
    {
      throw new IllegalArgumentException("Padé order M must be ≥ 0, got " + M);
    }
    this.M      = M;
    this.P      = new ComplexPolynomial();
    this.Q      = new ComplexPolynomial();
    this.P.fitLength(Math.max(1, M + 1));
    this.Q.fitLength(Math.max(1, M + 1));
  }

  /**
   * Solve the diagonal Padé normal equations directly from Maclaurin
   * coefficients: given the formal series g(z) = Σ_k c_k z^k (supplied as a
   * {@link ComplexPolynomial} carrying the Taylor data c_0 … c_{2M};
   * coefficients beyond the polynomial's degree are read as zero), construct
   * the unique pair (P_M, Q_M) with deg P_M ≤ M, deg Q_M ≤ M, Q_M(0) = 1 and
   *
   * <pre>
   *   Q_M(z)·g(z) − P_M(z) = O(z^{2M+1})
   * </pre>
   *
   * The denominator coefficients q_1 … q_M solve the M×M Hankel system
   *
   * <pre>
   *   Σ_{j=1..M} q_j·c_{M+i−j} = −c_{M+i},   i = 1..M,
   * </pre>
   *
   * and the numerator is the order-M truncation P_i = Σ_{j=0..min(i,M)}
   * q_j·c_{i−j}. When the Hankel system is singular (an indefinite moment
   * functional at order M) the returned pair carries the sentinel described in
   * {@link #isSingularSentinel}.
   *
   * <p>
   * By Stahl's convergence theorem — see the theorem "Analytic Continuation
   * via Diagonal Padé Sequence in Capacity" and
   * {@code docs/TheRiemannHilbertViewOfPadeApproximationAndGlobalAnalyticContinuation.tex}
   * — the resulting sequence [M/M]_g = P_M/Q_M converges in capacity to g on
   * compact subsets of D* = ℂ ∖ K*, where K* is the minimal-capacity compact
   * carrying the branch cuts of g. The sequence therefore analytically
   * continues g strictly past the local radius of convergence ρ₀ of the
   * series, with the continuous blow-up along K* mapped to the discrete roots
   * of Q_M condensing on the equilibrium measure of K*.
   * {@code PadeAnalyticContinuationInCapacityTest} exhibits this on
   * g(z) = log(1+z).
   *
   * @param g    the Maclaurin coefficients c_0 … c_{2M} of the series
   * @param M    the diagonal Padé order
   * @param bits working precision
   * @return the freshly allocated (P_M, Q_M) pair — owned by the caller
   */
  public static DiagonalPadePair fromMaclaurinSeries(ComplexPolynomial g, int M, int bits)
  {
    DiagonalPadePair pair = new DiagonalPadePair(M);
    int              deg  = g.degree();
    if (M == 0)
    {
      pair.P.setLength(1);
      pair.P.get(0).set(deg >= 0 ? g.get(0) : ComplexConstants.zero);
      pair.Q.setLength(1);
      pair.Q.get(0).one();
      return pair;
    }
    try ( ComplexMatrix A = ComplexMatrix.newMatrix(M, M);
          ComplexMatrix rhs = ComplexMatrix.newMatrix(M, 1);
          ComplexMatrix qsol = ComplexMatrix.newMatrix(M, 1);
          Complex neg = new Complex();
          Complex acc = new Complex();
          Complex term = new Complex())
    {
      for (int i = 1; i <= M; i++)
      {
        for (int j = 1; j <= M; j++)
        {
          int idx = M + i - j;
          A.set(i - 1, j - 1, idx <= deg ? g.get(idx) : ComplexConstants.zero);
        }
        int idx = M + i;
        (idx <= deg ? g.get(idx) : ComplexConstants.zero).neg(neg);
        rhs.set(i - 1, 0, neg);
      }
      if (arblib.acb_mat_solve(qsol, A, rhs, bits) == 0)
      {
        return pair.markSingular();
      }
      pair.Q.setLength(M + 1);
      pair.Q.get(0).one();
      for (int j = 1; j <= M; j++)
      {
        pair.Q.get(j).set(qsol.get(j - 1, 0));
      }
      pair.P.setLength(M + 1);
      for (int i = 0; i <= M; i++)
      {
        acc.zero();
        for (int j = 0; j <= i; j++)
        {
          int idx = i - j;
          pair.Q.get(j).mul(idx <= deg ? g.get(idx) : ComplexConstants.zero, bits, term);
          acc.add(term, bits, acc);
        }
        pair.P.get(i).set(acc);
      }
    }
    return pair;
  }

  // ── Producer-side mutation; fluent return of `this` ───────────────────────

  /**
   * Mark this pair as the singular-moment-functional sentinel (equivalently
   * a singular Hankel system at order M): both polynomials become length-1
   * with constant term +∞.
   */
  public DiagonalPadePair markSingular()
  {
    P.fitLength(1);
    P.setLength(1);
    P.get(0).posInf();
    Q.fitLength(1);
    Q.setLength(1);
    Q.get(0).posInf();
    return this;
  }

  /**
   * @return true iff P[0] = +∞ — set by {@link #markSingular} or by a
   *         downstream solver that detected an indefinite moment functional
   *         (equivalently a singular Hankel system) at order M.
   */
  public boolean isSingularSentinel()
  {
    return P.getLength() == 1 && !P.get(0).isFinite();
  }


  // ── ComplexFunction.evaluate (the rational function R_M) ──────────────────

  /**
   * R_M(z) = P_M(z) / Q_M(z).
   */
  @Override
  public Complex evaluate(Complex z, int order, int bits, Complex result)
  {
    try ( var pz = result.borrowVariable(); var qz = result.borrowVariable())
    {
      P.evaluate(z, order, bits, pz);
      Q.evaluate(z, order, bits, qz);
      return pz.div(qz, bits, result);
    }
  }


  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @Override
  public void close()
  {
    P.close();
    Q.close();
    // subContext, if any, is closed by closing its registered functions —
    // P and Q are closed above. The Context itself holds no native handles.
  }
}
