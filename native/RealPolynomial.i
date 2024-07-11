%typemap(javaimports) arb_poly_struct %{
import static arb.arblib.*;

import java.io.Closeable;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.DivisionByZeroException;
import arb.functions.real.RealFunction;
import arb.functions.real.RealGammaFunction;
import arb.functions.real.RealSquareRoot;
import arb.utensils.Utensils;


/**
 * <pre>
 * With ArbLib, when you use `arb_poly_set_coeff_arb()` to set a coefficient
 * for a polynomial, the library automatically handles the resizing of the
 * polynomial if necessary. This means if you set a coefficient for a higher
 * degree term than the polynomial currently supports, ArbLib will resize the
 * polynomial to accommodate the new term.
 * 
 * For instance, if you have a polynomial currently of degree 1 (like p(x) =
 * x), and you set a coefficient for the x^2 term, ArbLib will
 * automatically resize the polynomial to be of degree 2 and set the appropriate
 * coefficient.
 * 
 * When `arb_poly_set_coeff_arb(poly, 1, coeff);` is
 * called, it sets the coefficient of x^1 to 1. If the polynomial `poly`
 * was initially of a lower degree, this function would automatically resize it
 * to be at least of degree 1. However, since the polynomial is initialized
 * right before this without setting any specific degree, it will start as a
 * degree 0 polynomial and then resize to degree 1 to accommodate the new
 * coefficient.
 * 
 * To reduce the memory allocated for a polynomial in
 * ArbLib without changing its degree, you can use the `arb_poly_fit_length()`
 * function. This function adjusts the memory allocation for a polynomial to
 * match its actual degree.
 * 
 * Here's how you can use it:
 * </pre>
 * 
 * <code>void arb_poly_fit_length(arb_poly_t poly);</code>
 * 
 * <pre>
 * After modifying the coefficients of a polynomial and potentially reducing its
 * degree, you can call `arb_poly_fit_length(poly);` to make the polynomial's
 * memory allocation match its current degree, thus reducing any unused memory.
 * 
 * For example, if you have a polynomial of degree 10 but have set most of the
 * coefficients to zero and only use it as a quadratic polynomial, calling
 * `arb_poly_fit_length(poly);` will adjust the memory allocation to match the
 * degree of 2, reducing unnecessary memory usage.
 * 
 * This function ensures that the polynomial's memory usage is minimized without
 * changing its degree.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}

%typemap(javafinalize) arb_poly_struct ""
%typemap(javainterfaces) arb_poly_struct "Polynomial<Real,RealPolynomial>,RealFunction"

%typemap(javacode) arb_poly_struct %{

  public String name;

  @SuppressWarnings("unchecked")
  public RealPolynomial setName(String name)
  {
    this.name = name;
    return this;
  }

  @Override
  public String getName()
  {
    return name;
  }
  
  public RealPolynomial become(RealPolynomial that)
  {
    close();
    Real c = getCoeffs();
    c.become(that.getCoeffs());
    swigCPtr                = that.swigCPtr;
    swigCMemOwn             = that.swigCMemOwn;
    divisor                 = that.divisor;
    bits                    = that.bits;
    independentVariableName = that.independentVariableName;
    printPrecision          = that.printPrecision;
    remainder               = that.remainder;
    return this;
  }

  
  public RealPolynomial add(int i, int bits2)
  {
    return add(i, bits, this);
  }
  
  public RealPolynomial setRemainder(int i)
  {
    if ( remainder == null )
    {
      remainder = new RealPolynomial();
    }
    remainder.set(i);
    return this;
  }
    
  /**
   * 
   * @param i
   * @return this{@link #add(int, int)} with this{@link #bits} passed as the precision argument
   */
  public RealPolynomial add(int i)
  {
   return add(i,bits);
  }

  public RealPolynomial sub(Real operand, int prec)
  {
   return sub(operand,prec,this);
  }
  
  /**
   * 
   * @param i
   * @return this{@link #sub(int, int)} with this{@link #bits} passed as the precision argument
   */
  public RealPolynomial sub(int i)
  {
   return sub(i,bits);
  }

  public RealPolynomial sub(Integer operand, int prec)
  {
    return sub(operand, prec, this);
  }
  
  public RealPolynomial sub(int a, int bits, RealPolynomial res)
  {
    res.set(this);
    res.getCoeffs().get(0).sub(a, bits);
    res.bits = bits;
    return res;
  }  
  
  public RealPolynomial sub(int i, int bits)
  {
    return sub(i,bits,this);
  }
        
  public RealPolynomial add(int a, int bits, RealPolynomial res)
  {
    res.set(this);
    res.getCoeffs().get(0).add(a, bits);
    res.bits = bits;
    return res;
  }  
  
  public int bits;

  static { System.loadLibrary("arblib"); }

  public RealPolynomial(Real real)
  {
    this();
    set(real);
  }
  
  /**
   * Compute a quotient of this polynomial with another and its remainder by
   * reversing the inputs and performing power series division.
   * 
   * If the leading coefficient of the divisor contains zero (or if is identically
   * zero), then a {@link DivisionByZeroException} is thrown. Otherwise, the
   * {@link RealPolynomial} quotient will be calculated
   * 
   * If there is a remainder then the {@link RealPolynomial#remainder} and
   * {@link RealPolynomial#divisor} fields will be populated and will have its
   * {@link AutoCloseable#close()} method called by the {@link RealPolynomial}
   * quotient being returned as the result when its {@link AutoCloseable#close()}
   * method is called, otherwise the quotients {@link RealPolynomial#remainder}
   * will be null.
   */
  @Override
  public RealPolynomial div(RealPolynomial divisor, int prec, RealPolynomial resultingQuotient)
  {
    RealPolynomial remainder = new RealPolynomial();

    // Performs polynomial division with remainder, computing a quotient and a
    // remainder such that . this = divisor * resultingQuotient + remainder

    if (arblib.arb_poly_divrem(resultingQuotient, remainder, this, divisor, prec) == 0)
    {
      throw new DivisionByZeroException("division by zero: dividend=" + divisor);
    }
    if (remainder.getLength() > 0)
    {
      resultingQuotient.divisor   = divisor;
      resultingQuotient.remainder = remainder;
    }
    else
    {
      remainder.close();
    }
    resultingQuotient.bits = prec;
    return resultingQuotient;
  }

  public RealPolynomial mul(Integer multiplicand, int prec, RealPolynomial res)
  {
    return mul(res.set(multiplicand), prec, res);
  }

  public RealPolynomial div(Integer divisor, int prec, RealPolynomial res)
  {
    return div(res.set(divisor), prec, res);
  }

  public RealPolynomial sub(RealPolynomial that, int prec)
  {
    return sub(that,prec,this);
  }
  
  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }
    
  public RealPolynomial set(Real real)
  {
    setLength(real.dim);
    fitLength(real.dim);
    getCoeffs().set(real);
    return this;
  }
  
  public RealPolynomial div(Real divisor, int bits)
  {
    return div(divisor,bits,this);
  }
    
  public RealPolynomial div(int i, int bits, RealPolynomial result)
  {
    if (result.getLength() > 0)
    {
      try ( Real realDivisor = new Real())
      {
        realDivisor.set(i);
        div(realDivisor, bits, result);
      }
      result.bits = bits;
      return result;
    }
    else
    {
      // its the 0 vector, so whatever its divided by its still zero
      return this;
    }
  }

  public RealPolynomial add(Real addend, int bits)
  {
    return add( addend, bits, this );
  }
      
  public RealPolynomial add(Real g, int bits, RealPolynomial res)
  {
    return g.add(this, bits, res);   
  }
  
  public RealPolynomial add(RealPolynomial evaluate, int bits)
  {
    return add(evaluate, bits, this);
  }
    
  public RealPolynomial fitLength( int n )
  {
    arblib.arb_poly_fit_length(this, n);
    return this;
  }
    
  /**
   * 
   * @param that
   * @return {@link arblib#arb_poly_overlaps(RealPolynomial, RealPolynomial)} != 0
   */
  public boolean overlaps(RealPolynomial that)
  {
    return arblib.arb_poly_overlaps(this, that) != 0;
  }
  
  @SuppressWarnings("resource")
  @Override
  public boolean
         equals(Object obj)
  {
    if (obj instanceof RealPolynomial)
    {
      RealPolynomial that = (RealPolynomial) obj;
      return arblib.arb_poly_equal(this, that) != 0;
    }
    else if (obj instanceof ComplexPolynomial)
    {
      ComplexPolynomial that = (ComplexPolynomial) obj;
      return getCoeffs().equals(that.getCoeffs().real) && that.getCoeffs()
                                                              .getImag()
                                                              .isZero();
    }
    else
    {
      return false;
    }
  }
    
  /**
   * Call this{@link #set(int, Real)} successively
   * 
   * @param elements an array of values whose length is no greater than
   *                 this{@link #getLength()}
   * @return this
   */
  public RealPolynomial set(Real... elements)
  {
    assert elements.length <= getLength() : String.format("cannot set elements of dimension %d because the dimension of this polynomials coeffecients is only %d\n",
                                                          elements.length,
                                                          getLength());
    for (int i = 0; i < elements.length; i++)
    {
      set(i, elements[i]);
    }
    return this;
  }

  public RealPolynomial mul(RealPolynomial that, int bits)
  {
    return mul( that, bits, this );
  }
  
  public RealPolynomial add(Integer a, int bits, RealPolynomial res)
  {
    res.set(this);
    res.getCoeffs().get(0).add(a, bits);
    res.bits = bits;
    return res;
  }  
  
  public RealPolynomial sub(Integer a, int bits, RealPolynomial res)
  {
    res.set(this);
    res.getCoeffs().get(0).sub(a, bits);
    res.bits = bits;
    return res;
  }  

  public RealPolynomial additiveIdentity()
  {
    return zero();
  }
  
  public RealPolynomial multiplicativeIdentity()
  {
    return identity();
  }
  
  /**
   * Calculate the integral of this polynomial
   * 
   * @param bits
   * @return new {@link RealPolynomial} containing the integral of this with the
   *         integration of constant initialized to zero (note that this is NOT a
   *         reference to this like many of the other methods are)
   */
  public RealPolynomial integrate(int bits, RealPolynomial integral)
  {
    integral.fitLength(getLength() + 1);
    arblib.arb_poly_integral(integral, this, bits);
    integral.bits = bits;
    return integral;
  }

  /**
   * Calculate the derivative of this polynomial
   * 
   * @param bits
   * @param derivative
   * @return derivative
   */
  public RealPolynomial differentiate(int bits, RealPolynomial derivative)
  {
    derivative.fitLength(getLength() + 1);
    arblib.arb_poly_derivative(derivative, this, bits);
    derivative.bits = bits;
    return derivative;
  }
  
  /**
   * Set the value of the i-th element of this polynomial's coefficients
   * 
   * @param i   index which must be less than this{@link #getLength()}
   * @param val value to be set
   * @return the ith element (the one that represents the polynomial, not the one passed in an as argument)
   */
  public Real set(int i, Real val)
  {
    arblib.arb_poly_set_coeff_arb(this, i, val);
    return get(i);
  }
  
  String independentVariableName = "x";
  
  public String toString()
  {
    if (getLength() == 0)
    {
      return "∅";
    }
    StringBuilder builder = new StringBuilder();
    for (int i = getLength()-1; i >= 0; i--)
    {
      Real xi = get(i);
      xi.printPrecision = printPrecision;
      if (!xi.isZero() || (xi.isZero() && getLength() == 1 ))
      {
        if (!builder.isEmpty() )
        {
          builder.append(((xi.sign() >= 0) ? " + " : " "));
        }
        if (i == 0 || !xi.isOne())
        {
          builder.append(xi.toString().replace(" ", ""));
        }
        if (i > 0)
        {
          if (!builder.toString().trim().isEmpty() && !xi.isOne() )
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
    String trimmed = string.replaceAll("-", "- ").trim();
    return trimmed;
  }
      
  public boolean printPrecision = false;
  
  public RealPolynomial divisor;

  public RealPolynomial mul(RealPolynomial that, int bits, RealPolynomial result)
  {
    if (that == null)
    {
      result.set(this);
    }
    else
    {
      arblib.arb_poly_mul(result, this, that, bits);
      result.bits = bits;
      return result;
    }
    return this;
  }
  
  public RealPolynomial mul( Real that, int bits, RealPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.arb_poly_scalar_mul(result, this, that, bits );
    result.bits = bits;
    return result;
  }
  
  public RealPolynomial div( Real that, int bits, RealPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.arb_poly_scalar_div(result, this, that, bits );
    result.bits = bits;
    return result;
  }
  
  /**
   * @see arblib#arb_poly_shift_left(RealPolynomial, RealPolynomial, int)
   * 
   * NOTE: Aliasing of result with this is supported even though it's not supported
   * directly with the {@link arblib#arb_poly_shift_left(RealPolynomial, RealPolynomial, int)} function
   * instead the result variable is {@link Closeable#close()}ed and its {@link RealPolynomial#swigCPtr} is
   * changed to point to a newly allocated {@link RealPolynomial} which is then let go out of scope, transparently
   * changing the result by modifiying the result's pointer to point to the space recently reserved
   * 
   * @param n
   * @param result
   * @return
   */
  public RealPolynomial shiftLeft(int n, RealPolynomial result)
  {
    RealPolynomial originalResult = null;
    if (result == this)
    {
      originalResult = result;
      result        = new RealPolynomial();
    }
    arblib.arb_poly_shift_left(result, this, n);
    if (originalResult != null)
    {
      originalResult.close();
      originalResult.swigCPtr = result.swigCPtr;
      return originalResult;
    }
    result.bits = bits;
    return result;
  }

  /**
   * @see arblib#arb_poly_shift_right(RealPolynomial, RealPolynomial, int)
   * 
   * @param n
   * @param result
   * @return
   */
  public RealPolynomial shiftRight(int n, RealPolynomial result)
  {
    assert result != this : "aliasing not allowed";
    RealPolynomial originalResult = null;
    if (result == this)
    {
      originalResult = result;
      result        = new RealPolynomial();
    }
    arblib.arb_poly_shift_right(result, this, n);
    if (originalResult != null)
    {
      originalResult.close();
      originalResult.swigCPtr = result.swigCPtr;
      return originalResult;
    }
    result.bits = bits;
    return result;   
  }
 
  public Real get(int i)
  {
    Real coeff = getCoeffs();
    if  (coeff == null )
    {
      return null;
    }
    return i < coeff.size() ? coeff.get(i) : null;
  }
   
    
  /**
   * Sets {C, max(lenThis, lenThat)} to the sum of {this, thisLen} and {that, thatLen} by calling
   * {@link arblib#arb_poly_add(RealPolynomial, RealPolynomial, RealPolynomial, int)}<br>
   * 
   * Allows aliasing of the input and output operands.
   * 
   * @param that
   * @param prec
   * @param result
   * @return result
   */
  public RealPolynomial add(RealPolynomial addend, int prec, RealPolynomial result)
  {
    assert prec > 0 : "precision must be >0, was " + prec;
    assert result != null : "result should not be null";
    assert addend != null : "addend should not be null";
    arblib.arb_poly_add(result, this, addend, prec);
    result.bits = prec;
    return result;
  }

  public RealPolynomial sub(Real c0, int bits, RealPolynomial res)
  {
    assert bits > 0 : "bits must be >0, was " + bits;
    res.set(this);
    res.get(0).sub(c0, bits);
    res.bits = bits;
    return res;
  }

  /**
   * Sets {C, max(lenThis, lenThat)} to the difference of {this, thisLen} and {that, thatLen} by calling
   * {@link arblib#arb_poly_sub(RealPolynomial, RealPolynomial, RealPolynomial, int)}<br>
   * 
   * Allows aliasing of the input and output operands.
   * 
   * @param that
   * @param prec
   * @param result
   * @return result
   */
  public RealPolynomial sub(RealPolynomial that, int prec, RealPolynomial result)
  {
    assert prec > 0 : "prec must be >0, was " + bits;

    arblib.arb_poly_sub(result, this, that, prec);
    result.bits = prec;
    return result;
  }
    
  /**
   * Calls {@link arb#arb_clear(Real)}
   * 
   * @return this
   */
  public RealPolynomial clear()
  {
    if ( swigCMemOwn )
    {
      arb_poly_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  {
    if (remainder != null)
    {
      remainder.close();
      remainder = null;
    }
    if (coeffs != null)
    {
      coeffs.close();
      coeffs = null;
    }
    else
    {
      clear();
    }
  }

  public RealPolynomial remainder;
  
 /**
   * @see arb#arb_poly_product_roots(RealPolynomial, Real, int, int)
   * 
   * @param xs
   * @param prec
   * @return
   */
  public RealPolynomial productRoots(Real xs, int prec)
  {
    arb_poly_product_roots(this, xs, xs.dim, prec);
    bits = prec;
    return this;
  }
  
  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    switch (order)
    {
    case 0:
    case 1:
      arb_poly_evaluate(w, this, z, prec);
      w.bits = prec;
      return w;
    case 2:
      arb_poly_evaluate2(w, w.get(1), this, z, prec);
      w.bits = prec;
      return w;
    default:
      throw new UnsupportedOperationException("derivatives beyond the first are not yet implemented");
    }
  }
  
  public double eval(double d)
  {
    try ( Real t = new Real(); Real s = new Real() )
    {
      t.set(d);
      return evaluate(t, 1, 70, s).doubleValue();
    }
  }
  
  /**
   * Calls this{@link #init(int)}
   * @param order
   */
  public RealPolynomial(int order)
  {
    this();
    init(order);
    setLength(order);
  }

  /**
   * Calls {@link arblib#arb_poly_init(RealPolynomial, int)} to initializes the
   * polynomial for use, setting it to the zero polynomial.
   * 
   * @param order
   * @return this
   */
  public RealPolynomial init()
  {
    arblib.arb_poly_init(this);
    return this;
  }

  public RealPolynomial set(RealPolynomial a)
  {
    arblib.arb_poly_set(this, a);
    if (coeffs != null)
    {
     coeffs.close();
     coeffs = a.coeffs;
    }
    return this;
  }


  /**
   * Calls {@link arblib#arb_poly_init2(RealPolynomial, int)} which calls
   * {@link arblib#arb_poly_init(RealPolynomial)} then
   * {@link arblib#arb_poly_fit_length(RealPolynomial, int)} to make sure that the
   * coefficient array of the polynomial contains at least order initialized
   * coefficients
   * 
   * @param order
   * @return this
   */
  public RealPolynomial init(int order)
  {
    arblib.arb_poly_init2(this, order);
    return this;
  }
    
  public Real set(int i, int val)
  {
    arblib.arb_poly_set_coeff_si(this, i, val);
    return get(i);
  }

  /**
   * Sets this to the polynomial y(x)=x whose coefficient vector is [0 1]
   * 
   * @return this
   */
  public RealPolynomial identity()
  {
    setLength(2);
    set(0, RealConstants.zero);
    set(1, RealConstants.one);
    return this;
  }
  
  public Real getCoeffs()
  {
    boolean printPrecision = this.printPrecision;
    if ( coeffs != null )
    {
      printPrecision = coeffs.printPrecision;
    }  
    if (coeffs != null && (coeffs.dim != getLength() || coeffs.swigCPtr != swigCPtr))
    {
      coeffs.close();
      coeffs = null;
    }
    if (coeffs == null)
    {
      coeffs = getCoeffsNative();
      if (coeffs == null)
      {
        coeffs = Real.newVector();
      }      
      this.printPrecision = printPrecision;
      if (coeffs != null)
      {
        coeffs.printPrecision = printPrecision;
        coeffs.dim      = getLength();
        coeffs.elements = new Real[coeffs.dim];
      }
    }
    return coeffs;
  }
  
  public Real coeffs;
  
  public RealPolynomial neg()
  {
    return neg(this);
  }
  
  public RealPolynomial neg( RealPolynomial result )
  {
    arblib.arb_poly_neg( result, this );
    return result;
  }

  /**
   * 
   * @return true if this{@link #getLength()} is zero
   */
  public boolean isEmpty()
  {
    return getLength() == 0;
  }

  /**
   * 
   * @return {@link arblib#arb_poly_is_zero(RealPolynomial)} != 0
   */
  public boolean isZero()
  {
    return arblib.arb_poly_is_zero(this) != 0;
  }

  /**
   * Sets this polynomial to 0 length, the empty set
   * 
   * @return
   */
  public RealPolynomial empty()
  {
    setLength(0);
    return this;
  }

  /**
   * Sets this polynomial to degree 0 (length 1 coeff array consisting of a single
   * constant) and sets it to zero
   * 
   * @return
   */
  public RealPolynomial zero()
  {
    setLength(1);
    fitLength(1);
    get(0).zero();
    return this;
  }

  /**
   * TODO: this can be improved to not use the temp var
   * 
   * @param c1
   * @return
   */
  public RealPolynomial set(int c1)
  {
    try ( Real tmp = new Real();)
    {
      zero().set(0, tmp.set(c1));
    }
    return this;
  }
    
  public RealPolynomial set(Integer c1)
  {
    try ( Real tmp = new Real();)
    {
      zero().set(0, tmp.set(c1));
    }
    return this;
  }

  public RealPolynomial pow(Integer in, int bits, RealPolynomial result)
  {
    arblib.arb_poly_pow_ui(result,this,in.getUnsignedValue(), bits);
    return result;
  }
  
  @SuppressWarnings("resource")
  public static RealPolynomial newIdentityPolynomial()
  {
    return new RealPolynomial().identity();
  }  
  
  public RealPolynomial shiftLeft(int i)
  {
   return shiftLeft(i,this);
  }

  public RealPolynomial shiftRight(int i)
  {
   return shiftRight(i,this);
  }
  
  public RealPolynomial mul(Real v, int bits2)
  {
   return mul(v,bits2,this);
  }  

  /**
   * 
   * @return a {@link RealQuasiPolynomial} which is a {@link GammaFunction} of
   *         this#{@link RealPolynomial}
   */
  public RealQuasiPolynomial Γ()
  {
    return new RealQuasiPolynomial(this,
                                   RealGammaFunction.instance);
  }

  /**
   * 
   * @return a {@link RealQuasiPolynomial} which is a {@link SquareRoot} of
   *         this#{@link RealPolynomial}
   */
  public RealQuasiPolynomial sqrt()
  {
    return new RealQuasiPolynomial(this,
                                   RealSquareRoot.instance);
  }
    
%};