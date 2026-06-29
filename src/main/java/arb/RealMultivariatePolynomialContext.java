package arb;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealMultivariatePolynomialContext implements AutoCloseable
{
  final Arena         arena          = Arena.ofConfined();
  final MemorySegment baseContext    = arena.allocate(GrMpolyNative.GR_CTX_LAYOUT);
  final MemorySegment polynomialRing = arena.allocate(GrMpolyNative.GR_CTX_LAYOUT);
  final int           bits;
  final int           numberOfVariables;
  final MultivariateOrder order;
  boolean             closed;

  public RealMultivariatePolynomialContext(int numberOfVariables, int bits)
  {
    this(numberOfVariables,
         bits,
         MultivariateOrder.LEX);
  }

  public RealMultivariatePolynomialContext(int numberOfVariables, int bits, MultivariateOrder order)
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
    GrMpolyNative.initRealBase(baseContext,
                               bits);
    GrMpolyNative.initPolynomialContext(polynomialRing,
                                        baseContext,
                                        numberOfVariables,
                                        order);
  }

  public RealMultivariatePolynomialContext setVariableNames(String... names)
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

  public RealMultivariatePolynomial newPolynomial()
  {
    ensureOpen();
    return new RealMultivariatePolynomial(this);
  }

  MemorySegment nativeContext()
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
      arena.close();
    }
  }
}
