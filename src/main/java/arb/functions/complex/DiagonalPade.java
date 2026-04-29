package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
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
 * Singular Hankel solves are signaled by the sentinel pair (P, Q) = (∞, ∞) —
 * both polynomials of length 1 with their constant term set to positive
 * infinity. Callers test {@link #isSingularSentinel}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class DiagonalPade implements
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
   * polynomials start zero-length; the producer (typically a Hankel solve) fills
   * them via {@link #set}.
   */
  public DiagonalPade(int M)
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

  // ── Producer-side mutation; fluent return of `this` ───────────────────────

  /**
   * Mark this pair as the singular-Hankel sentinel: both polynomials become
   * length-1 with constant term +∞.
   */
  public DiagonalPade markSingular()
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
   * @return true iff P[0] = +∞ — set by {@link #markSingular} or by a downstream
   *         Hankel solver that detected a singular system.
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
