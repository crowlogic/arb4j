package arb.functions.complex;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import arb.functions.polynomials.orthogonal.complex.OrthogonalPolynomialMomentFunctionalSequence;

/**
 * Adaptive Müntz–Padé approximant.
 *
 * <p>
 * Consumes
 * {@link OrthogonalPolynomialMomentFunctionalSequence} (#1031) for the
 * Chebyshev/Wheeler σ-table and the Jacobi sequences α, β, h. The Padé halves
 * Φden / Φnum and the assembled approximant Φ are then named expressions in
 * the same shared {@link Context}; the adaptive growth of M is the only Java
 * code path (the expression language has no fixed-point-over-predicate).
 *
 * @author Stephen Crowley ©2024–2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public final class MuntzPadeApproximant implements
                                         ComplexFunction,
                                         AutoCloseable
{

  public final Real                                          α;
  public final Complex                                       v;
  private final int                                          workingBits;
  private final Context                                      context;
  private final Complex                                      z = new Complex();   // scratch t^α
  private final OrthogonalPolynomialMomentFunctionalSequence ops;
  private final ComplexFunctionSequence                      Φ;

  private boolean closed;

  /**
   * Working precision (in bits) at which the memoized σ-table / Jacobi /
   * Padé sequences currently hold their values. The per-index caches
   * (Pn(M), Q(M), σ, h, α, β, …) are precision-blind — they store a single
   * polynomial per index — so a cache entry built at N bits is only good to
   * N bits. -1 means "nothing cached yet".
   */
  private int cachedBits = -1;

  public MuntzPadeApproximant(Real α, ComplexPolynomialSequence a, Complex v, int bits)
  {
    this.α           = α;
    this.v           = new Complex().set(v);
    this.workingBits = bits;
    this.context     = new Context();

    context.registerVariable(α);
    context.registerVariable("v", this.v);
    context.registerSequence("a", a);

    // m(k)(u) = a(k+1)(u). 1-shift: caller's a is 1-indexed, OPS is 0-indexed.
    ComplexPolynomialSequence m = ComplexPolynomialSequence.express("m:k➔u➔a(k+1)(u)", context);

    // OPS owns σ, h, α, β, the recurrence-coefficient sequences A/B/C, and the
    // orthogonal-polynomial Q (its parent's P field, accessed via ops.evaluate).
    this.ops = new OrthogonalPolynomialMomentFunctionalSequence(context, m);

    // Scalar versions of α, β, h evaluated at v — these are what the Padé
    // assembly needs (poly-in-z with Complex coefficients, not poly-in-u).
    ComplexSequence.express("αv", "αv:n➔α(n)(v)", context);
    ComplexSequence.express("βv", "βv:n➔β(n)(v)", context);
    ComplexSequence.express("hv", "hv:n➔h(n)(v)", context);

    // Alias the OPS instance under "Q" so Φden can reference Q(M)[M-j].
    context.registerSequence("Q", ops);

    // Padé numerator (associated polynomial of the second kind) — same Favard
    // 3-term recurrence as Q with seed Pn_0=0, Pn_1=hv(0).
    ComplexPolynomialSequence.declare("Pn", context);
    ComplexPolynomialSequence.express("Pn",
        "Pn:n➔when(n=0, 0, n=1, hv(0), else, (z-αv(n-1))*Pn(n-1)-βv(n-1)*Pn(n-2))",
        context);

    ComplexPolynomialSequence.express("Φden:M➔sum(j➔Q(M)[M-j]*z^j{j=1..M})+1", context);
    // Φnum mirrors Φden's reverse-coefficient form: coefficient j of Pn(M)
    // multiplies z^(M-j), so summing in that order gives the Müntz-Padé
    // numerator with the correct leading-order behaviour. The standard
    // [3/2] Padé of tanh comes out as (z + z³/15)/(1 + 2z²/5) at M=3
    // straight from this assembly.
    ComplexPolynomialSequence.express("Φnum:M➔sum(j➔Pn(M)[M-j]*z^j{j=1..M})",   context);
    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    if (closed) throw new IllegalStateException("closed");

    // The index-keyed sequence caches are precision-blind: an entry built at
    // N bits is accurate to N bits and no further, so a request for more bits
    // must rebuild them. Fewer-or-equal bits reuse the cache as-is (and reuse
    // freely across different t at the same precision).
    if (bits > cachedBits)
    {
      context.invalidateAllCaches();
      cachedBits = bits;
    }

    t.pow(α, bits, z);
    try ( Real    threshold = new Real();
          Real    diffMag   = new Real();
          Real    bestMag   = new Real();
          Complex prev      = new Complex();
          Complex curr      = new Complex();
          Complex best      = new Complex();
          Complex diff      = new Complex();
          Integer M         = new Integer();
          Integer hIdx      = new Integer();
          ComplexPolynomial hPoly = new ComplexPolynomial() )
    {
      // Half-precision target: bit-exact agreement at `bits` is unreachable
      // because the OPS h(j) underflows precision at some M*, so the
      // neighbour-diff floors above 2^-bits and then climbs as precision is
      // lost (eventually α=σ/h would divide by an arb-zero h(j)).
      threshold.one().mul2e(-bits / 2, threshold);
      bestMag.posInf();
      M.set(2);
      Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, prev);
      best.set(prev);
      // Unbounded by design: M grows until one of three exits fires at finite
      // M — convergence, the diff hitting its precision floor, or h(m-1)
      // underflowing so the next Padé would divide by an arb-zero.
      for (int m = 3;; m++)
      {
        M.set(m);
        // α(m-1)=σ(m-1)/h(m-1) is the highest-index division Φ(m) performs, and
        // acb_poly_divrem fails when the divisor's leading coefficient contains
        // zero. Detecting that underflow here returns the converged best instead
        // of provoking the throw one line down. h is a pure σ-table diagonal
        // lookup, so evaluating it divides by nothing and cannot itself throw.
        hIdx.set(m - 1);
        ops.h.evaluate(hIdx, 1, bits, hPoly);
        if (leadingCoefficientVanishes(hPoly))
        {
          return result.set(best);
        }
        Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, curr);
        curr.sub(prev, bits, diff).abs(bits, diffMag);
        if (diffMag.compareTo(threshold) <= 0)
        {
          return result.set(curr);
        }
        if (diffMag.compareTo(bestMag) < 0)
        {
          bestMag.set(diffMag);
          best.set(curr);
        }
        else
        {
          // Diff stopped shrinking: the precision floor is reached, so the
          // best-seen iterate is closest to the limit.
          return result.set(best);
        }
        prev.set(curr);
      }
    }
  }

  /**
   * Whether dividing by {@code divisor} would fail: true when it is the zero
   * polynomial or its leading coefficient ball contains zero — the exact
   * condition under which {@code acb_poly_divrem} returns 0 and the division
   * throws.
   */
  private static boolean leadingCoefficientVanishes(ComplexPolynomial divisor)
  {
    int length = divisor.getLength();
    if (length == 0)
    {
      return true;
    }
    Complex leadingCoefficient = divisor.get(length - 1);
    return leadingCoefficient == null || leadingCoefficient.containsZero();
  }

  @Override
  public void close()
  {
    if (closed) return;
    closed = true;
    z.close();
    v.close();
    if (Φ       != null) Φ.close();
    if (ops     != null) ops.close();
    if (context != null) context.close();
  }
}
