package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.Sequence;

/**
 * The orthogonal polynomial sequence of a quasi-definite moment functional 𝓛
 * over ℂ[u], constructed from its moment sequence m(k)(u) via the Wheeler
 * recurrence.
 *
 * <p>
 * <b>Setup.</b> m : ℤ_{≥0} → ℂ[u], with m(k)(u) := a(k+1, u), produced by the
 * existing Müntz machinery. Four sequences S, T, α, β : ℤ_{≥0} → ℂ[u]. Each
 * value S(n)(u), T(n)(u), α(n)(u), β(n)(u) is a {@link ComplexPolynomial} in
 * the Fourier parameter u.
 *
 * <p>
 * <b>The recurrence.</b> For n ≥ 0,
 *
 * <pre>
 *   S(n)(u) := m(n)(u).
 * </pre>
 *
 * For n ≥ 1,
 *
 * <pre>
 *   β(n)(u)   := S(n)(u) / S(n-1)(u),
 *   T(n)(u)   := m(n+1)(u) − β(n)(u) · m(n)(u),
 *   α(n)(u)   := T(n)(u) / S(n)(u),
 *   S(n+1)(u) := T(n)(u) − α(n)(u) · S(n)(u).
 * </pre>
 *
 * <p>
 * <b>Theorem.</b> α(n)(u) and β(n)(u) are the three-term recurrence
 * coefficients of the monic OPS for the moment functional 𝓛_u with moments
 * m(k)(u). The OPS {P(n, x; u)} satisfies
 *
 * <pre>
 *   P(n+1, x; u) = (x − α(n)(u)) · P(n, x; u) − β(n)(u) · P(n-1, x; u),
 *   P(-1, x; u)  = 0,
 *   P( 0, x; u)  = 1,
 * </pre>
 *
 * and its reciprocal flip is the diagonal Padé denominator of g(·, u).
 *
 * <p>
 * Every operation is one of: evaluation of a sequence at an integer index,
 * returning a ComplexPolynomial in u; or one of the four ring operations
 * (+, −, ·, /) on ComplexPolynomial in u. The dependency on u is carried
 * explicitly through every site as the variable of the ComplexPolynomial
 * values.
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

  public ComplexPolynomialSequence m;
  public ComplexPolynomialSequence S;
  public ComplexPolynomialSequence β;
  public ComplexPolynomialSequence T;
  public ComplexPolynomialSequence α;

  public OrthogonalPolynomialMomentFunctionalSequence(int bits, ComplexPolynomialSequence m)
  {
    super(bits);

    this.m = m;

    context.registerFunction("m", m);

    // Forward-declare the four mutually-recursive sequences; compile the
    // three auxiliaries; express the driver S last. Mirrors the pattern in
    // RiccatiMuntzPadeFunctional.partialDerivativeWithRespectToV.
    ComplexPolynomialSequence.declare("S", context);
    ComplexPolynomialSequence.declare("β", context);
    ComplexPolynomialSequence.declare("T", context);
    ComplexPolynomialSequence.declare("α", context);

    ComplexPolynomialSequence.compile("β:n ➔ u ➔ S(n)(u) / S(n-1)(u)", context);
    ComplexPolynomialSequence.compile("T:n ➔ u ➔ m(n+1)(u) − β(n)(u) · m(n)(u)", context);
    ComplexPolynomialSequence.compile("α:n ➔ u ➔ T(n)(u) / S(n)(u)", context);

    // S(n)(u): for n = 0, equal to m(0)(u); for n ≥ 1, follows the recurrence
    //   S(n)(u) = T(n-1)(u) − α(n-1)(u) · S(n-1)(u).
    S = ComplexPolynomialSequence.express("S:n ➔ u ➔ when(n = 0,  m(0)(u),"
                                              + "                else,   T(n-1)(u) − α(n-1)(u) · S(n-1)(u))",
                                          context);

    p0.one();
    p1.one().shiftLeft(1);
  }

  /** A(n) = 1. */
  @Override
  public Sequence<ComplexPolynomial> A()
  {
    return ComplexPolynomialSequence.express("A", "1", context);
  }

  /** B(n) = −α(n). */
  @Override
  public Sequence<ComplexPolynomial> B()
  {
    return (n, order, bits, res) -> α.evaluate(n, order, bits, res).neg(res);
  }

  /** C(n) = β(n). */
  @Override
  public Sequence<ComplexPolynomial> C()
  {
    return β;
  }
}
