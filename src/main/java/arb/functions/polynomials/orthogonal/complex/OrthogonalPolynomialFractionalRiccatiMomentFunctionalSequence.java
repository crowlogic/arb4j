package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.Sequence;

/**
 * OPS of the moment functional
 *
 * <pre>
 *   𝓛_Riccati[xᵏ; u] := a(k+1, u)
 * </pre>
 *
 * where a(k, u) are the Müntz–Tau coefficients of the constant-coefficient
 * fractional Riccati equation
 *
 * <pre>
 *   D^μ y(t,u) = P(u) + Q(u) · y(t,u) + R(u) · y(t,u)²,
 *   I^{1−μ} y(0,u) = 0,
 * </pre>
 *
 * with P(u), Q(u), R(u) ∈ ℂ[u] and μ ∈ (0, 1].
 *
 * <p>
 * The Müntz–Tau ansatz y(t, u) = Σ_{k≥1} a(k, u) · t^{kμ} gives the Gamma-ratio
 * convolution recurrence
 *
 * <pre>
 *   a(1, u)   = P(u) / Γ(μ + 1)
 *   a(k+1, u) = Γ(kμ + 1) / Γ((k+1)μ + 1)
 *               · ( Q(u) · a(k, u)
 *                   + R(u) · Σ_{j=1..k-1} a(j, u) · a(k-j, u) )
 * </pre>
 *
 * Setting m(k, u) := a(k+1, u) makes this the moment sequence of a quasi-
 * definite (signed, never positive-definite) functional over ℂ[u]. The OPS
 * produced is, after reciprocal-polynomial flip, the diagonal [M/M] Padé
 * denominator of the generating series g(z, u) = Σ_{k≥1} a(k, u) · zᵏ.
 *
 * <p>
 * The functional is never positive-definite at any u ∈ ℝ for which the §9.5
 * contraction hypotheses hold (Volterra contraction → no real poles of
 * g(·, u)), so OPS zeros are complex; their reciprocals are the poles of
 * g(·, u), condensing on the Stahl compact Δ_g(u) ⊂ ℂ \ ℝ as M → ∞.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence extends
                                                                          OrthogonalPolynomialMomentFunctionalSequence
{

  public ComplexPolynomial μ;
  public ComplexPolynomial P;
  public ComplexPolynomial Q;
  public ComplexPolynomial R;

  public OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence(int bits,
                                                                       ComplexPolynomial μ,
                                                                       ComplexPolynomial P,
                                                                       ComplexPolynomial Q,
                                                                       ComplexPolynomial R)
  {
    super(bits, riccatiMomentSequence(μ, P, Q, R));
    this.μ = μ;
    this.P = P;
    this.Q = Q;
    this.R = R;
    // Make μ, P, Q, R visible on the parent's context too, so downstream
    // diagnostics (e.g. printing α(n)(u)) can resolve them.
    context.registerVariable(μ);
    context.registerVariable(P);
    context.registerVariable(Q);
    context.registerVariable(R);
  }

  /**
   * Müntz–Tau moment sequence m(k, u) = a(k+1, u) of the constant-coefficient
   * fractional Riccati equation. Direct transcription of Lemma 2.1.
   */
  private static Sequence<ComplexPolynomial> riccatiMomentSequence(ComplexPolynomial μ,
                                                                   ComplexPolynomial P,
                                                                   ComplexPolynomial Q,
                                                                   ComplexPolynomial R)
  {
    Context ctx = new Context();
    ctx.registerVariable(μ.setName("μ"));
    ctx.registerVariable(P.setName("P"));
    ctx.registerVariable(Q.setName("Q"));
    ctx.registerVariable(R.setName("R"));
    return ComplexPolynomialSequence.express("m",
                                             "k ➔ when(k = 0, P / Γ(μ + 1),"
                                                 + "       else,  Γ(k·μ + 1) / Γ((k+1)·μ + 1)"
                                                 + "              · ( Q · m(k-1)"
                                                 + "                  + R · sum(j ➔ m(j) · m(k-2-j) {j=0..k-2}) ))",
                                             ctx);
  }
}
