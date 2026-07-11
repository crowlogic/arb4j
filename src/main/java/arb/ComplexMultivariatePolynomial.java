package arb;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexMultivariatePolynomial implements AutoCloseable
{
  final ComplexMultivariatePolynomialContext context;
  final Arena                                arena = Arena.ofConfined();
  final MemorySegment                        polynomial;
  boolean                                    closed;

  ComplexMultivariatePolynomial(ComplexMultivariatePolynomialContext context)
  {
    this.context    = context;
    this.polynomial = arena.allocate(GrMpolyNative.GR_MPOLY_LAYOUT);
    GrMpolyNative.initPolynomial(polynomial,
                                 context.nativeContext());
  }

  public ComplexMultivariatePolynomial set(String expression)
  {
    ensureOpen();
    GrMpolyNative.setExpression(polynomial,
                                expression,
                                context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial set(long value)
  {
    ensureOpen();
    GrMpolyNative.set(polynomial,
                      value,
                      context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial set(ComplexMultivariatePolynomial other)
  {
    ensureCompatible(other);
    GrMpolyNative.set(polynomial,
                      other.polynomial,
                      context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial zero()
  {
    ensureOpen();
    GrMpolyNative.zero(polynomial,
                       context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial one()
  {
    ensureOpen();
    GrMpolyNative.one(polynomial,
                      context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial generator(int variable)
  {
    ensureVariable(variable);
    GrMpolyNative.generator(polynomial,
                            variable,
                            context.nativeContext());
    return this;
  }

  // ── negate ─────────────────────────────────────────────────────────────

  public ComplexMultivariatePolynomial negate(ComplexMultivariatePolynomial result)
  {
    ensureOpen();
    result.ensureCompatible(this);
    GrMpolyNative.neg(result.polynomial,
                      polynomial,
                      context.nativeContext());
    return result;
  }

  public ComplexMultivariatePolynomial negate(int bits, ComplexMultivariatePolynomial result)
  {
    return negate(result);
  }

  // ── length / degree ────────────────────────────────────────────────────

  public long length()
  {
    ensureOpen();
    return GrMpolyNative.length(polynomial,
                                context.nativeContext());
  }

  // ── pow (Java-level repeated squaring) ─────────────────────────────────

  public ComplexMultivariatePolynomial pow(int exp,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureOpen();
    result.ensureCompatible(this);
    if (exp < 0)
    {
      throw new IllegalArgumentException("negative exponent not supported for multivariate polynomials");
    }
    if (exp == 0)
    {
      result.one();
      return result;
    }
    if (exp == 1)
    {
      result.set(this);
      return result;
    }
    try ( ComplexMultivariatePolynomial base = context.newPolynomial();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      base.set(this);
      result.one();
      int e = exp;
      while (e > 0)
      {
        if ((e & 1) == 1)
        {
          GrMpolyNative.mul(result.polynomial,
                            result.polynomial,
                            base.polynomial,
                            context.nativeContext());
        }
        e >>= 1;
        if (e > 0)
        {
          GrMpolyNative.mul(temp.polynomial,
                            base.polynomial,
                            base.polynomial,
                            context.nativeContext());
          base.set(temp);
        }
      }
    }
    return result;
  }

  // ── arithmetic: self-type ──────────────────────────────────────────────

  public ComplexMultivariatePolynomial add(ComplexMultivariatePolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return add(other, result);
  }

  public ComplexMultivariatePolynomial add(ComplexMultivariatePolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(other);
    result.ensureCompatible(this);
    GrMpolyNative.add(result.polynomial,
                      polynomial,
                      other.polynomial,
                      context.nativeContext());
    return result;
  }

  public ComplexMultivariatePolynomial sub(ComplexMultivariatePolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return sub(other, result);
  }

  public ComplexMultivariatePolynomial sub(ComplexMultivariatePolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(other);
    result.ensureCompatible(this);
    GrMpolyNative.sub(result.polynomial,
                      polynomial,
                      other.polynomial,
                      context.nativeContext());
    return result;
  }

  public ComplexMultivariatePolynomial mul(ComplexMultivariatePolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return mul(other, result);
  }

  public ComplexMultivariatePolynomial mul(ComplexMultivariatePolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(other);
    result.ensureCompatible(this);
    GrMpolyNative.mul(result.polynomial,
                      polynomial,
                      other.polynomial,
                      context.nativeContext());
    return result;
  }

  // ── arithmetic: Complex ────────────────────────────────────────────────

  public ComplexMultivariatePolynomial add(Complex other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return add(other, result);
  }

  public ComplexMultivariatePolynomial add(Complex other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromComplex(other, context))
    {
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(Complex other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return sub(other, result);
  }

  public ComplexMultivariatePolynomial sub(Complex other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromComplex(other, context))
    {
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(Complex other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return mul(other, result);
  }

  public ComplexMultivariatePolynomial mul(Complex other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    GrMpolyNative.mulScalar(result.polynomial,
                            polynomial,
                            MemorySegment.ofAddress(Complex.getCPtr(other)),
                            context.nativeContext());
    return result;
  }

  // ── arithmetic: ComplexPolynomial ──────────────────────────────────────

  public ComplexMultivariatePolynomial add(ComplexPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return add(other, result);
  }

  public ComplexMultivariatePolynomial add(ComplexPolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromComplexPolynomial(other, context, 0))
    {
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(ComplexPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return sub(other, result);
  }

  public ComplexMultivariatePolynomial sub(ComplexPolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromComplexPolynomial(other, context, 0))
    {
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(ComplexPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    return mul(other, result);
  }

  public ComplexMultivariatePolynomial mul(ComplexPolynomial other,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromComplexPolynomial(other, context, 0))
    {
      GrMpolyNative.mul(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  // ── arithmetic: Real ───────────────────────────────────────────────────

  public ComplexMultivariatePolynomial add(Real other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      c.set(other);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(Real other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      c.set(other);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(Real other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex() )
    {
      c.set(other);
      GrMpolyNative.mulScalar(result.polynomial,
                              polynomial,
                              MemorySegment.ofAddress(Complex.getCPtr(c)),
                              context.nativeContext());
    }
    return result;
  }

  // ── arithmetic: Integer ────────────────────────────────────────────────

  public ComplexMultivariatePolynomial add(Integer other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      c.set(other);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(Integer other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      c.set(other);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(Integer other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    GrMpolyNative.mulSi(result.polynomial,
                        polynomial,
                        (long) other.getUnsignedIntValue(),
                        context.nativeContext());
    return result;
  }

  // ── arithmetic: Fraction ───────────────────────────────────────────────

  public ComplexMultivariatePolynomial add(Fraction other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          Real r = new Real();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      r.set(other);
      c.set(r);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(Fraction other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          Real r = new Real();
          ComplexMultivariatePolynomial temp = context.newPolynomial() )
    {
      r.set(other);
      c.set(r);
      temp.setCoefficient(new long[context.numberOfVariables], c);
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(Fraction other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( Complex c = new Complex();
          Real r = new Real() )
    {
      r.set(other);
      c.set(r);
      GrMpolyNative.mulScalar(result.polynomial,
                              polynomial,
                              MemorySegment.ofAddress(Complex.getCPtr(c)),
                              context.nativeContext());
    }
    return result;
  }

  // ── arithmetic: RealPolynomial ─────────────────────────────────────────

  public ComplexMultivariatePolynomial add(RealPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromRealPolynomial(other, context, 0))
    {
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(RealPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromRealPolynomial(other, context, 0))
    {
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(RealPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromRealPolynomial(other, context, 0))
    {
      GrMpolyNative.mul(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  // ── arithmetic: IntegerPolynomial ──────────────────────────────────────

  public ComplexMultivariatePolynomial add(IntegerPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromIntegerPolynomial(other, context, 0))
    {
      GrMpolyNative.add(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial sub(IntegerPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromIntegerPolynomial(other, context, 0))
    {
      GrMpolyNative.sub(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  public ComplexMultivariatePolynomial mul(IntegerPolynomial other,
                                           int bits,
                                           ComplexMultivariatePolynomial result)
  {
    ensureCompatible(result);
    try ( ComplexMultivariatePolynomial temp = fromIntegerPolynomial(other, context, 0))
    {
      GrMpolyNative.mul(result.polynomial,
                        polynomial,
                        temp.polynomial,
                        context.nativeContext());
    }
    return result;
  }

  // ── coefficient accessors ──────────────────────────────────────────────

  public ComplexMultivariatePolynomial setCoefficient(long[] exponents, long coefficient)
  {
    ensureOpen();
    validateExponents(exponents);
    GrMpolyNative.setCoefficient(polynomial,
                                 exponents,
                                 coefficient,
                                 context.nativeContext());
    return this;
  }

  public ComplexMultivariatePolynomial setCoefficient(long[] exponents, Complex coefficient)
  {
    ensureOpen();
    validateExponents(exponents);
    GrMpolyNative.setCoefficient(polynomial,
                                 exponents,
                                 Complex.getCPtr(coefficient),
                                 context.nativeContext(),
                                 true);
    return this;
  }

  public Complex getCoefficient(long[] exponents, Complex result)
  {
    ensureOpen();
    validateExponents(exponents);
    GrMpolyNative.getCoefficient(Complex.getCPtr(result),
                                 polynomial,
                                 exponents,
                                 context.nativeContext());
    return result;
  }

  // ── predicates ─────────────────────────────────────────────────────────

  public boolean isZero()
  {
    ensureOpen();
    return GrMpolyNative.isZero(polynomial,
                                context.nativeContext());
  }

  public boolean isOne()
  {
    ensureOpen();
    return GrMpolyNative.isOne(polynomial,
                               context.nativeContext());
  }

  public boolean isGenerator(int variable)
  {
    ensureVariable(variable);
    return GrMpolyNative.isGenerator(polynomial,
                                     variable,
                                     context.nativeContext());
  }

  @Override
  public String toString()
  {
    ensureOpen();
    return GrMpolyNative.toString(polynomial,
                                  context.nativeContext());
  }

  @Override
  public boolean equals(Object object)
  {
    if (this == object)
    {
      return true;
    }
    if (!(object instanceof ComplexMultivariatePolynomial that))
    {
      return false;
    }
    if (context != that.context)
    {
      return false;
    }
    ensureOpen();
    that.ensureOpen();
    return GrMpolyNative.equal(polynomial,
                               that.polynomial,
                               context.nativeContext());
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(context,
                        toString());
  }

  // ── conversion factories ───────────────────────────────────────────────

  public static ComplexMultivariatePolynomial fromComplex(Complex value,
                                                           ComplexMultivariatePolynomialContext mvCtx)
  {
    ComplexMultivariatePolynomial result = mvCtx.newPolynomial();
    long[] exponents = new long[mvCtx.numberOfVariables];
    result.setCoefficient(exponents, value);
    return result;
  }

  public static ComplexMultivariatePolynomial fromComplexPolynomial(ComplexPolynomial poly,
                                                                     ComplexMultivariatePolynomialContext mvCtx,
                                                                     int variable)
  {
    ComplexMultivariatePolynomial result = mvCtx.newPolynomial();
    int length = poly.getLength();
    long[] exponents = new long[mvCtx.numberOfVariables];
    try ( Complex coeff = new Complex())
    {
      for (int i = 0; i < length; i++)
      {
        coeff.set(poly.get(i));
        if (!coeff.isZero())
        {
          for (int v = 0; v < mvCtx.numberOfVariables; v++)
          {
            exponents[v] = 0;
          }
          exponents[variable] = i;
          result.setCoefficient(exponents, coeff);
        }
      }
    }
    return result;
  }

  public static ComplexMultivariatePolynomial fromRealPolynomial(RealPolynomial poly,
                                                                  ComplexMultivariatePolynomialContext mvCtx,
                                                                  int variable)
  {
    ComplexMultivariatePolynomial result = mvCtx.newPolynomial();
    int length = poly.getLength();
    long[] exponents = new long[mvCtx.numberOfVariables];
    try ( Complex coeff = new Complex())
    {
      for (int i = 0; i < length; i++)
      {
        coeff.set(poly.get(i));
        if (!coeff.isZero())
        {
          for (int v = 0; v < mvCtx.numberOfVariables; v++)
          {
            exponents[v] = 0;
          }
          exponents[variable] = i;
          result.setCoefficient(exponents, coeff);
        }
      }
    }
    return result;
  }

  public static ComplexMultivariatePolynomial fromIntegerPolynomial(IntegerPolynomial poly,
                                                                     ComplexMultivariatePolynomialContext mvCtx,
                                                                     int variable)
  {
    ComplexMultivariatePolynomial result = mvCtx.newPolynomial();
    int length = poly.getLength();
    long[] exponents = new long[mvCtx.numberOfVariables];
    try ( Complex coeff = new Complex())
    {
      for (int i = 0; i < length; i++)
      {
        coeff.set(poly.get(i));
        if (!coeff.isZero())
        {
          for (int v = 0; v < mvCtx.numberOfVariables; v++)
          {
            exponents[v] = 0;
          }
          exponents[variable] = i;
          result.setCoefficient(exponents, coeff);
        }
      }
    }
    return result;
  }

  public static ComplexMultivariatePolynomial fromFraction(Fraction value,
                                                            ComplexMultivariatePolynomialContext mvCtx)
  {
    ComplexMultivariatePolynomial result = mvCtx.newPolynomial();
    long[] exponents = new long[mvCtx.numberOfVariables];
    try ( Complex c = new Complex();
          Real r = new Real() )
    {
      r.set(value);
      c.set(r);
      result.setCoefficient(exponents, c);
    }
    return result;
  }

  // ── lifecycle ──────────────────────────────────────────────────────────

  @Override
  public void close()
  {
    if (!closed)
    {
      closed = true;
      GrMpolyNative.clearPolynomial(polynomial,
                                    context.nativeContext());
      arena.close();
    }
  }

  private void ensureOpen()
  {
    context.ensureOpen();
    if (closed)
    {
      throw new IllegalStateException("polynomial is closed");
    }
  }

  private void ensureCompatible(ComplexMultivariatePolynomial other)
  {
    ensureOpen();
    other.ensureOpen();
    if (context != other.context)
    {
      throw new IllegalArgumentException("polynomials belong to different contexts");
    }
  }

  private void ensureVariable(int variable)
  {
    ensureOpen();
    if (variable < 0 || variable >= context.numberOfVariables)
    {
      throw new IndexOutOfBoundsException("variable index " + variable + " is outside 0.." + (context.numberOfVariables - 1));
    }
  }

  private void validateExponents(long[] exponents)
  {
    if (exponents.length != context.numberOfVariables)
    {
      throw new IllegalArgumentException("expected " + context.numberOfVariables + " exponents but got " + exponents.length);
    }
    for (long exponent : exponents)
    {
      if (exponent < 0)
      {
        throw new IllegalArgumentException("negative exponents are not supported");
      }
    }
  }
}
