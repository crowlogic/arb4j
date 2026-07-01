package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexMultivariatePolynomialContext implements AutoCloseable
{
  final GenericRing baseContext    = GrMpolyNative.newContext();
  final GenericRing polynomialRing = GrMpolyNative.newContext();
  final int                      bits;
  final int                      numberOfVariables;
  final MultivariateOrder        order;
  boolean                        closed;

  public ComplexMultivariatePolynomialContext(int numberOfVariables, int bits)
  {
    this(numberOfVariables,
         bits,
         MultivariateOrder.LEX);
  }

  public ComplexMultivariatePolynomialContext(int numberOfVariables, int bits, MultivariateOrder order)
  {
    if (numberOfVariables < 0)
    {
      throw new IllegalArgumentException("numberOfVariables must be nonnegative");
    }
    if (bits <= 0)
    {
      throw new IllegalArgumentException("bits must be positive");
    }
    this.bits              = bits;
    this.numberOfVariables = numberOfVariables;
    this.order             = order;
    GrMpolyNative.initComplexBase(baseContext,
                                  bits);
    GrMpolyNative.initPolynomialContext(polynomialRing,
                                        baseContext,
                                        numberOfVariables,
                                        order);
  }

  public ComplexMultivariatePolynomialContext setVariableNames(String... names)
  {
    ensureOpen();
    if (names.length != numberOfVariables)
    {
      throw new IllegalArgumentException("expected " + numberOfVariables + " variable names but got " + names.length);
    }
    GrMpolyNative.setGeneratorNames(polynomialRing,
                                    names);
    return this;
  }

  public ComplexMultivariatePolynomial newPolynomial()
  {
    ensureOpen();
    return new ComplexMultivariatePolynomial(this);
  }

  GenericRing nativeContext()
  {
    ensureOpen();
    return polynomialRing;
  }

  void ensureOpen()
  {
    if (closed)
    {
      throw new IllegalStateException("context is closed");
    }
  }

  @Override
  public void close()
  {
    if (!closed)
    {
      closed = true;
      GrMpolyNative.clearPolynomialContext(polynomialRing);
      GrMpolyNative.clearBaseContext(baseContext);
      GrMpolyNative.freeContext(polynomialRing);
      GrMpolyNative.freeContext(baseContext);
    }
  }
}
