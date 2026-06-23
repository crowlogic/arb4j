package arb.functions.complex;

import java.util.Set;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ComplexFunctional;
import arb.functions.Function;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Adaptive Müntz–Padé functional.
 *
 * <p>
 * Curries the external parameter v and returns an adaptive
 * {@link MuntzPadeApproximant} which incrementally grows the Padé
 * hierarchy on demand during evaluation at the requested point t.
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
   * Memoization of one: the most recent {@link #evaluate} result is retained and
   * returned again when the next call requests the same {@code (v, bits)}.
   * Curried evaluation is expensive and consecutive calls at the same Fourier
   * argument are common in the pricing/calibration loops that drive this
   * functional. Cleared by {@link #invalidateCache()} so a parameter change
   * can never surface a stale approximant.
   */
  private Complex                cachedV;
  private int                    cachedBits = -1;
  private ComplexFunction        cachedResult;

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

  /**
   * Evaluate κ_M(t, v) at a SPECIFIED Padé order M (no adaptive M-loop).
   * Delegates to {@link MuntzPadeApproximant#evaluateAtM} after binding
   * {@code v} on the internal approximant.
   *
   * @param v       perturbation point
   * @param M       Padé order (M ≥ 2)
   * @param t       evaluation point in the α-power "z = t^α" sense
   * @param bits    working precision
   * @param result  output ball
   * @return        {@code result}
   */
  public Complex evaluateAtM(Complex v, int M, Complex t, int bits, Complex result)
  {
    if (approximant == null)
    {
      approximant = new MuntzPadeApproximant(α, a, v, bits);
    }
    else
    {
      approximant.rebind(v, bits);
    }
    return approximant.evaluateAtM(M, t, bits, result);
  }

  @Override
  public ComplexFunction evaluate(Complex v, int order, int bits, ComplexFunction result)
  {
    if (cachedResult != null && bits == cachedBits && cachedV != null && cachedV.equals(v))
    {
      return cachedResult;
    }

    if (approximant == null)
    {
      approximant = new MuntzPadeApproximant(α, a, v, bits);
    }
    else
    {
      approximant.rebind(v, bits);
    }

    if (cachedV == null)
    {
      cachedV = new Complex();
    }
    cachedV.set(v);
    cachedBits   = bits;
    cachedResult = approximant;
    return approximant;
  }

  /**
   * Drop the {@link #evaluate} memoization and propagate to the Müntz
   * coefficient sequence, so a parameter refresh (e.g.
   * {@code RiccatiMuntzPadeFunctional} updating p, q, r) can never surface a
   * stale approximant on the next evaluate.
   */
  private boolean invalidatingCache;

  @Override
  public void invalidateCache()
  {
    if (invalidatingCache)
    {
      return;
    }
    invalidatingCache = true;
    cachedResult      = null;
    cachedBits        = -1;
    if (a != null)
    {
      a.invalidateCache();
    }
    invalidatingCache = false;
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    if (cachedV != null)
    {
      cachedV.close();
      cachedV = null;
    }
    if (approximant != null)
    {
      approximant.close();
      approximant = null;
    }
    cachedResult = null;
  }
}
