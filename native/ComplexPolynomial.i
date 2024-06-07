%typemap(javaimports) acb_poly_struct %{
import static arb.arblib.*;
import arb.utensils.Utensils;
import arb.functions.complex.ComplexFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.exceptions.DivisionByZeroException;
import java.util.Objects;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */%}
%typemap(javafinalize) acb_poly_struct ""
%typemap(javainterfaces) acb_poly_struct "Polynomial<Complex,ComplexPolynomial>,ComplexFunction"

%typemap(javacode) acb_poly_struct %{

  @Override
  public int
         hashCode()
  {
    return Objects.hash(coeffs);
  }

  @Override
  public boolean
         equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (!obj.getClass()
            .isAssignableFrom(ComplexPolynomial.class))
      return false;
    ComplexPolynomial that = (ComplexPolynomial) obj;
    return arblib.acb_poly_equal(this, that) != 0;
  }
  
  public String name;
  
  @SuppressWarnings("unchecked")
  @Override
  public  ComplexPolynomial setName(String name)
  {
    this.name = name;
    return this;
  }

  @Override
  public String getName()
  {
   return name;
  }


  public int bits;

  static { System.loadLibrary("arblib"); }

  public ComplexPolynomial divisor;

  public ComplexPolynomial pow(Integer in, int bits, ComplexPolynomial result)
  {
    arblib.acb_poly_pow_ui(result,this,in.getUnsignedValue(), bits);
    return result;
  }

  public ComplexPolynomial set(Real real)
  {
    setLength(1);
    fitLength(1);
    get(0).set(real);
    return this;
  }

  public ComplexPolynomial sub(ComplexPolynomial that, int prec)
  {
    return sub(that,prec,this);
  }
    
  public ComplexPolynomial set(int i)
  {
    arblib.acb_poly_set_si(this, i);
    return this;
  }
  
  public ComplexPolynomial add(ComplexPolynomial that, int bits)
  {
    return add(that, bits, this);
  }

  public ComplexPolynomial add(ComplexPolynomial that, int bits, ComplexPolynomial result)
  {
    assert that != null : "operand is null;";
    arblib.acb_poly_add(result, this, that, bits);
    result.bits = bits;
    return result;
  }
  
  public ComplexPolynomial mul( ComplexPolynomial that, int bits )
  {
    return mul( that, bits, this );
  }
  
  public ComplexPolynomial div(Integer divisor, int bits, ComplexPolynomial result)
  {
    try ( Complex complexDivisor = new Complex())
    {
      complexDivisor.set(divisor);
      div(complexDivisor, bits, result);
    }
    result.bits = bits;
    return result;
  }
    
  public ComplexPolynomial multiplicativeIdentity()
  {
    return identity();
  }
  
  public ComplexPolynomial additiveIdentity()
  {
    return zero();
  }

  public ComplexPolynomial div( Complex that, int bits, ComplexPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.acb_poly_scalar_div(result, this, that, bits );
    result.bits = bits;
    return result;
  }
    
  public ComplexPolynomial div(ComplexPolynomial divisor, int prec, ComplexPolynomial resultingQuotient)
  {
    ComplexPolynomial remainder = new ComplexPolynomial();

    // Performs polynomial division with remainder, computing a quotient and a
    // remainder such that . this = divisor * resultingQuotient + remainder

    if (arblib.acb_poly_divrem(resultingQuotient, remainder, this, divisor, prec) == 0)
    {
      throw new DivisionByZeroException("division by zero: dividend=" + divisor);
    }
    if (remainder.getLength() > 0)
    {
      resultingQuotient.divisor   = divisor;
      resultingQuotient.remainder = remainder;
    }
    resultingQuotient.bits = prec;
    return resultingQuotient;
  }

  public ComplexPolynomial div(ComplexPolynomial dividend, int prec)
  {
    return div(dividend, prec, this);
  }

  public ComplexPolynomial set(Integer integer)
  {
    arblib.acb_poly_set_si(this, integer.getSignedValue());
    return this;
  }
  
  public ComplexPolynomial sub(ComplexPolynomial that, int prec, ComplexPolynomial result)
  {
    arblib.acb_poly_sub(result, this, that, prec);
    result.bits = prec;
    return result;
  }
  
  public ComplexPolynomial sub(Complex g, int bits, ComplexPolynomial res)
  {
    return g.sub(this, bits, res);   
  }
  
  public ComplexPolynomial add( int i )
  {
    return add( i, bits, this );
  }
  
  public ComplexPolynomial add( int i, int bits )
  {
    return add( i, bits, this );
  }
  
  public ComplexPolynomial add(int i, int bits, ComplexPolynomial res )
  {
    arblib.acb_poly_add_si(res, this, i, bits);
    return res;
  }

  /**
   * @see arblib#acb_poly_shift_left(ComplexPolynomial, ComplexPolynomial, int)
   * 
   * NOTE: Aliasing of result with this is supported even though it's not supported
   * directly with the {@link arblib#acb_poly_shift_left(ComplexPolynomial, ComplexPolynomial, int)} function
   * instead the result variable is {@link Closeable#close()}ed and its {@link ComplexPolynomial#swigCPtr} is
   * changed to point to a newly allocated {@link ComplexPolynomial} which is then let go out of scope, transparently
   * changing the result by modifiying the result's pointer to point to the space recently reserved
   * 
   * @param n
   * @param result
   * @return
   */
  public ComplexPolynomial shiftLeft(int n, ComplexPolynomial result)
  {
    ComplexPolynomial originalResult = null;
    if (result == this)
    {
      originalResult = result;
      result        = new ComplexPolynomial();
    }
    arblib.acb_poly_shift_left(result, this, n);
    if (originalResult != null)
    {
      originalResult.close();
      originalResult.swigCPtr = result.swigCPtr;
      return originalResult;
    }
    result.bits = bits;
    return result;
  }

  public ComplexPolynomial shiftLeft(int n )
  {
    return shiftLeft(n,this);
  }

  public ComplexPolynomial shiftRight(int n )
  {
    return shiftRight(n,this);
  }
  
  /**
   * @see arblib#acb_poly_shift_right(ComplexPolynomial, ComplexPolynomial, int)
   * 
   * @param n
   * @param result
   * @return
   */
  public ComplexPolynomial shiftRight(int n, ComplexPolynomial result)
  {
    assert result != this : "aliasing not allowed";
    ComplexPolynomial originalResult = null;
    if (result == this)
    {
      originalResult = result;
      result        = new ComplexPolynomial();
    }
    arblib.acb_poly_shift_right(result, this, n);
    if (originalResult != null)
    {
      originalResult.close();
      originalResult.swigCPtr = result.swigCPtr;
      return originalResult;
    }
    result.bits = bits;
    return result;   
  }
  
  public ComplexPolynomial add(Complex g, int bits, ComplexPolynomial res)
  {
    return g.add(this, bits, res);   
  }
  
  public ComplexPolynomial mul( ComplexPolynomial that, int bits, ComplexPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.acb_poly_mul(result, this, that, bits );
    result.bits = bits;
    return result;
  }

  
  public ComplexPolynomial fitLength( int n )
  {
    arblib.acb_poly_fit_length(this, n);
    return this;
  }
    
  public ComplexPolynomial set(Complex complex)
  {
    setLength(1);
    fitLength(1);
    get(0).set(complex);
    return this;
  }
  
  public ComplexPolynomial one()
  {
    arblib.acb_poly_one(this);
    return this;
  }  
  
  public ComplexPolynomial zero()
  {
    arblib.acb_poly_zero(this);
    return this;
  }
  
  /**
   * Set the value of the i-th element of this polynomial's coefficients
   * 
   * @param i   index which must be less than this{@link #getLength()}
   * @param val value to be set
   * @return the ith element (the one that represents the polynomial, not the one passed in an as argument)
   */
  public Complex set(int i, Complex val)
  {
    arblib.acb_poly_set_coeff_acb(this, i, val);
    return get(i);
  }

  public Complex get(int i)
  {
    Complex coeff = getCoeffs();
    if  (coeff == null )
    {
      return null;
    }
    return i < coeff.size() ? coeff.get(i) : null;
  }
  
  /**
   * Sets this to the polynomial y(x)=x whose coefficient vector is [0 1]
   * 
   * @return this
   */
  public ComplexPolynomial identity()
  {
    setLength(2);
    set(0, ComplexConstants.zero);
    set(1, ComplexConstants.one);
    return this;
  }
  
  public ComplexPolynomial remainder;
  
  String independentVariableName = "x";
  
  boolean printPrecision = false;
  
  public String toString()
  {
    if (getLength() == 0)
    {
      return "∅";
    }
    StringBuilder builder = new StringBuilder();
    for (int i = getLength()-1; i >= 0; i--)
    {
      Complex xi = get(i);
      xi.printPrecision = printPrecision;
      if (!xi.isZero() || (xi.isZero() && getLength() == 1 ))
      {
        if (!builder.isEmpty())
        {
          builder.append(((xi.re().sign() >= 0) ? " + " : " "));
        }
        if (i == 0 || !xi.re().isOne())
        {
          builder.append(xi.toString().replace(" ", ""));
        }
        if (i > 0)
        {
          if (!builder.toString().trim().isEmpty())
          {
            builder.append("*");
          }
          builder.append(independentVariableName);
          if (i > 1)
          {
            builder.append(Utensils.toSuperscript(i));
          }
        }
      }
    }
    String string = builder.toString() + (remainder != null ? " with remainder " + remainder : "");
    if ( string.length() > 0 && string.charAt(0) == '-')
    {
      return "-" + string.substring(1).replaceAll("-", "- ").trim();
    }
    return string.replaceAll("-", "- ").trim();
  }

  @Override
  public ComplexPolynomial set(ComplexPolynomial a)
  {
    arblib.acb_poly_set(this, a);
    if (coeffs != null)
    {
     coeffs.close();
     coeffs = a.coeffs;
    }
    return this;
  }
  
  /**
   * Calls {@link arb#acb_clear(Complex)}
   * 
   * @return this
   */
  public ComplexPolynomial clear()
  {
    if ( swigCMemOwn )
    {
      acb_poly_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  {
    clear();
  }
  
 /**
   * @see arb#acb_poly_product_roots(ComplexPolynomial, Complex, int, int)
   * 
   * @param xs
   * @param prec
   * @return
   */
  public ComplexPolynomial productRoots(Complex xs, int prec)
  {
    acb_poly_product_roots(this, xs, xs.dim, prec);
    return this;
  }
  
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    switch (order)
    {
    case 1:
      acb_poly_evaluate(w, this, z, prec);
      return w;
    case 2:
      acb_poly_evaluate2(w, w.get(1), this, z, prec);
      return w;
    default:
      throw new UnsupportedOperationException("derivatives beyond the first are not yet implemented");
    }

  }

  public void setCoeffs(Complex value)
  {
    setCoeffsNative(value);
    setLength(value.size());
  }

  public Complex getCoeffs()
  {
    if (coeffs != null && (coeffs.dim != getLength() || coeffs.swigCPtr != swigCPtr))
    {
      coeffs.close();
      coeffs = null;
    }
    if (coeffs == null)
    {
      coeffs = getCoeffsNative();
      if (coeffs != null)
      {
        coeffs.dim      = getLength();
        coeffs.elements = new Complex[coeffs.dim];
      }
    }
    return coeffs;
  }

  public Complex coeffs;
%};