package arb.functions.polynomials.orthogonal.complex;

import arb.ComplexPolynomial;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexPolynomialSequenceSequence;
import arb.functions.integer.Sequence;

/**
 * The monic orthogonal polynomial sequence of a quasi-definite moment
 * functional 𝓛 over ℂ[u], constructed from the moment sequence m(k)(u) via the
 * polynomial Chebyshev/Wheeler σ-table (Stieltjes form).
 *
 * <p>
 * <b>Definitions.</b> Given moments m : ℤ_{≥0} → ℂ[u], introduce the auxiliary
 * doubly-indexed table
 *
 * <pre>
 *   σ(j, k) := 𝓛[xᵏ · P(j, x)] ∈ ℂ[u]
 * </pre>
 *
 * and the scalar (in j) sequences
 *
 * <pre>
 *   h(j) := σ(j, j) = ⟨P_j, P_j⟩
 *   α(j) := σ(j, j+1) / h(j)
 *   β(j) := h(j) / h(j-1)            with β(0) := 0
 * </pre>
 *
 * <p>
 * <b>Recurrence.</b> σ is built from m by
 *
 * <pre>
 *   σ(0, k) := m(k)
 *   σ(j, k) := σ(j-1, k+1) − α(j-1)·σ(j-1, k) − β(j-1)·σ(j-2, k)    j ≥ 1
 * </pre>
 *
 * (convention σ(-1, k) := 0 keeps the β(0)·σ(-1, …) term degenerate at j = 1).
 *
 * <p>
 * <b>OPS.</b> α(n), β(n) are the Jacobi-matrix entries of the monic OPS for 𝓛;
 * the polynomials satisfy
 *
 * <pre>
 *   P(-1, x) := 0,   P(0, x) := 1
 *   P(n+1, x) := (x − α(n))·P(n, x) − β(n)·P(n-1, x)
 * </pre>
 *
 * — wired into the parent driver via A(n)=1, B(n)=−α(n), C(n)=β(n).
 *
 * <p>
 * Subclasses supply m : ℤ_{≥0} → ℂ[u].
 *
 * <p>
 * See issue #1031 / #1021 for the spec this implementation realizes.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrthogonalPolynomialMomentFunctionalSequence extends
                                                                   ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public ComplexPolynomialSequence         m;
  public ComplexPolynomialSequenceSequence σ;
  public ComplexPolynomialSequence         h;
  public ComplexPolynomialSequence         α;
  public ComplexPolynomialSequence         β;

  /**
   * Construct sharing the supplied {@link Context} so that {@code m}'s full
   * mapping (expression + instance + the chain of upstream dependencies
   * {@code a}, {@code p}, {@code q}, {@code r}, {@code μ} it references) is
   * visible to the σ-table recurrence. {@code m} must already be registered in
   * {@code sharedContext} — typically by the caller's prior
   * {@code express("m:...", sharedContext)}.
   */
  public OrthogonalPolynomialMomentFunctionalSequence(Context sharedContext, ComplexPolynomialSequence m)
  {
    super(sharedContext);

    this.m = m;

    // Forward-declare the mutually recursive cluster {σ, h, α, β}.
    ComplexPolynomialSequenceSequence.declare("σ", context);
    ComplexPolynomialSequence.declare("h", context);
    ComplexPolynomialSequence.declare("α", context);
    ComplexPolynomialSequence.declare("β", context);

    // Compile non-leaf bodies (class defined, instance deferred).
    ComplexPolynomialSequenceSequence.compile("σ",
                                              "σ:j ➔ k ➔ when(j = 0, m(k),"
                                                   + " j = 1, σ(0)(k+1) − α(0)·σ(0)(k),"
                                                   + " else,   σ(j-1)(k+1) − α(j-1)·σ(j-1)(k) − β(j-1)·σ(j-2)(k))",
                                              context);
    ComplexPolynomialSequence.compile("h:j ➔ σ(j)(j)", context);
    // Chebyshev–Wheeler recurrence coefficient. The full two-term form
    // α(j) = σ(j)(j+1)/h(j) − σ(j-1)(j)/h(j-1) is required: the second term is the
    // x^{j-1}-coefficient correction that vanishes only for a symmetric functional
    // (Σα=0). Dropping it (the bare σ(j)(j+1)/h(j)) makes the OPS orthogonal to 1
    // but not to x for non-symmetric moments, so p_j ceases to be orthogonal from
    // j≥2 onward — the failure on every rough-Heston (c₁=Q(v)≠0) functional.
    ComplexPolynomialSequence.compile("α:j ➔ when(j = 0, σ(0)(1) / h(0), else, σ(j)(j+1) / h(j) − σ(j-1)(j) / h(j-1))",
                                      context);

    // Express the leaf β; instantiating β cascades through h → σ → α.
    this.β = ComplexPolynomialSequence.express("β", "β:j ➔ when(j = 0, 0, else, h(j) / h(j-1))", context);

    // After the cascade, pull the other cluster members out of the context.
    this.σ = context.getFunction("σ");
    this.h = context.getFunction("h");
    this.α = context.getFunction("α");

    p0.one(); // P(0, x) = 1; p1 set lazily in initialize()
  }

  /** Set p1 = x − α(0), then delegate to the parent. */
  @Override
  public void initialize()
  {
    try ( Integer zero = new Integer().set(0); ComplexPolynomial alpha0 = α.evaluate(zero, 1, bits(), new ComplexPolynomial()))
    {
      p1.one().shiftLeft(1, p1).sub(alpha0, bits(), p1);
    }
    super.initialize();
  }

  /** A(n) = 1. */
  @Override
  public Sequence<ComplexPolynomial> A()
  {
    return ComplexPolynomialSequence.express("A", "1", context);
  }

  /**
   * B(n) = −α(n). Must be an expression-compiled sequence (not a lambda) so the
   * parent's {@code P} expression body — which registers {@code B} as a function
   * reference in {@link Context} — passes the {@code isHidden} guard on
   * {@link Context#registerFunctionMapping}. The {@code Bops} name avoids any
   * collision with a caller-supplied {@code "B"}.
   */
  @Override
  public Sequence<ComplexPolynomial> B()
  {
    return ComplexPolynomialSequence.express("Bops", "Bops:n➔-α(n)", context);
  }

  /** C(n) = β(n). */
  @Override
  public Sequence<ComplexPolynomial> C()
  {
    return β;
  }
}
