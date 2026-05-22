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
   * functional. Cleared by {@link #invalidateCache(Set)} so a parameter change
   * can never surface a stale approximant.
   */
  private Complex                cachedV;
  private int                    cachedBits = -1;
  private ComplexFunction        cachedResult;

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
    if (cachedResult != null && bits == cachedBits && cachedV != null && cachedV.equals(v))
    {
      return cachedResult;
    }

    ComplexFunction approximant = new MuntzPadeApproximant(α, a, v, bits);

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
  @Override
  public void invalidateCache(Set<Function<?, ?>> alreadyInvalidated)
  {
    if (!alreadyInvalidated.add(this))
    {
      return;
    }
    cachedResult = null;
    cachedBits   = -1;
    if (a != null)
    {
      a.invalidateCache(alreadyInvalidated);
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
    if (cachedV != null)
    {
      cachedV.close();
      cachedV = null;
    }
    cachedResult = null;
  }
}
