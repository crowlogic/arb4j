%typemap(javaimports) arb_poly_struct %{
import static arb.arblib.*;
import arb.functions.real.RealFunction;
import arb.algebra.Ring;
import arb.exceptions.DivisionByZeroException;
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
%typemap(javainterfaces) arb_poly_struct "AutoCloseable,RealFunction,Ring<RealPolynomial>"

%typemap(javacode) arb_poly_struct %{

  static { System.loadLibrary("arblib"); }

 /**
   * TODO: add some 'spare' functionality to RealPolynomial so that the temporary
   * variables can live there and possibly be managed more efficiently rather than
   * being allocated and freed upon each invocation of
   * this{@link #div(RealFunction)}
   * 
   * @param divisor
   * @param bits
   * @param result
   * @return
   */
  public RealPolynomial div(Integer divisor, int bits, RealPolynomial result)
  {
    if (result.getLength() > 0)
    {
      try ( Real realDivisor = new Real())
      {
        realDivisor.set(divisor);
        div(realDivisor, bits, result);
      }
      return result;
    }
    else
    {
      // its the 0 vector, so whatever its divided by its still zero
      return this;
    }
  }

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> rangeType()
  {
    return Real.class;
  }
  
  public RealPolynomial set(Real real)
  {
    setLength(1);
    fitLength(1);
    get(0).set(real);
    return this;
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
      return result;
    }
    else
    {
      // its the 0 vector, so whatever its divided by its still zero
      return this;
    }
  }
    
  public RealPolynomial add(Real g, int bits, RealPolynomial res)
  {
    return g.add(this, bits, res);   
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
  
  @Override
  public boolean equals(Object obj)
  {
    if (obj instanceof RealPolynomial)
    {
      RealPolynomial that = (RealPolynomial) obj;
      return arblib.arb_poly_equal(this, that) != 0;
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
    assert elements.length <= getLength() : String.format("cannot set elemenets of dimension %d because the dimension of this polynomials coeffecients is only %d\n",
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
    return res;
  }  
  
  public RealPolynomial sub(Integer a, int bits, RealPolynomial res)
  {
    res.set(this);
    res.getCoeffs().get(0).sub(a, bits);
    return res;
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
  public RealPolynomial integrate(int bits)
  {
    RealPolynomial integral = new RealPolynomial(getLength() + 1);
    arblib.arb_poly_integral(integral, this, bits);
    return integral;
  }

  /**
   * Calculate the derivative of this polynomial 
   * 
   * @param bits
   * @return new {@link RealPolynomial} containing the integral of this with the
   *         integration of constant initialized to zero (note that this is NOT a
   *         reference to this like many of the other methods are)
   */
  public RealPolynomial differentiate(int bits)
  {
    RealPolynomial derivative = new RealPolynomial(getLength() + 1);
    arblib.arb_poly_derivative(derivative, this, bits);
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
  
  @Override
  public String toString()
  {
    if (getLength() == 0)
    {
      return "∅";
    }
    if (getLength() == 1)
    {
      return get(0).toString();
    }
    StringBuilder builder = new StringBuilder();
    for (int i = getLength() - 1; i >= 0; --i)
    {
      Real xi = get(i);
      if (!xi.isZero())
      {
        if (i < getLength() - 1)
        {
          builder.append(xi.sign() >= 0 ? " + " : " ");
        }
        if (!xi.isOne())
        {
          builder.append(xi);
        }
        if (i > 0)
        {
          builder.append("x");
          if (i > 1)
          {
            builder.append(Utensils.toSuperscript(i));
          }
        }
      }
    }
    return (builder.toString() + (remainder != null ? " with remainder " + remainder : "")).replaceAll("-", "- ");
  }
  
  /**
   * Performs polynomial division with remainder, computing a quotient and a
   * remainder such that the implementation reverses the inputs and performs 
   * power series division.
   * 
   * If the leading coefficient of the divisor contains zero (or if is
   * identically zero), then a {@link DivisionByZeroException} is thrown.
   * Otherwise, the {@link RealPolynomial} quotient will be calculated
   * 
   * If there is a remainder then the {@link RealPolynomial#remainder} will be 
   * populated and will have its {@link AutoCloseable#close()} method called by 
   * the {@link RealPolynomial} quotient being returned as the result when its 
   * {@link AutoCloseable#close()} method is called, otherwise the quotients 
   * {@link RealPolynomial#remainder} will be null.
   */
  @Override
  public RealPolynomial div(RealPolynomial divisor, int prec, RealPolynomial resultingQuotient)
  {
    RealPolynomial remainder = new RealPolynomial();

    if (arblib.arb_poly_divrem(resultingQuotient, remainder, this, divisor, prec) == 0)
    {
      throw new DivisionByZeroException("division by zero: dividend=" + divisor);
    }
    if (remainder.getLength() > 0)
    {
      resultingQuotient.remainder = remainder;
    }
    return resultingQuotient;
  }

  public RealPolynomial mul( RealPolynomial that, int bits, RealPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.arb_poly_mul(result, this, that, bits );
    return result;
  }
  
  public RealPolynomial mul( Real that, int bits, RealPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.arb_poly_scalar_mul(result, this, that, bits );
    return result;
  }
  
  public RealPolynomial div( Real that, int bits, RealPolynomial result )
  {
    assert that != null : "operand is null;";
    arblib.arb_poly_scalar_div(result, this, that, bits );
    return result;
  }
  
  /**
   * @see arblib#arb_poly_shift_left(RealPolynomial, RealPolynomial, int)
   * 
   * @param n
   * @param result
   * @return
   */
  public RealPolynomial shiftLeft(int n, RealPolynomial result)
  {
    assert result != this : "aliasing not allowed";
    arblib.arb_poly_shift_left(result, this, n);
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
    arblib.arb_poly_shift_right(result, this, n);
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
  public RealPolynomial add(RealPolynomial that, int prec, RealPolynomial result)
  {
    arblib.arb_poly_add(result, this, that, prec);
    return result;
  }

  public RealPolynomial sub(Real c0, int bits, RealPolynomial l3)
  {
    l3.set(this);
    l3.get(0).sub(c0, bits);
    return l3;
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
    arblib.arb_poly_sub(result, this, that, prec);
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
    clear();
    if ( remainder != null )
    {
      remainder.close();
      remainder = null;
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
      return w;
    case 2:
      arb_poly_evaluate2(w, w.get(1), this, z, prec);
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

%};