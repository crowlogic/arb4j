package arb.functions.complex;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexFunctionalSequence;
import arb.functions.integer.ComplexFunctionalSequenceSequence;
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
 * <p>
 * <b>Architectural invariant 1 — the engine operates on polynomials then
 * freezes at v.</b><br>
 * Every instance of this class receives a polynomial sequence
 * {@code k ↦ aₖ(v) ∈ ℂ[v]}. The Chebyshev/Wheeler σ-table builds the Jacobi
 * entries {@code α(n)(v)}, {@code β(n)(v)}, {@code h(n)(v)} as polynomials in
 * {@code v}; evaluating them at the frozen perturbation point {@code v} yields
 * the scalar Padé coefficients. No polynomial variable survives into the
 * assembled rational approximant {@code Φ(z)} — the output is a
 * scalar-coefficient rational function of {@code z = t^α}.
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
  public final Context                                       context;
  private final Complex                                      z = new Complex();   // scratch t^α
  public final OrthogonalPolynomialMomentFunctionalSequence ops;
  private final ComplexFunctionSequence                      Φ;
  private final ComplexPolynomialSequence                    ΦdenSeq;
  private final ComplexPolynomialSequence                    ΦnumSeq;
  private final ComplexPolynomialSequence                    PnSeq;
  private final ComplexSequence                              αvSeq;
  private final ComplexSequence                              βvSeq;
  private final ComplexSequence                              hvSeq;
  private final ComplexFunctionalSequence                    KnSeq;
  private final ComplexFunctionalSequence                    CDnSeq;
  private boolean closed;

  public ComplexPolynomialSequence Φden()
  {
    return ΦdenSeq;
  }

  public ComplexPolynomialSequence Φnum()
  {
    return ΦnumSeq;
  }

  public ComplexPolynomialSequence Pn()
  {
    return PnSeq;
  }

  public ComplexSequence αv()
  {
    return αvSeq;
  }

  public ComplexSequence βv()
  {
    return βvSeq;
  }

  public ComplexSequence hv()
  {
    return hvSeq;
  }

  public ComplexFunctionalSequence Kn()
  {
    return KnSeq;
  }

  public ComplexFunctionalSequence CDn()
  {
    return CDnSeq;
  }

  public ComplexFunctionSequence Φ()
  {
    return Φ;
  }

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

    // m(k) = a(k+1): 1-shift (caller's a is 1-indexed, OPS is 0-indexed).
    // Each a(k) is a ComplexPolynomial in v; m passes them directly to the OPS
    // σ-table, which builds α(j), β(j), h(j) as polynomials in v.
    ComplexPolynomialSequence m = ComplexPolynomialSequence.express("m:k➔a(k+1)", context);

    // OPS owns σ, h, α, β, the recurrence-coefficient sequences A/B/C, and the
    // orthogonal-polynomial Q (its parent's P field, accessed via ops.evaluate).
    this.ops = new OrthogonalPolynomialMomentFunctionalSequence(context, m);

    // Scalar versions of α, β, h evaluated at v — these are what the Padé
    // assembly needs (poly-in-z with Complex coefficients, not poly-in-u).
    this.αvSeq = ComplexSequence.express("αv", "αv:n➔α(n)(v)", context);
    this.βvSeq = ComplexSequence.express("βv", "βv:n➔β(n)(v)", context);
    this.hvSeq = ComplexSequence.express("hv", "hv:n➔h(n)(v)", context);

    // Alias the OPS instance under "Q" so Φden can reference Q(M)[M-j].
    context.registerSequence("Q", ops);

    // Padé numerator (associated polynomial of the second kind) — same Favard
    // 3-term recurrence as Q with seed Pn_0=0, Pn_1=hv(0).
    ComplexPolynomialSequence.declare("Pn", context);
    this.PnSeq = ComplexPolynomialSequence.express("Pn",
        "Pn:n➔when(n=0, 0, n=1, hv(0), else, (z-αv(n-1))*Pn(n-1)-βv(n-1)*Pn(n-2))",
        context);

    this.ΦdenSeq = ComplexPolynomialSequence.express("Φden:M➔sum(j➔Q(M)[M-j]*z^j{j=1..M})+1", context);
    // Φnum mirrors Φden's reverse-coefficient form: coefficient j of Pn(M)
    // multiplies z^(M-j), so summing in that order gives the Müntz-Padé
    // numerator with the correct leading-order behaviour. The standard
    // [3/2] Padé of tanh comes out as (z + z³/15)/(1 + 2z²/5) at M=3
    // straight from this assembly.
    this.ΦnumSeq = ComplexPolynomialSequence.express("Φnum:M➔sum(j➔Pn(M)[M-j]*z^j{j=1..M})",   context);
    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);

    // Christoffel–Darboux reproducing kernel K_n(z,w) = Σ_{k=0}^{n} Q_k(z)·Q_k(w)/h_k
    // over the OPS already built above (Q(k) gives Q_k, hv(k) gives h_k). Registered
    // as a compiled Context sequence so the RKHS test (issues #1181/#1182) can
    // verify K_n(z,w) ≡ K_n(w,w) and the support-point agreement with Φ_den's roots.
    // Needs only the registered z/w variables and the existing Q, hv sequences.
    this.KnSeq = ComplexFunctionalSequence.express("Kn:n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})", context);
    // CD_n(z,w) is the confluent Christoffel–Darboux kernel; over this OPS it
    // coincides with K_n(z,w), which the RKHS test (issues #1181/#1182) verifies
    // via K_n(z,w) ≡ CD_n(z,w). Registered under the same body the test expects.
    this.CDnSeq = ComplexFunctionalSequence.express("CDn:n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})", context);
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    if (closed) throw new IllegalStateException("closed");

    // The index-keyed sequence caches are precision-blind: an entry built at
    // N bits is accurate to N bits and no further, so a request for more bits
    // must rebuild them. Fewer-or-equal bits reuse the cache as-is (and reuse
    // freely across different t at the same precision).
    //
    // A freshly-constructed approximant has EMPTY caches, so there is nothing
    // to invalidate on its first evaluation — and invalidating would needlessly
    // recurse through any shared upstream self-recursive sequence (e.g. the
    // Riccati Müntz coefficient sequence a), whose per-level instance chain can
    // be arbitrarily deep. Only a genuine precision INCREASE on an
    // already-populated cache must rebuild.
    if (cachedBits < 0)
    {
      cachedBits = bits;
    }
    else if (bits > cachedBits)
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
          Integer M         = new Integer() )
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
      // Unbounded by design: the diff descends monotonically to that floor
      // then stops shrinking, so one exit below always fires at finite M.
      for (int m = 3;; m++)
      {
        M.set(m);
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
          // Diff stopped shrinking: we hit the precision floor. The previous
          // iterate is closest to the limit — return it, stopping before the
          // h(j)→0 division a few M further on.
          return result.set(best);
        }
        prev.set(curr);
      }
    }
  }

  /**
   * Rebind this approximant to a new perturbation point {@code v} (and working
   * precision) without recompiling. The perturbation point enters the assembled
   * sequences only through the runtime variable {@code v} registered in
   * {@link #context}, so the generated σ-table / Jacobi / Padé classes are
   * identical across {@code v}. Mutating the registered {@code v} and dropping
   * the numeric caches that read it yields the approximant for the new point
   * while reusing every compiled class — which is what lets a
   * {@link MuntzPadeFunctional} evaluate across a sweep of perturbation points
   * without regenerating (and JIT-compiling) bytecode per point.
   *
   * @return this
   */
  public MuntzPadeApproximant rebind(Complex v, int bits)
  {
    if (closed) throw new IllegalStateException("closed");
    this.v.set(v);
    // Drop only the caches that depend on v. The σ-table (ops/Q), the Müntz
    // coefficient sequence a, and m are functions of the polynomial variable
    // alone — independent of the perturbation point — so they are computed once
    // and reused across the whole v sweep. Their cache (~60% of the per-build
    // native allocation) survives; only the v-dependent αv/βv/hv → Pn → Φnum/Φ
    // (and Φden) caches are cleared, via the non-propagating invalidateLocalCache
    // so clearing a consumer does not cascade into its v-independent producers.
    for (String name : V_DEPENDENT_CACHES)
    {
      var mapping = context.getFunctionMapping(name);
      if (mapping != null && mapping.instance != null)
      {
        mapping.instance.invalidateLocalCache();
      }
    }
    // Leave cachedBits untouched: it records the precision at which the
    // surviving v-independent caches (σ-table, Müntz a, m) still hold. Resetting
    // it to -1 would make evaluate's `cachedBits < 0` branch silently adopt a
    // higher requested precision without rebuilding those caches, returning a
    // stale lower-precision result. Keeping it lets `bits > cachedBits` fire a
    // full invalidation when a precision increase actually needs one.
    return this;
  }

  private static final String[] V_DEPENDENT_CACHES =
  { "αv", "βv", "hv", "Pn", "Φden", "Φnum", "Φ" };

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
