package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Adaptive Müntz–Padé functional.
 *
 * <p>
 * Binds the external parameter v and returns an adaptive
 * {@link MuntzPadeApproximant} which incrementally grows the Padé
 * hierarchy on demand during evaluation at the requested point t.
 *
 * <p>
 * <b>Architectural invariant 2 — the factory knows only freezing.</b><br>
 * This layer receives a polynomial sequence {@code k ↦ aₖ(v) ∈ ℂ[v]} and its
 * sole responsibility is binding the perturbation point {@code v} so that
 * {@link MuntzPadeApproximant} can evaluate the polynomials at that point
 * during its σ-table construction. It has no knowledge of how those polynomials
 * were derived or what application drives the evaluation.
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
  public Real                    α;

  /**
   * Müntz coefficients: k ↦ a_k(v) as polynomials in v.
   */
  public ComplexPolynomialSequence a;

  protected String               name;

  /**
   * The approximant is compiled once and rebound to each new perturbation point.
   * Its σ-table / Jacobi / Padé classes do not depend on v (only the registered
   * runtime variable does), so reconstructing it per point would needlessly
   * regenerate and JIT-compile a dozen expression classes — and leak the
   * previous one's classes into metaspace.
   */
  private MuntzPadeApproximant   approximant;

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
    if (approximant == null)
    {
      approximant = new MuntzPadeApproximant(α, a, v, bits);
    }
    else
    {
      approximant.rebind(v, bits);
    }
    return approximant;
  }

  /**
   * Propagate to the Müntz coefficient sequence so a parameter refresh can
   * never surface a stale approximant on the next evaluate.
   */
  @Override
  public void invalidateCache()
  {
    if (a != null)
    {
      a.invalidateCache();
    }
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    if (approximant != null)
    {
      approximant.close();
      approximant = null;
    }
  }
}
