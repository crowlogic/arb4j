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
    // Φnum(M) is the Padé numerator of degree M-1. Pn(M) already has degree
    // M-1 (Pn(1)=hv(0), recurrence (z-αv(n-1))*Pn(n-1)-βv(n-1)*Pn(n-2)
    // bumps degree by 1 per level). Multiplying by z gives degree M, which
    // makes Φ(M)(z) = z²/(...) at M=2 and approaches 0 near z=0 rather
    // than tracking tanh(z)≈z near 0. The construction here is Φ(M)=Pn/Φden;
    // no extra z factor.
    ComplexPolynomialSequence.express("Φnum:M➔Pn(M)",                           context);
    this.Φ = ComplexFunctionSequence.express("Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)", context);
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    if (closed) throw new IllegalStateException("closed");
    t.pow(α, bits, z);
    try ( Real    threshold = new Real();
          Real    diffMag   = new Real();
          Complex prev      = new Complex();
          Complex curr      = new Complex();
          Complex diff      = new Complex();
          Integer M         = new Integer() )
    {
      // Padé convergence is limited by the OPS h(j) sequence underflowing
      // working precision long before bit-exact agreement at `bits` is
      // possible. Half-precision is enough to detect convergence well above
      // the noise floor while leaving headroom before the OPS recurrence
      // hits its h-zero failure mode.
      threshold.one().mul2e(-bits / 2, threshold);
      M.set(2);
      Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, prev);
      for (int m = 3; m < 1024; m++)
      {
        M.set(m);
        try
        {
          Φ.evaluate(M, 1, bits, null).evaluate(z, 1, bits, curr);
        }
        catch (arb.exceptions.DivisionByZeroException divByZero)
        {
          // The OPS h(j) sequence shrinks past the working bit precision —
          // α(j) = σ(j)(j+1)/h(j) fails when arb classifies the divisor as
          // exactly zero. Past that M, the moment functional has no further
          // useful information at this precision; the best Padé approximant
          // we can produce is what convergence has already yielded. Return
          // the last successfully computed iterate.
          return result.set(prev);
        }
        curr.sub(prev, bits, diff).abs(bits, diffMag);
        if (diffMag.compareTo(threshold) <= 0)
        {
          return result.set(curr);
        }
        prev.set(curr);
      }
      throw new ArithmeticException("Müntz–Padé did not converge by M=1024");
    }
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
