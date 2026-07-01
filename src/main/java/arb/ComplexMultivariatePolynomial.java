package arb;

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
  final GenericMultivariatePolynomial           polynomial;
  boolean                                    closed;

  ComplexMultivariatePolynomial(ComplexMultivariatePolynomialContext context)
  {
    this.context    = context;
    this.polynomial = GrMpolyNative.newPolynomial();
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
                                 coefficient,
                                 context.nativeContext());
    return this;
  }

  public Complex getCoefficient(long[] exponents, Complex result)
  {
    ensureOpen();
    validateExponents(exponents);
    GrMpolyNative.getCoefficient(result,
                                 polynomial,
                                 exponents,
                                 context.nativeContext());
    return result;
  }

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

  @Override
  public void close()
  {
    if (!closed)
    {
      closed = true;
      GrMpolyNative.clearPolynomial(polynomial,
                                    context.nativeContext());
      GrMpolyNative.freePolynomial(polynomial);
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
