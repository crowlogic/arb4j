package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The Müntz–Padé approximant at a fixed external parameter v:
 *
 * <pre>
 *   t ↦ R_M(t^μ; v) = P_M(t^μ; v) / Q_M(t^μ; v)
 * </pre>
 *
 * where μ ∈ (0, 1) is the fractional order shared with the parent
 * {@link MuntzPadeFunction} and {@code (P_M, Q_M)} is the diagonal Padé pair
 * built from the Müntz coefficients {@code k ↦ a_k(v)} at this v.
 *
 * <p>
 * Returned by {@link MuntzPadeFunction#evaluate(Complex, int, int, ComplexFunction)}
 * — one instance per v. The pair owns its native polynomials; callers close it
 * when done.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class MuntzPadeApproximantAtV implements
                                            ComplexFunction,
                                            AutoCloseable
{

  /** Fractional order μ ∈ (0, 1). Shared (borrowed) from the parent. */
  public final Real         α;

  /** The diagonal (M, M) Padé pair at this v. Owned. */
  public final DiagonalPade pade;

  public MuntzPadeApproximantAtV(Real α, DiagonalPade pade)
  {
    this.α    = α;
    this.pade = pade;
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    try ( Complex z = new Complex())
    {
      t.pow(α, bits, z);
      return pade.evaluate(z, order, bits, result);
    }
  }

  @Override
  public void close()
  {
    pade.close();
  }
}
