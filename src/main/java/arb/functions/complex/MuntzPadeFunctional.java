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
    return new MuntzPadeApproximant(α, a, v, bits);
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    // no owned native resources
  }
}