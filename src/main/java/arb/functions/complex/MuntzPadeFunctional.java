package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import arb.functions.polynomials.orthogonal.complex.OrthogonalPolynomialMomentFunctionalSequence;

/**
 * Müntz–Padé functional.
 *
 * <p>
 * Binds the external parameter v and returns the compiled Müntz–Padé
 * resolvent y(t) as a {@link ComplexFunction}. There is no hand-written
 * evaluator class: the resolvent is a single named expression whose
 * convergence over the Padé order is the expression compiler's built-in
 * {@code ∑…{k=3..∞}} convergent sum, telescoped over the diagonal Padé
 * iterates
 *
 * <pre>
 *   y(t) = Φ(2)(t^μ) + ∑ₖ₌₃^∞ ( Φ(k)(t^μ) − Φ(k−1)(t^μ) )
 * </pre>
 *
 * which terminates exactly when the summand magnitude reaches the 2^-bits
 * precision floor — the result is exact at the requested precision or the
 * evaluation has not converged (and the σ-table recurrence surfaces that as an
 * exception rather than returning a close-enough iterate).
 *
 * <p>
 * The supporting sequences — the Chebyshev/Wheeler σ-table and the Jacobi
 * sequences α, β, h from {@link OrthogonalPolynomialMomentFunctionalSequence}
 * (#1031), the Padé halves Φden / Φnum, and the assembled approximant Φ — are
 * all named expressions in the same shared {@link Context}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeFunctional implements
                                 ComplexFunctional,
                                 AutoCloseable
{

  public MuntzPadeFunctional()
  {
  }

  /**
   * Fractional exponent μ ∈ (0,1).
   */
  public Real                                                α;

  /**
   * Müntz coefficients: k ↦ a_k(v) as polynomials in v.
   */
  public ComplexPolynomialSequence                           a;

  protected String                                           name;

  /**
   * The expressions are compiled once and rebound to each new perturbation
   * point. The σ-table / Jacobi / Padé classes do not depend on v (only the
   * registered runtime variable does), so reconstructing them per point would
   * needlessly regenerate and JIT-compile a dozen expression classes — and leak
   * the previous one's classes into metaspace.
   */
  private Context                                            context;

  /**
   * The registered perturbation-point variable read by the compiled sequences.
   */
  private Complex                                            v;

  /**
   * OPS owns σ, h, α, β, the recurrence-coefficient sequences A/B/C, and the
   * orthogonal-polynomial Q (its parent's P field).
   */
  private OrthogonalPolynomialMomentFunctionalSequence       ops;

  /**
   * The compiled resolvent t ↦ y(t): the telescoped convergent sum over the
   * diagonal Padé iterates.
   */
  private ComplexFunction                                    y;

  /**
   * Working precision (in bits) at which the memoized σ-table / Jacobi / Padé
   * sequence caches currently hold their values. The per-index caches (Pn(M),
   * Q(M), σ, h, α, β, …) are precision-blind — they store a single value per
   * index — so a cache entry built at N bits is only good to N bits. -1 means
   * "nothing cached yet".
   */
  private int                                                cachedBits = -1;

  public MuntzPadeFunctional(Real α, ComplexPolynomialSequence a)
  {
    this.α = α;
    this.a = a;
  }

  public MuntzPadeFunctional(String name, Real α, ComplexPolynomialSequence a)
  {
    this(α, a);
    this.name = name;
  }

  @Override
  public ComplexFunction evaluate(Complex v, int order, int bits, ComplexFunction result)
  {
    if (y == null)
    {
      assemble(v);
      cachedBits = bits;
      return y;
    }

    boolean vChanged = !this.v.equals(v);
    if (vChanged)
    {
      this.v.set(v);
    }
    // The index-keyed sequence caches are precision-blind: an entry built at
    // N bits is accurate to N bits and no further, so a request for more bits
    // must rebuild them all. Fewer-or-equal bits reuse the cache as-is.
    if (bits > cachedBits)
    {
      context.invalidateAllCaches();
      cachedBits = bits;
    }
    else if (vChanged)
    {
      // Drop only the caches that depend on v. The σ-table (ops/Q), the Müntz
      // coefficient sequence a, and m are functions of the polynomial variable
      // alone — independent of the perturbation point — so they are computed
      // once and reused across the whole v sweep. Their cache (~60% of the
      // per-build native allocation) survives; only the v-dependent
      // αv/βv/hv → Pn → Φnum/Φ (and Φden, y) caches are cleared, via the
      // non-propagating invalidateLocalCache so clearing a consumer does not
      // cascade into its v-independent producers.
      for (String cacheName : V_DEPENDENT_CACHES)
      {
        var mapping = context.getFunctionMapping(cacheName);
        if (mapping != null && mapping.instance != null)
        {
          mapping.instance.invalidateLocalCache();
        }
      }
    }
    return y;
  }

  /**
   * Compile the shared-context sequence tower and the resolvent expression,
   * seeded at the perturbation point {@code v0}. Runs once; every later
   * {@link #evaluate} rebinds the registered {@code v} variable instead of
   * recompiling.
   */
  private void assemble(Complex v0)
  {
    context = new Context();
    v       = new Complex().set(v0);

    context.registerVariable("μ", α);
    context.registerVariable("v", v);
    context.registerSequence("a", a);

    // m(k)(u) = a(k+1)(u). 1-shift: caller's a is 1-indexed, OPS is 0-indexed.
    ComplexPolynomialSequence m = ComplexPolynomialSequence.express("m:k➔u➔a(k+1)(u)", context);

    ops = new OrthogonalPolynomialMomentFunctionalSequence(context, m);

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
    ComplexPolynomialSequence.express("Φnum:M➔sum(j➔Pn(M)[M-j]*z^j{j=1..M})", context);
    ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);

    // The resolvent: the diagonal Padé iterates Φ(k)(t^μ) telescoped into the
    // compiler's built-in convergent sum, which terminates exactly when the
    // summand |Φ(k)(t^μ) − Φ(k−1)(t^μ)| reaches the 2^-bits precision floor.
    y = ComplexFunction.express("y", "y:t➔Φ(2)(t^μ)+∑k➔(Φ(k)(t^μ)-Φ(k-1)(t^μ)){k=3..∞}", context);
  }

  /**
   * Drop the caches and propagate to the Müntz coefficient sequence, so a
   * parameter refresh (e.g. {@code RiccatiMuntzPadeFunctional} updating p, q,
   * r) can never surface a stale value on the next evaluate.
   */
  private boolean invalidatingCache;

  @Override
  public void invalidateCache()
  {
    if (invalidatingCache)
    {
      return;
    }
    invalidatingCache = true;
    if (context != null)
    {
      context.invalidateAllCaches();
    }
    cachedBits = -1;
    if (a != null)
    {
      a.invalidateCache();
    }
    invalidatingCache = false;
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    if (v != null)
    {
      v.close();
      v = null;
    }
    if (y != null)
    {
      y.close();
      y = null;
    }
    if (ops != null)
    {
      ops.close();
      ops = null;
    }
    if (context != null)
    {
      context.close();
      context = null;
    }
  }

  private static final String[] V_DEPENDENT_CACHES =
  { "αv", "βv", "hv", "Pn", "Φden", "Φnum", "Φ", "y" };
}
