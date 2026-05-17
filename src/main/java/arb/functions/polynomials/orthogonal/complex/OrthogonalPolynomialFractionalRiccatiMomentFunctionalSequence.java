package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * OPS of the moment functional
 *
 * <pre>
 *   𝓛_Riccati[xᵏ; v] := a(k+1, v)
 * </pre>
 *
 * where a(k, v) are the Müntz–Tau coefficients of the constant-coefficient
 * fractional Riccati equation
 *
 * <pre>
 *   D^μ y(t, v) = P(v) + Q(v) · y(t, v) + R(v) · y(t, v)²,
 *   I^{1−μ} y(0, v) = 0,
 * </pre>
 *
 * with P(v), Q(v), R(v) ∈ ℂ[v] and μ ∈ (0, 1]. (v is the Fourier / Riccati
 * parameter; in the methodology document this is the variable called u.)
 *
 * <p>
 * Setting m(k, v) := a(k+1, v) makes this the moment sequence of a quasi-
 * definite (signed, never positive-definite) functional over ℂ[v]. The OPS
 * produced is, after reciprocal-polynomial flip, the diagonal [M/M] Padé
 * denominator of the generating series g(z, v) = Σ_{k≥1} a(k, v) · zᵏ.
 *
 * <p>
 * The Müntz–Tau coefficient sequence is delegated to the existing
 * {@link RiccatiMuntzPadeFunctional}; its {@code muntzBasis()} produces the
 * sequence k ↦ a(k, v) of polynomials in v, which this class shifts by one
 * to obtain m(k, v) = a(k+1, v).
 *
 * <p>
 * The functional is never positive-definite at any v ∈ ℝ for which the §9.5
 * contraction hypotheses hold (Volterra contraction → no real poles of
 * g(·, v)), so OPS zeros are complex; their reciprocals are the poles of
 * g(·, v), condensing on the Stahl compact Δ_g(v) ⊂ ℂ \ ℝ as the OPS degree
 * grows.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence extends
                                                                          OrthogonalPolynomialMomentFunctionalSequence
{

  /** Holder of μ, P, Q, R and the Müntz–Tau coefficient sequence. */
  public RiccatiMuntzPadeFunctional muntz;

  /**
   * Construct from a fresh {@link RiccatiMuntzPadeFunctional} built from (μ, P,
   * Q, R).
   */
  public OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(Real μ,
                                                                       ComplexPolynomialNullaryFunction P,
                                                                       ComplexPolynomialNullaryFunction Q,
                                                                       ComplexPolynomialNullaryFunction R)
  {
    this(new RiccatiMuntzPadeFunctional(μ, P, Q, R));
  }

  /** Convenience: build from string expressions for P, Q, R. */
  public OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(Real μ,
                                                                       String P,
                                                                       String Q,
                                                                       String R)
  {
    this(new RiccatiMuntzPadeFunctional(μ, P, Q, R));
  }

  /**
   * Construct from an existing {@link RiccatiMuntzPadeFunctional}, sharing its
   * Müntz–Tau coefficient sequence between this OPS path and any other
   * consumer.
   */
  public OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(RiccatiMuntzPadeFunctional muntz)
  {
    super(muntz.context, riccatiMomentSequence(muntz));
    this.muntz = muntz;
  }

  /**
   * Müntz–Tau moment sequence m(k, v) = a(k+1, v). Shifts the Müntz coefficient
   * sequence by one — m(0) = a(1), m(1) = a(2), and so on.
   */
  private static ComplexPolynomialSequence riccatiMomentSequence(RiccatiMuntzPadeFunctional muntz)
  {
    // m(k)(u) := a(k+1)(u). Carry u through the call so the moment sequence's
    // polynomial-in-u structure is preserved.
    return ComplexPolynomialSequence.express("m:k ➔ u ➔ a(k + 1)(u)", muntz.context);
  }
}
