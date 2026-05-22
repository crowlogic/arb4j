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
   * returned again when the next call requests the same {@code (v, order, bits)}.
   * Curried evaluation of the Müntz–Padé functional is expensive (it builds a
   * fresh {@link MuntzPadeApproximant} with its own σ-table and Jacobi
   * sequences), and consecutive calls at the same Fourier argument are common in
   * the pricing/calibration loops that drive this functional. The cache is
   * cleared by {@link #invalidateCache(Set)} so a parameter change can never
   * surface a stale approximant.
   */
  private Complex                cachedV;
  private int                    cachedBits  = -1;
  private int                    cachedOrder = -1;
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
    if (cachedResult != null && bits == cachedBits && order == cachedOrder && cachedV != null && cachedV.equals(v))
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
    cachedOrder  = order;
    cachedResult = approximant;
    return approximant;
  }

  /**
   * Drop the {@link #evaluate} memoization. Routed through here from the no-arg
   * {@link Function#invalidateCache()} default (which dynamically dispatches to
   * this override), so any parameter-change signal — including
   * {@code RiccatiMuntzPadeFunctional.invalidateCache()} refreshing p, q, r —
   * forces the next evaluate to rebuild rather than return a stale approximant.
   */
  @Override
  public void invalidateCache(Set<Function<?, ?>> alreadyInvalidated)
  {
    if (alreadyInvalidated.contains(this))
    {
      return;
    }
    alreadyInvalidated.add(this);
    cachedResult = null;
    cachedBits   = -1;
    cachedOrder  = -1;
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