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
    ComplexPolynomialSequence.compile("α:j ➔ σ(j)(j+1) / h(j)", context);

    // Express the leaf β; instantiating β cascades through h → σ → α.
    this.β = ComplexPolynomialSequence.express("β", "β:j ➔ when(j = 0, 0, else, h(j) / h(j-1))", context);

    // After the cascade, pull the other cluster members out of the context.
    this.σ = context.getFunctionMapping("σ").instantiate();
    this.h = context.getFunctionMapping("h").instantiate();
    this.α = context.getFunctionMapping("α").instantiate();

    p0.one(); // P(0, x) = 1; p1 set lazily in initialize()
  }

  /**
   * Populate the σ-table caches bottom-up through index {@code M} so that every
   * later top-down read of σ(j)(k), h(j), α(j), β(j) is a cache hit on a fully
   * computed value.
   *
   * <p>
   * The cluster is mutually recursive (α(j)=σ(j)(j+1)/h(j); the σ recurrence
   * references α(j-1), β(j-1)). Evaluated top-down, computing α(j) cold drives
   * the σ recurrence into α(j-1) <em>while α(j) is still in flight on the same
   * instance</em> — re-entering it and memoising a partially-computed ∅, which a
   * later α read divides by, throwing {@code DivisionByZeroException: ∅}.
   *
   * <p>
   * Computing strictly bottom-up removes that: at step j the σ(j) cells are
   * filled by direct σ evaluation (so α is not in flight) using the already
   * cached α(j-1)/β(j-1)/σ(j-1)/σ(j-2); then h(j), α(j), β(j) are pure cache
   * reads of σ(j). No instance is re-entered and no partial value is ever
   * cached. With the inner-curry σfunc memoised this is O(M²) and idempotent
   * (re-calls are cache hits).
   */
  public void warmTo(int M, int bits)
  {
    try ( Integer j = new Integer(); Integer k = new Integer(); ComplexPolynomial scratch = new ComplexPolynomial())
    {
      for (int jj = 0; jj <= M; jj++)
      {
        j.set(jj);
        @SuppressWarnings("resource")
        ComplexPolynomialSequence σj = σ.evaluate(j, 1, bits, null);
        // k must reach high enough that σ(jj)(jj+1) — and every cell the higher
        // levels read back through it — is materialised; 2M+2 covers the
        // σ(j)(k)=σ(j-1)(k+1)-… back-reference chain down to σ(0)(2M+1).
        for (int kk = 0; kk <= 2 * M + 2 - jj; kk++)
        {
          k.set(kk);
          σj.evaluate(k, 1, bits, scratch);
        }
        h.evaluate(j, 1, bits, scratch);
        α.evaluate(j, 1, bits, scratch);
        β.evaluate(j, 1, bits, scratch);
      }
    }
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
