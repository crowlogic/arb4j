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
 * <b>The tower.</b> The construction lives in ℂ[u][[z]] — the ring of formal
 * power series in z whose coefficients are polynomials in the Fourier
 * parameter u. Every object is a sum
 *
 * <pre>
 *   S(n, z) := Σ_{k ≥ 0} c(n, k, u) · zᵏ ∈ ℂ[u][z]
 * </pre>
 *
 * where z is the outer time-series variable (z = t^μ after the Müntz
 * substitution) and each coefficient c(n, k, u) ∈ ℂ[u]. At the arb4j level
 * this is realized as a ComplexPolynomial-in-z whose coefficients are
 * themselves ComplexPolynomial-in-u — that is, the parent class is generic
 * over the recurrence-coefficient ring R = ComplexPolynomial.
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
 * Theorem 5.1 guarantees both quotients are z-constant — their image in
 * ℂ[u][[z]] is a constant polynomial in z whose constant term is the desired
 * element of ℂ[u]. The implementation performs the ring operations and trusts
 * that guarantee; no coefficient is read.
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
 * Every operation is a ring or field operation at the outer-z level —
 * multiplication and division by z, polynomial multiplication, addition,
 * subtraction, and formal power-series division. The inner u-level is carried
 * automatically by the existing ComplexPolynomial ring operations on those
 * coefficients. No scalar coefficient extractions in the parameter ring ℂ[u]
 * are performed.
 *
 * <p>
 * Subclasses supply the moment sequence m : ℤ_{≥0} → ℂ[u].
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class OrthogonalPolynomialMomentFunctionalSequence extends
                                                                   ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  /** The moment sequence k ↦ m(k, u), each term a polynomial in u. */
  public Sequence<ComplexPolynomial> m;

  /** S(n, z), the generating polynomial of the OPS, valued in ℂ[u][z]. */
  public ComplexPolynomialSequence   S;

  /**
   * β(n, z) = S(n, z) / (z · S(n-1, z)) — formally in ℂ[u][[z]]; z-constant
   * by Theorem 5.1.
   */
  public ComplexPolynomialSequence   β;

  /** T(n, z) := S(n, z)/z − β(n, z) · S(n-1, z) ∈ ℂ[u][z]. */
  public ComplexPolynomialSequence   T;

  /**
   * α(n, z) = T(n, z) / S(n, z) — formally in ℂ[u][[z]]; z-constant by
   * Theorem 5.1.
   */
  public ComplexPolynomialSequence   α;

  public OrthogonalPolynomialMomentFunctionalSequence(int bits, Sequence<ComplexPolynomial> m)
  {
    super(bits);

    this.m = m;

    // Bind m as a function in the context so the parser resolves m(k) as a
    // sequence call returning a ComplexPolynomial in u. Declare the four
    // mutually-recursive sequences S, β, T, α so their cross-references
    // resolve at compile time. Each is curried n ➔ z ➔ ... — outer integer
    // index n, inner polynomial variable z; the body produces a polynomial
    // in u at each z-sample, and arb4j packages the result as a polynomial
    // in z whose coefficients are polynomials in u (the tower).
    context.registerFunction("m", m);
    ComplexPolynomialSequence.declare("S", context);
    ComplexPolynomialSequence.declare("β", context);
    ComplexPolynomialSequence.declare("T", context);
    ComplexPolynomialSequence.declare("α", context);

    // S has two base cases (n=0 and n=1) so the n=-1 boundary never enters the
    // runtime sequence. The proof's n=0 step (which uses S(-1,z)=1,
    // α(0)=m(1)/m(0), β(0)=m(0)) is inlined into the closed form for S(1, z):
    //   S(1, z) = S(0, z)/z − (m(1)/m(0)) · S(0, z) − m(0)
    // For n≥2 the general recurrence applies: S(n) needs S(n-1) and S(n-2),
    // via T(n-1) and α(n-1).
    S = ComplexPolynomialSequence.express("S:n ➔ z ➔ when(n = 0,  sum(j ➔ m(j)(z) · z^j {j=0..2*n+2}),"
                                              + "                n = 1,  S(0)(z) / z − (m(1)(z) / m(0)(z)) · S(0)(z) − m(0)(z),"
                                              + "                else,   T(n-1)(z) − α(n-1)(z) · S(n-1)(z))",
                                          context);

    β = ComplexPolynomialSequence.express("β:n ➔ z ➔ S(n)(z) / (z · S(n-1)(z))",
                                          context);

    T = ComplexPolynomialSequence.express("T:n ➔ z ➔ S(n)(z) / z − β(n)(z) · S(n-1)(z)",
                                          context);

    α = ComplexPolynomialSequence.express("α:n ➔ z ➔ T(n)(z) / S(n)(z)",
                                          context);

    // p0 = 1, p1 = x − m(1)/m(0).
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
    return ComplexPolynomialSequence.express("B:n ➔ z ➔ −α(n)(z)", context);
  }

  /** C(n) = β(n, z). */
  @Override
  public Sequence<ComplexPolynomial> C()
  {
    return ComplexPolynomialSequence.express("C:n ➔ z ➔ β(n)(z)", context);
  }

}
