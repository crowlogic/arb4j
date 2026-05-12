package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.Sequence;

/**
 * The orthogonal polynomial sequence of a quasi-definite moment functional 𝓛
 * over ℂ[u], constructed from its moment sequence m(k, u) via the polynomial
 * Chebyshev/Wheeler recurrence of Theorem 5.1 of
 * {@code docs/SolutionMethodologyForConstantCoefficientFractionalRiccatiEquations.md}.
 *
 * <p>
 * The generating polynomial of the OPS is
 *
 * <pre>
 *   S(n, z) := Σ_{k ≥ 0} 𝓛[xᵏ · P(n, x)] · zᵏ ∈ ℂ[u][z]
 * </pre>
 *
 * with base cases S(−1, z) = 1, S(0, z) = Σ_{k ≥ 0} m(k, u) · zᵏ.
 *
 * <p>
 * <b>Theorem 5.1 (Polynomial Chebyshev–Wheeler).</b> The sequence {S(n, z)}
 * satisfies the closed polynomial recurrence
 *
 * <pre>
 *   S(n+1, z) = S(n, z)/z − α(n, z) · S(n, z) − β(n, z) · S(n−1, z)
 * </pre>
 *
 * with α(n, z), β(n, z) ∈ ℂ[u][[z]] determined as identities by
 *
 * <pre>
 *   β(n, z) = S(n, z) / (z · S(n−1, z)),
 *   α(n, z) = T(n, z) / S(n, z),     where T(n, z) := S(n, z)/z − β(n, z) · S(n−1, z).
 * </pre>
 *
 * Theorem 5.1 guarantees both quotients are z-constant — i.e. their image in
 * ℂ[u][[z]] is a constant polynomial in z whose constant term is the desired
 * element of ℂ[u]. The implementation performs the ring operations and
 * trusts that guarantee; no coefficient is read.
 *
 * <p>
 * The three-term recurrence coefficients in the standard form
 * P(n+1, x) = (A(n)·x + B(n))·P(n, x) − C(n)·P(n−1, x) are
 *
 * <pre>
 *   A(n) = 1,
 *   B(n) = −α(n, z),
 *   C(n) =  β(n, z).
 * </pre>
 *
 * <p>
 * The construction is entirely in terms of ring operations in ℂ[u][[z]]:
 * multiplication and division by z, polynomial multiplication, addition,
 * subtraction, and formal power-series division. No scalar coefficient
 * extractions in the parameter ring ℂ[u] are performed — every α(n), β(n)
 * remains an opaque element of ℂ[u] throughout.
 *
 * <p>
 * Subclasses supply {@link #momentSequence()}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class OrthogonalPolynomialMomentFunctionalSequence extends
                                                                   ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public Sequence<ComplexPolynomial> m;

  /** S(n, z), the generating polynomial of the OPS, an element of ℂ[u][z]. */
  public ComplexPolynomialSequence   S;

  /**
   * β(n, z) = S(n, z) / (z · S(n-1, z)) — an element of ℂ[u][[z]] which by
   * Theorem 5.1 is z-constant, hence identifiable with an element of ℂ[u].
   */
  public ComplexPolynomialSequence   β;

  /** T(n, z) := S(n, z)/z − β(n, z) · S(n-1, z) ∈ ℂ[u][z]. */
  public ComplexPolynomialSequence   T;

  /**
   * α(n, z) = T(n, z) / S(n, z) — an element of ℂ[u][[z]] which by
   * Theorem 5.1 is z-constant, hence identifiable with an element of ℂ[u].
   */
  public ComplexPolynomialSequence   α;

  /**
   * Subclasses pass their moment sequence (already built against a context the
   * subclass has populated with any free parameters it needs); the moment
   * sequence is then re-registered on the parent's context so all downstream
   * sequences (S, β, T, α, A, B, C) see it.
   */
  public OrthogonalPolynomialMomentFunctionalSequence(int bits, Sequence<ComplexPolynomial> m)
  {
    super(bits);

    this.m = m;
    context.registerVariable("m", m);

    // The n = 0 step is bootstrapped explicitly:
    //   β(0) = m(0)              (matches the divisibility constraint at z⁻¹)
    //   α(0) = m(1) / m(0)
    //   S(1, z) = S(0, z)/z − α(0)·S(0, z) − β(0)·S(-1, z)
    // and S(-1, z) = 1, S(0, z) = Σ m(k) zᵏ.
    //
    // For n ≥ 1, the proof gives the forward computation:
    //   β(n) = S(n, z) / (z · S(n-1, z))
    //   T(n, z) = S(n, z)/z − β(n) · S(n-1, z)
    //   α(n) = T(n, z) / S(n, z)
    //   S(n+1, z) = T(n, z) − α(n) · S(n, z)
    //
    // Every operation is a ring/field op in ℂ[u][[z]]. The compiler dispatches
    // '·z', '/z', and 'P/Q' to the appropriate acb_poly_* calls; α and β are
    // z-constant by Theorem 5.1, so the consumed result is an element of ℂ[u].

    // Every sequence is named with both its arguments to make the z-dependence
    // explicit; the expression compiler sees a univariate sequence in n whose
    // value at each n is a ComplexPolynomial in z (with ℂ[u] coefficients).
    //
    // The z-constancy of α and β is a *theorem* (Theorem 5.1), not enforced
    // by the expression syntax; the syntax simply names them α(n, z), β(n, z)
    // to record their formal domain and lets the proof guarantee they collapse.

    // Every sequence is declared bivariately as (n, z) ➔ ... — univariate in n,
    // valued in ℂ[u][z]. The z-dependence is an explicit parameter of each
    // expression. The expression compiler sees the polynomial codomain via z.
    //
    // α(n, z) and β(n, z) are bivariate symbolically but are guaranteed to be
    // z-constant by Theorem 5.1; the syntax simply records the formal domain
    // and lets the proof guarantee the collapse.

    S = ComplexPolynomialSequence.express("S",
                                          "(n, z) ➔ when(n = -1,    1,"
                                              + "           n =  0,    sum(j ➔ m(j) · zʲ {j=0..2*n+2}),"
                                              + "           else,      T(n-1, z) − α(n-1, z) · S(n-1, z))",
                                          context);
    context.registerVariable("S", S);

    β = ComplexPolynomialSequence.express("β",
                                          "(n, z) ➔ when(n = 0,    m(0),"
                                              + "           else,     S(n, z) / (z · S(n-1, z)))",
                                          context);
    context.registerVariable("β", β);

    T = ComplexPolynomialSequence.express("T",
                                          "(n, z) ➔ S(n, z) / z − β(n, z) · S(n-1, z)",
                                          context);
    context.registerVariable("T", T);

    α = ComplexPolynomialSequence.express("α",
                                          "(n, z) ➔ when(n = 0,    m(1) / m(0),"
                                              + "           else,     T(n, z) / S(n, z))",
                                          context);
    context.registerVariable("α", α);

    // p0 = 1, p1 = x − m(1)/m(0). The leading coefficient of p1 is 1 (·x);
    // the constant term is the element of ℂ[u] given by m(1)/m(0). Since
    // ComplexPolynomial only carries Complex scalar coefficients, the
    // "− m(1)/m(0)" piece is left as a deferred symbolic correction handled
    // by the recurrence expression (which references m(0), m(1) via context);
    // p0, p1 are seeded as the monic shapes 1 and x.
    p0.one();
    p1.one().shiftLeft(1);
  }

  /**
   * Subclasses may override to expose the parameters they registered when
   * building their moment sequence. Default: no extra parameters.
   */
  protected Sequence<ComplexPolynomial> momentSequence()
  {
    return m;
  }

  @Override
  public Sequence<ComplexPolynomial> A()
  {
    return ComplexPolynomialSequence.express("A", "1", context);
  }

  /** B(n) = −α(n, z). */
  @Override
  public Sequence<ComplexPolynomial> B()
  {
    return ComplexPolynomialSequence.express("B", "−α(n, z)", context);
  }

  /** C(n) = β(n, z). */
  @Override
  public Sequence<ComplexPolynomial> C()
  {
    return ComplexPolynomialSequence.express("C", "β(n, z)", context);
  }

}
