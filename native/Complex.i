
%typemap(javaimports) acb_struct %{
import static arb.IntegerConstants.PAGESIZE;
import static arb.arblib.acb_clear;
import static arb.arblib.acb_indeterminate;
import static arb.arblib.acb_mul_2exp_si;
import static arb.arblib.acb_sinh;
import static arb.arblib.acb_swap;

import java.io.IOException;
import java.io.Serializable;
import java.lang.foreign.MemorySegment;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Queue;
import java.util.Set;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.complex.ComplexNullaryFunction;

/**
 * The {@link Complex} numbers constitute an algebraically closed {@link Field}, a
 * commutative algebra over the {@link Real}s, and a
 * {@link EuclideanVectorSpace} of dimension two.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}

%typemap(javafinalize) acb_struct ""

%typemap(javainterfaces) acb_struct "Becomable<Complex>,Domain<Complex>,NamedField<Complex>,Comparable<Complex>,Iterable<Complex>,Serializable,Lockable<Complex>,IntFunction<Complex>,Assignable<Complex>"

%typemap(javacode) acb_struct %{
  static { System.loadLibrary( "arblib" ); }

  /**
   * Directly sets the i-th element of the elements, that is, replaces the references
   * rather than setting the value to the Complex currently referenced at the specified index
   */
  public Complex set(int index, Complex element )
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return set(element);
    }
    return elements[index] = element;
  } 
  
  @SuppressWarnings("resource")
  public static Complex valueOf(int i)
  {
    return new Complex().set(i);
  }
  
  public Complex pow(int bits)
  {
    return pow(this,bits);
  }
  
  public Complex pow(Fraction operand, int bits)
  {
    return pow(operand,bits,this);
  }
  
  public Complex set(int integer)
  {
    re().set(integer);
    im().zero();
    return this;
  }

  public Complex pow(Complex k, int prec, Complex r)
  {
    arblib.acb_pow(r, this, k, prec);
    return r;
  }
  
  public ComplexPolynomial div(ComplexPolynomial dividend, int prec, ComplexPolynomial result)
  {
    return result.set(this).div(dividend, prec);
  }

  public Complex mul(AlgebraicNumber operand, int bits, Complex result)
  {  
    return operand.getComplex(bits, result).mul(this, bits);    
  }

  public Complex pow( Fraction operand, int prec, Complex r )
  {
    assert operand != null && operand.swigCPtr != 0 : "operand is null";
    pow(r.re().set(operand),prec,r );   
    return r;
  }
      
  public Complex(int i)
  {
   this();
   set(i);
  }
  
  public Complex pow( Real operand, int prec, Complex r )
  {
    assert operand != null && operand.swigCPtr != 0 : "operand is null";
    arblib.acb_pow_arb(r, this, operand, prec);
    return r;
  }  

  public Complex digamma(int bits)
  {
    return digamma(bits, this);
  }
  
  public Complex add(Fraction operand, int prec, Complex s)
  {
    s.set(this);
    s.re().add(operand, prec);
    return s;
  }
    
  public Complex digamma(int bits, Complex result)
  {
    arblib.acb_digamma(result, this, bits);
    result.bits = bits;
    return result;  
  }
  
  public Complex mul( Fraction s, int prec, Complex r )
  {
    return mul(r.set(s),prec,r);   
  }
 
  public Complex arg( int prec, Complex result )
  {
    result.im().zero();
    arg(prec,result.re());
    return result;
  }
  
  public Complex add(Real z, int bits2)
  {
    return add(z, bits2, this);
  }

  public Complex set(double... d)
  {
    re().set(d);
    im().zero();
    return this;
  }
  
  public Complex pow( Integer operand, int prec, Complex r )
  {
    assert operand != null && operand.swigCPtr != 0 : "operand is null";
    arblib.acb_pow_fmpz(r, this, operand.swigCPtr, prec);
    return r;
  }
    
  public Complex add(Real z, int bits2, Complex s)
  {
    return z.add(this, bits2,s);
  }
  
  public Complex mul(Integer operand, int prec, Complex result)
  {
    assert operand != null && operand.swigCPtr != 0 : "operand is null";
    arblib.acb_mul_fmpz(result, this, operand.swigCPtr, prec);
    return result;
  }
    
  public static Predicate<Complex> isNegativeInteger = αᵢ ->
                                                     {

                                                       Complex α = (Complex) αᵢ;
                                                       return α.getImag().isZero()
                                                                     && α.getReal().isInteger()
                                                                     && α.getReal().isNegative();

                                                     };

  public Real re(int bits, Real res )
  {
    return res.set(re());
  }

  public Real im(int bits, Real res )
  {
    return res.set(im());
  }
  
  public Complex re(int bits, Complex res)
  {
    return res.set(re());
  }

  public Complex im(int bits, Complex res)
  {
    return res.set(im());
  }  
  
  public ComplexRationalFunction
         mul(ComplexRationalFunction operand, int prec, ComplexRationalFunction result)
  {
    return result.set(this).mul(operand, prec, result);
  }
                                                       
  /**
   * 
   * @param bits
   * @param value
   * @return this{@link #lnΓ(int, Real)}
   */
  public Complex
         logΓ(int bits,
              Complex value)
  {
    return lnΓ(bits, value);
  }

  @SuppressWarnings("resource")
  public static Complex named(String name2)
  {
    return new Complex().setName(name2);
  }

  public Named set(String value, int bits2)
  {
    return ComplexNullaryFunction.express(value).evaluate(bits2, this);
  }
    
  @Override
  public Complex set(Fraction val)
  {
    if ( dim != val.dim )
    {
      resize(val.dim);
    }
    getReal().set(val);
    getImag().zero();
    return this;
  }
    
 /**
   * log-Γ
   * 
   * @see arb#arb_lgamma(Real, Real, int)
   * @param bits
   * @param value
   * @return value=lnΓ(this)
   */
  public Complex lnΓ(int bits, Complex value)
  {
    arblib.acb_lgamma(value, this, bits);
    value.bits = bits;
    return value;
  }

  public ComplexRationalFunction add(ComplexRationalFunction a, int bits, ComplexRationalFunction res)
  {
    return res.set(this).add(a,bits);
  }
  
  public ComplexRationalFunction div(ComplexRationalFunction dividend, int prec, ComplexRationalFunction result)
  {
    return result.set(this).div(dividend, prec);
  }
    
  /**
   * @see arblib#acb_gamma(Complex, Complex, int)
   * @param bits
   * @param value
   * @return value=Γ(this)
   */
  public Complex Γ(int bits, Complex value)
  {
    arblib.acb_gamma(value, this, bits);
    value.bits = bits;
    return value;
  }

  public Complex( Integer val )
  {
    this();
    set(val);
  }
  
  
  public Complex gamma(int bits)
  {
    return Γ(bits, this);
  }
      
  public Complex Γ(int bits)
  {
    return Γ(bits, this);
  }
  
  public int bits;

  public Complex div(Integer operand, int prec)
  {
    return div(operand,prec,this);
  }
  
  public Complex set(Complex... elements)
  {
    Complex newVec = Complex.newVector(elements.length);
    for ( int i = 0; i < elements.length; i++ )
    {
      newVec.get(i).set(elements[i]);
    }
    become(newVec.setName(name));
    return this;
  }

  public Complex set(Real real)
  {
    re().set(real);
    im().zero();
    return this;
  }
    
  public Complex add(Integer addend, int prec)
  {
    return add( addend, prec, this );
  }

  public Complex add(Integer operand, int prec, Complex s)
  {
    this.bits = prec;
    arblib.acb_add_ui(s, this, operand.getUnsignedValue(), prec);
    return this;
  }
  
  /**
   * Adds the {@link Real#getMagnitude(Magnitude)}s of the this{@link #getReal()}
   * and this{@link #getImag()} parts of a given {@link Complex} number to the
   * {@link Real#getRad()} of the real and imaginary parts of this
   * 
   * @param δ
   * @return
   */
  public Complex addUncertainty(Complex δ)
  {
    try ( var mag = new Magnitude())
    {
      re().addUncertainty(δ.re().getMagnitude(mag));
      im().addUncertainty(δ.im().getMagnitude(mag));
    }
    return this;
  }
  
  /**
   * See {@link Real#become(Real)}
   * 
   * @param that
   * @return this after becoming that
   */
  @Override
  public Complex become(Complex that)
  {
    close();
    elements         = that.elements;
    swigCPtr         = that.swigCPtr;
    swigCMemOwn      = that.swigCMemOwn;
    dim              = that.dim;
    name             = that.name;
    that.swigCMemOwn = false;
    return this;
  }
  
  public ComplexPolynomial sub(ComplexPolynomial a, int bits, ComplexPolynomial res)
  {
    res.set(a);
    Complex x = res.getCoeffs().get(0);
    x.sub(this, bits);
    x.bits = bits;
    return res;
  }
  
  public ComplexPolynomial add(ComplexPolynomial a, int bits, ComplexPolynomial res)
  {
    res.set(a);
    Complex x = res.getCoeffs().get(0);
    x.add(this, bits);
    x.bits = bits;
    return res;
  }
  
  public ComplexPolynomial mul( ComplexPolynomial s, int prec, ComplexPolynomial r )
  {
   arblib.acb_poly_scalar_mul(r, s, this, prec);
   return r;
  }
   
  public Complex sub(Integer subtrahend, int prec, Complex result )
  {
    arblib.acb_sub_fmpz(result, this, subtrahend.swigCPtr, prec );
    result.bits = prec;
    return result;
  }

  public Complex sub(Integer subtrahend, int prec)
  {
    return sub( subtrahend, prec, this );
  }
    
  @Override
  public Complex apply(int value)
  {
    return get(value);
  }

  @Override
  public Complex newFieldElementVector(int dim)
  {
    return newVector(dim);
  }


  /**
   * 
   * @return {@link arb#acb_is_exact(Real)} != 0
   */
  public boolean isExact()
  {
    return arblib.acb_is_exact(this) != 0;
  }
  
  public Complex cosh(int prec)
  {
    bits = prec;
    return cosh(prec, this);
  }
  
  public Complex set(Integer integer)
  {
    re().set(integer);
    im().zero();
    return this;
  }
  
/**
   * @see this{@link #sinh(int, Complex)}
   * 
   * @param bits
   * @return
   */
  public Complex sinh(int bits)
  {
    this.bits = bits;
    return sinh(bits, this);
  }

  /**
   * hyperbolic sine. See {@link arb#acb_sinh(Complex, Complex, int)}
   * 
   * @param bits
   * @param value
   * @return value after it has been set to sinh(this)
   */
  public Complex sinh(int bits, Complex value)
  {
    this.bits = bits;
    acb_sinh(value, this, bits);
    return value;
  }
  
  @Override
  public Complex additiveIdentity()
  {
   return set(ComplexConstants.zero);
  }

  @Override
  public Complex multiplicativeIdentity()
  {
    return set(ComplexConstants.one);
  }
  
  /**
   * Sets u to an lower bound for the absolute value of x via
   * {@link arb#acb_get_mag_lower(Magnitude, Complex)}
   * 
   * @param lowerBound the {@link Magnitude} to be assigned the result
   * @return lowerBound after it has been assigned the return value
   */
  public Magnitude absLowerBound(Magnitude lowerBound)
  {
    arblib.acb_get_mag_lower(lowerBound, this);
    return lowerBound;
  }
  
  /**
   * Calculate sqrt(Re^2+Im^2)
   * 
   * @param result
   * @return the hypotenuse length of the triangle having two sides with lengths
   *         of the radii of the real and imaginary parts
   */
  public Magnitude hypotenuseLength(Magnitude result)
  {
    return getReal().getRad().hypotenuseLength(getImag().getRad(), result);
  }


  /**
   * Sets u to an upper bound for the absolute value of x via
   * {@link arb#acb_get_mag(Magnitude, Complex)}
   * 
   * @param upperBound the {@link Magnitude} to be assigned the result
   * @return upperBound after it has been assigned the return value
   */
  public Magnitude absUpperBound(Magnitude upperBound)
  {
    arblib.acb_get_mag(upperBound, this);
    return upperBound;
  }
  
 public static Complex newVector(int dim, String name )
 {
    Complex array = arblib._acb_vec_init(dim);
    array.swigCMemOwn = true;      
    array.elements = new Complex[array.dim = dim];
    array.name = name;
    return array;
 }
  public Complex tanh(int prec)
  {
    bits = prec;
    return tanh(prec, this);
  }
  
  public Complex sub(int i, int prec)
  {
    bits = prec;
    return sub(i,prec,this);
  }

  /**
   * Construct a new {@link Complex} aligned on a page boundary so that this can be
   * this{@link #lock()}ed by invoking the
   * {@link arblibJNI#mprotect(long, long, int)} method. The actual size based on the
   * rounding up of the buffer size to the nearest page boundary is set which is
   * always greater than or equal to the requested dimension
   * 
   * TODO: use
   * {@link MemorySegment#allocateNative(java.lang.foreign.MemoryLayout, java.lang.foreign.MemorySession)}
   * instead of {@link arblibJNI#memalign(long, long)}
   * 
   * @param size
   * @return
   */
  public static Complex newAlignedVector(int size)
  {
    // Calculate the size aligned to the page boundary
    int  alignedSize = (int) ((size * Complex.BYTES + PAGESIZE - 1) / PAGESIZE * PAGESIZE);

    long pointer     = arblibJNI.memalign(PAGESIZE, alignedSize);
    arblibJNI.memset(pointer, 0, alignedSize);
    Complex x          = new Complex(pointer,
                                     true);

    // Calculate the actual number of elements that can fit in the aligned buffer
    int     actualSize = alignedSize / Complex.BYTES;

    x.elements = new Complex[x.dim = actualSize];
    for (int j = 0; j < actualSize; j++)
    {
      Complex y = x.elements[j] = new Complex(pointer + (Complex.BYTES * j),
                                              false);
      y.init();
    }
    return x;
  }
    
  /**
   * Swaps the positions of two elements of the array
   * 
   * @param i
   * @param j
   * @return
   */
  public Complex swap(int i, int j)
  {
    return get(i).swap(get(j));
  }
  
  /**
   * @return this{@link #getImag()}
   */
  public Real im()
  {
    return getImag();
  }

  /**
   * @return this{@link #getReal()}
   */
  public Real re()
  {
    return getReal();
  }
  
  public Complex(Complex x)
  {
   this();
   set(x);
  }
  
  public Complex log(int prec)
  {
    return log(prec,this);
  }

  /**
   * Self-assigned this{@link #div(Real, int, Complex)}
   * @param σ
   * @param prec
   * @return this
   */
  public Complex div(Real σ, int prec)
  {
    return div(σ, prec, this );
  }
  
  /**
   * @see this{@link #mul2e(int, Complex)}
   * @param i
   * @return
   */
  public Complex mul2e(int i)
  {
    return mul2e(i, this);
  }
  
  public Complex add(int i, int prec)
  {
    return add(i,prec,this);
  }
  
  public Complex pow(int i, int prec)
  {
    return pow(i,prec,this);
  }

  /**
   * 
   * @param result the variable to receive the result
   * @return the result after it has been set to -this
   */
  public Complex negate(Complex res)
  {
    arblib.acb_neg(res, this);
    return res;
  }

  @SuppressWarnings("unchecked")
  public Complex setName( String name )
  {
    this.name = name;
    return this;
  }

  public String name;

 @Override
  public int dim()
  {
    return dim;
  }

  /**
   * Self-assigned this{@link #mul(Real, int, Complex)}
   * @param h
   * @param prec
   * @return this=this*h
   */
  public Complex mul(Real h, int prec)
  {
    return mul(h,prec,this);
  }


  /**
   * Self-assigned this{@link #exp(int, Complex)} 
   * @param prec
   * @return this=exp(this)
   */
  public Complex exp(int prec)
  {
    return exp(prec,this);
  }
  
  public Complex(double r, double i)
  {
    this();
    set(r,i);
  }

  public Complex(String realStr, String imagStr, int precision)
  {
    this();
    getReal().set(realStr, precision);
    getImag().set(imagStr, precision);
  }

  public Complex sqrt(int prec, Complex r)
  {
    arblib.acb_sqrt(r, this, prec);
    return r;
  }

  
  public Complex sqrt(int prec)
  {
    return sqrt(prec,this);
  }

  public Complex log(int prec, Complex r)
  {
    arblib.acb_log(r, this, prec);
    return r;
  }

  public Complex tanh(int prec, Complex res)
  {
    arblib.acb_tanh(res, this, prec );
    return res;
  }

  public boolean printPrecision = true;

 /**
   * Sets z to this multiplied by the imaginary unit.
   * 
   * @param z result
   * 
   * @return s result
   */
  public Complex muli(Complex z)
  {
    arblib.acb_mul_onei(z, this);
    return z;
  }
  
  /**
   * Sets this to this multiplied by the imaginary unit
   * 
   * @return this
   */
  public Complex muli()
  {
    return muli(this);
  }
  
  public Complex tan(int prec, Complex s)
  {
    arblib.acb_tan(s, this, prec);
    return this;
  }

  public Complex neg()
  {
    return neg(this);
  }

  public Complex conj()
  {
    return conj(this);
  }
  
  /**
   * @see arb#acb_swap(Complex, Complex)
   * 
   * @param that
   * @return this
   */
  public Complex swap(Complex that)
  {
    acb_swap(this, that);
    return this;
  }
  
  @Override
  public Complex identity()
  {
    arblib.acb_one(this);
    return this;
  }
  
  /**
   * Calculates this*(2^e)
   *  
   * @param e
   * @param res
   * @return {@link arb#acb_mul_2exp_si(Complex, Complex, int)}
   */
  public Complex mul2e( int e, Complex res )
  {
    acb_mul_2exp_si(res, this, e);
    return res;
  }

  /**
   * NOTICE: this is 1-indexed, not 0 indexed like this{@link #get(int)} !!!
   * 
   * @param k
   * @return
   */
  public Complex get(Integer k)
  {
    return get(k.getSignedValue() - 1);
  }

  
  public Complex div(int i, int prec, Complex res)
  {
    res.bits = prec;
    arblib.acb_div_si(res, this, i, prec);
    return res;
  }

  public Complex div(Integer i, int prec, Complex res)
  {
    res.bits = prec;
    arblib.acb_div_fmpz(res, this, i.swigCPtr, prec);
    return res;
  }

  
  public Complex negate()
  {
    return negate(this);
  }
  
  public Complex setIndeterminate()
  {
    acb_indeterminate(this);
    return this;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(getReal().doubleValue(), getImag().doubleValue() );
  }
  
  /**
   * @return {@link arb#acb_equal(Complex, Complex)}
   */
  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof Complex))
    {
      return false;
    }
    Complex that = (Complex) obj;
    return arblib.acb_equal(this, that) != 0;
  }
  
  public Complex resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arblib.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                             false),
                                                         2 * (long)alloc * Complex.BYTES));
    Complex newElements[] = new Complex[alloc];
    System.arraycopy(elements, 0, newElements, 0, dim);
    this.dim = alloc;
    elements = newElements;
    return this;
  }
    
  private static final long serialVersionUID = 1L;
    
  private void writeObject(java.io.ObjectOutputStream stream) throws IOException
  {
    assert false : "TODO";
  }

  private void readObject(java.io.ObjectInputStream stream) throws IOException, ClassNotFoundException
  {
    assert false : "TODO";
  }
    
  public Iterator<Real> realIterator()
  {
    return new ComplexRealPartIterator(this);
  }

  public Iterator<Real> imaginaryIterator()
  {
    return new ComplexImaginaryPartIterator(this);
  }

  private Stream<Real> stream(Iterator<Real> iter)
  {
    return StreamSupport.stream(Spliterators.spliterator(iter, dim, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

  public Stream<Real> realStream()
  {
    return stream(realIterator());
  }

  public Stream<Real> imaginaryStream()
  {
    return stream(imaginaryIterator());
  }

  public int getAllocatedBytes()
  {
    return getReal().getAllocatedBytes() + getImag().getAllocatedBytes();
  }

  public Complex ascendingFactorial(Integer power, int bits, Complex result)
  {
    assert power.getSignedValue() >= 0 : "power must be nonnegative";
    assert result != null : "result shan't be null, but it is";
    assert swigCPtr != 0 : "swigCptr is null";
    assert bits > 0 : "bits must be a positive integer";
    arblib.acb_hypgeom_rising_ui(result, this, power.getUnsignedValue(), bits);
    result.bits = bits;
    return result;
  }
    
  public ComplexRationalFunction
         ascendingFactorial(Integer n, int bits, ComplexRationalFunction result)
  {
    try ( Complex intermediateVariable = borrowVariable())
    {
      ascendingFactorial(n, bits, intermediateVariable);
      result.set(intermediateVariable);
      return result;
    }
  }
    
  public ComplexPolynomial ascendingFactorial(Integer n, int bits, ComplexPolynomial result)
  {
    result.set(1);   
    ascendingFactorial(n, bits, result.get(0));
    result.bits = bits;
    return result;
  }
    
  /**
   * @see arb#acb_addmul(Complex, Complex, Complex, int)
   * @param that
   * @param prec
   * @param result
   * @return result = result + this * that
   */
  public Complex addmul(Complex that, int prec, Complex result)
  {
    arblib.acb_addmul(result, this, that, prec);
    return result;
  }
  
  /**
   * @see arblib#acb_addmul_arb(Complex, Complex, Real, int)m
   * @param that
   * @param bits
   * @param result
   * @return result = result + this * that
   */
  public Complex addmul(Real that, int bits, Complex result)
  {
    arblib.acb_addmul_arb(result, this, that, bits);
    return result;
  }
  
    
  /**
   * Computes the dot product of the vectors x and y, setting res to
   * <code>s+(-1)^subtract+sum(this[i]*y[i],i=0..len-1)</code> The initial term s
   * is optional and can be omitted by passing NULL (equivalently, s=0 ). The
   * length len is allowed to be negative, which is equivalent to a length of
   * zero. The parameters xstep or ystep specify a step length for traversing
   * subsequences of the vectors x and y; either can be negative to step in the
   * reverse direction starting from the initial pointer. Aliasing is allowed
   * between res and s but not between res and the entries of x and y.
   * 
   * @param that        the other vector
   * @param initial  initial value to be added to the vector, can be NULL which is
   *                 equivalent to 0
   * @param subtract must be 0 or 1
   * @param xstep    signed step length for traversing subsequences of this (x)
   *                 vector
   * @param ystep    signed step length for traversing subsequences of y vector
   * @param len      negative numbers are interpreted as 0
   * @param prec     precision
   * @param res      variable which the result is to be stored in
   * @return res
   */
  public Complex dotProduct( Complex that, Complex initial, int subtract, int xstep, int ystep, int len, int prec, Complex res )
  {
    arblib.acb_dot(res, initial, subtract, this, xstep, that, ystep, len, prec);
    return res;
  }

  /**
   * Compares this Complex number with the specified Complex number for order.
   * This method first compares the absolute values (or magnitudes) of the Complex
   * numbers. If the absolute values are not equal, it returns the result of
   * comparing the absolute values.
   * 
   * If the absolute values are equal, it then compares the arguments (or angles)
   * of the Complex numbers. The argument is the angle this Complex number makes
   * with the positive real axis, measured counter-clockwise in radians. It
   * returns the result of comparing the arguments.
   * 
   * This method ensures that Complex numbers are ordered primarily by their
   * magnitude, and then by their argument if the magnitudes are equal. This leads
   * to a natural ordering of Complex numbers from the origin outwards, going
   * counter-clockwise if magnitudes are equal.
   * 
   * @param that the Complex number to be compared.
   * @return a negative integer, zero, or a positive integer as this Complex
   *         number is less than, equal to, or greater than the specified Complex
   *         number
   */
  @Override
  public int compareTo(Complex that)
  {
    try ( Real thisMod = abs(bits(), new Real()); Real thatMod = that.abs(that.bits(), new Real()))
    {
      int modComparison = thisMod.compareTo(thatMod);

      if (modComparison != 0)
      {
        return modComparison;
      }
      else
      {
        try ( Real thisArg = arg(bits(), new Real()); Real thatArg = that.arg(bits(), new Real()))
        {
          return thisArg.compareTo(thatArg);
        }

      }
    }
  }

  @Override
  public Complex newFieldElement()
  {
    return new Complex();
  }
    
  public Stream<Complex> stream()
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(), dim, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }
  
  @Override
  public Iterator<Complex> iterator()
  {
    return new ComplexIterator(this);
  }
  
  public Complex(Real firstRoot)
  {
   this(arblibJNI.new_Complex(), true);
   getReal().set(firstRoot);
  }
 
  public int relAccuracyBits()
  {
    return arblib.acb_rel_accuracy_bits(this);
  }

  /**
   * this=x vector
   * 
   * @param y    vector
   * @param prec
   * @param res  the dimension should be set, it determines the value of n passed
   *             to
   *             {@link arb#acb_poly_interpolate_newton(ComplexPolynomial, Complex, Complex, int, int)}
   * @return res
   */
  public ComplexPolynomial interpolateNewton(Complex y, int n, int prec, ComplexPolynomial res)
  {
    assert dim == y.dim;
    arblib.acb_poly_interpolate_newton(res, this, y, n, prec);
    return res;
  }
  
  public Complex cosh( int prec, Complex res )
  {
    arblib.acb_cosh( res, this, prec );
    return res;
  }
  
  public static final int BYTES = 96;
  
  public Complex conj( Complex res )
  {
    arblib.acb_conj( res, this );
    return res;
  }
  
  /**
   * @param prec precision
   * @param res Complex vector to store the result, the length of the array is the number 
            of terms of the Taylor series of the zeta function to compute 
   */
  public Complex ζ( int prec, Complex res )
  {
    arblib.acb_dirichlet_zeta_jet(res, this, 0, res.dim, prec);
    return res;
  }
  
  public boolean isFinite()
  {
    return arblib.acb_is_finite(this) != 0;
  }
   
  public Complex slice( int startInclusive, int endExclusive )
  {
    assert startInclusive >= 0 : "startInclusive must be >= 0";
    assert endExclusive <= dim : "endExclusive must be <= dim=" + dim;
    assert startInclusive < endExclusive : "startInclusive must be < endExclusive";  
    int sliceDim = endExclusive - startInclusive;
    Complex array = new Complex( swigCPtr + startInclusive * BYTES, false );
    array.elements = new Complex[array.dim = sliceDim];
    return array;
  }
    
  public Complex mul(int v, int prec, Complex r)
  {
    if (dim > 1)
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).mul(v, prec);
      }
    }
    else
    {
      arblib.acb_mul_si(this, this, v, prec);
    }
    bits = prec;
    return r;
  }


  @Override
  public Complex add( Complex q, int prec, Complex s )
  {  
    arblib.acb_add( s, this, q, prec );
    return s;
  }

  public Complex normalize(Complex res, int prec )
  {
    try ( Real magnitude = new Real()) { return div(norm(prec, magnitude ), prec, res); }
  }

  public Complex div(Real a, int prec, Complex r)
  {
    arblib.acb_div_arb(r, this, a, prec);
    return r;
  }
    
  public Complex ellipticK(int prec, Complex res)
  {
    arblib.acb_elliptic_k(res, this, prec);
    return res;
  }
  
  public Complex neg( Complex r)
  {
    arblib.acb_neg( r, this );
    return r;
  }


 public Complex midpoint( Complex res )
 {
   arblib.acb_get_mid( res, this );
   return res;
 }
 
 public Complex mul( Complex s, int bits )
 {
   return mul(s,bits,this);
 }
 
 public Complex mul( Complex s, int prec, Complex r )
 {
   this.bits = prec;
   arblib.acb_mul(r, this, s, prec);
   return r;
 }
 
  public Complex div( Complex s, int prec, Complex r )
  {
   this.bits = prec;
   arblib.acb_div(r, this, s, prec);
   return r;
  }
 
  public Complex init()
  {
    arblib.acb_init(this);
    return this;
  }
  
  public Real arg( int prec, Real result )
  {
    arblib.acb_arg(result, this, prec );
    return result;
  }
  
  public Complex set(double r, double i)
  {
    getReal().set(r);
    getImag().set(i);
    return this;
  }
  
  public Complex set(Real real, Real imag)
  {
   	getReal().set( real );
   	getImag().set( imag ); 
    return this;
  }
  
  /**
   * @see arb#acb_abs(Real, Complex, int)
   * @param prec
   * @param real
   * @return
   */
  public Real abs(int prec, Real real)
  {
    arblib.acb_abs(real, this, prec);
    return real;
  }
  
  
  public Complex set(Complex complex)
  {
    assert dim == complex.dim : String.format("dim = %d != this.dim = %d\n", dim, complex.dim);
    this.bits = complex.bits;
    
    if (dim == 1)
    {
      arblib.acb_set(this, complex);
    }
    else
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).set(complex.get(i));
      }
    }
    return this;
  }
    
  public String toFixedString()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("[");
    for (int i = 0; i < dim; i++)
    {
      if ( i > 0 )
      {
        sb.append(",\n ");
      }
      sb.append(String.format("%010.010f %s %010.010fi",
                              get(i).getReal().doubleValue(),
                              get(i).getImag().doubleValue() < 0 ? "-" : "+",
                              Math.abs(get(i).getImag().doubleValue())));
    }
    sb.append("]");
    return sb.toString();
  }

  public Complex(String str, int bits )
  {
    this();
    set(str,bits);
  }
      
  @Override
  public String toStringWithoutName()
  {
    StringBuilder sb = new StringBuilder();
    if (dim > 1)
    {
      sb.append("[");
    }
    for (int i = 0; i < dim; i++)
    {
      if (i > 0)
      {
        if (dim > 3)
        {
          sb.append(",\n ");
        }
        else
        {
          sb.append(", ");
        }
      }
      Real real2 = get(i).getReal();
      Real imag2 = get(i).getImag();
      real2.printPrecision = imag2.printPrecision = printPrecision;
      String imaginaryPartString = printPrecision ? imag2.toString() : imag2.getMid().toString();
      String realPartString      = printPrecision ? real2.toString() : real2.getMid().toString();
      if (imag2.isZero())
      {
        sb.append(String.format("%s", realPartString));
      }
      else
      {
        sb.append(String.format("%s + i*%s", realPartString, imaginaryPartString));
      }
    }
    if (dim > 1)
    {
      sb.append("]");
    }
    return sb.toString();
  }

  public String toString()
  {
    return (name == null ? "" : name + "=") + toStringWithoutName();
  }  
  public int dim = 1;
  
  public int size()
  {
    return dim;
  }

  public Complex conjugate()
  {
    return conj();
  }
  
  public Complex cos(int prec, Complex result )
  {
    arblib.acb_cos(result, this, prec );
    return result;
  }

  public Complex sin(int prec, Complex result )
  {
    arblib.acb_sin(result, this, prec );
    return result;
  }
  
  public int bits()
  {
    return getReal().bits() + getImag().bits();
  }
  
  public Complex[] elements;

  public Complex get(int index)
  {
    assert index < dim : String.format( "index = %d >= dim = %d", index, dim );
    if ( index == 0 && dim == 1 )
    {
      return this;
    }
    Complex element = elements[index];
    if (element == null)
    {
      element = elements[index] = new Complex(swigCPtr + index * Complex.BYTES,
                            	              false);
    }
    return element;
  }    

  /**
   * The absolute value
   * 
   * @return sqrt(Re(this)^2+Im(this)^2)
   */
  public Real norm(int prec, Real res)
  {
    arblib.acb_abs(res, this, prec);
    return res;
  }

  public Complex zero()
  {
    getReal().zero();
    getImag().zero();
    return this;
  }
  
 /**
   * @return this{@link #getReal()}{@link #isZero()} and this{@link #getImag()}{@link #isZero()}
   */
  public boolean isZero()
  {
    return getReal().isZero() && getImag().isZero();
  }
  
  public boolean containsZero()
  {
    return arblib.acb_contains_zero(this) != 0;
  }
  
  public boolean contains( Complex x )
  {
    return arblib.acb_contains(this, x) != 0;
  }

  public Complex exp(int prec, Complex res)
  {
    arblib.acb_exp(res, this, prec);
    return res;
  }

  public Complex mul( Real that, int prec, Complex res )
  {
    if (dim != that.dim)
    {
      assert that.dim == 1 : String.format("this.dim != that.dim != 1", this.dim, that.dim);
      for (int i = 0; i < dim; i++)
      {
        arblib.acb_mul_arb(res.get(i), this.get(i), that, prec);
      }
      bits = prec;
    }
    else
    {
      if (dim != res.dim)
      {
        res.become(Complex.newVector(dim));
      }
      for (int i = 0; i < dim; i++)
      {
        arblib.acb_mul_arb(res.get(i), this.get(i), that.get(i), prec);
      }
      bits = prec;
    }
    return res;
  }
  
  public boolean overlaps( Complex x )
  {
    return arblib.acb_overlaps(this, x) != 0;
  }
  

  
 /**
   * raise to the power of an unsigned integer
   * @param r = this^k
   * @param k = power >= 0 
   * @param prec = precision
   * @return r
   */
  public Complex pow( int k, int prec, Complex r )
  {
    assert k >= 0;
    arblib.acb_pow_ui(r, this, k, prec);
    return r;
  }
  
 /**
   * add an unsigned integer to this 
   * @param r = this^k
   * @param k = int >= 0 
   * @param prec = precision
   * @return r
   */
  public Complex add( int k, int prec, Complex r )
  {
    assert k >= 0;
    arblib.acb_add_ui(r, this, k, prec);
    return r;
  }
   
  public Complex(Real norm, Real imag)  
  {
    this();
    getReal().set(norm);
    getImag().set(imag);
  }
   
  public Complex clear()
  {
    if ( swigCMemOwn )
    {
      swigCMemOwn = false;
      acb_clear(this);
      for ( int i = 0; i < dim; i++ )
      {
        get(i).clear();
      }
    }
    return this;
  }
      
   /**
   * add an unsigned integer to this 
   * @param r = this^k
   * @param k = int >= 0 
   * @param prec = precision
   * @return r
   */
  public Complex sub(int k, int prec, Complex r)
  {
    assert k >= 0;
    arblib.acb_sub_ui(r, this, k, prec);
    return r;
  }
 
/**
  * subtract a complex number from this 
  * @param r = this-s
  * @param s = number to be subtracted 
  * @param prec = precision
  * @return r
  */
 public Complex sub( Complex s, int prec, Complex r )
 {
   arblib.acb_sub(r, this, s, prec);
   return r;
 }
 
  public Complex tan(int bits)
  {
    return tan(bits,this);
  }
  
 public static Complex newVector(int dim)
 {
    Complex array = arblib._acb_vec_init(dim);
    array.swigCMemOwn = true;      
    array.elements = new Complex[array.dim = dim];
    return array;
 }
   
     // Two-list pooling implementation
  private final Queue<Complex> available = new ArrayDeque<>();
  private final Set<Complex>   allocated = new HashSet<>();
  // Reference to the pool owner for temp instances
  Complex                      poolOwner = null;

  public Complex borrowVariable()
  {
    synchronized (this)
    {
      Complex object = available.poll();
      if (object != null)
      {
        object.poolOwner = this;
        allocated.add(object); // Track as allocated
        return object;
      }
      else
      {
        Complex newObj = new Complex();
        newObj.poolOwner = this;
        allocated.add(newObj); // Track as allocated
        return newObj;
      }
    }
  }

  public void returnVariable(Complex object)
  {
    synchronized (this)
    {
      assert object.poolOwner == this : String.format("%s is owned by %s not %s",
                                                      object,
                                                      object.poolOwner,
                                                      this);
      allocated.remove(object); // Remove from allocated
      available.add(object); // Add to available
    }
  }

  protected void emptyVariablePool()
  {
    synchronized (this)
    {
      // Clear allocated objects first
      for (Complex obj : allocated)
      {
        obj.poolOwner = null;
        obj.close();
      }
      allocated.clear();

      // Clear available objects
      while (!available.isEmpty())
      {
        Complex obj = available.poll();
        obj.poolOwner = null;
        obj.close();
      }
    }
  }
       
  @Override
  public void close()
  {
    emptyVariablePool();

    if (poolOwner != null)
    {
      poolOwner.returnVariable(this);
    }
    else
    {
      if (locked)
      {
        unlock();
      }
      clear();
    }
  }
  
  
  Real real;
  
 public Real getReal()
  {
    if (dim == 1)
    {
      if (real != null)
      {
        return real;
      }
      else
      {
        return real = getRealObj();
      }
    }
    else
    {
      boolean needsInitialization = false;
      if (real == null)
      {
        real                = Real.newAlignedVector(dim);
        needsInitialization = true;
      }
      if (dim != real.dim)
      {
        real.resize(dim);
        needsInitialization = true;
      }
      if (needsInitialization)
      {
        for (int i = 0; i < dim; i++)
        {
          real.set(i, get(i).getReal());
        }
      }
    }
    return real;
  }

  Real imag;

  public Real getImag()
  {
    if (dim == 1)
    {
      if (imag != null)
      {
        return imag;
      }
      else
      {
        return imag = getImagObj();
      }
    }
    else
    {
      boolean needsInitialization = false;
      if (imag == null)
      {
        imag                = Real.newVector(dim);
        needsInitialization = true;
      }
      if (dim != imag.dim)
      {
        imag.resize(dim);
        needsInitialization = true;
      }
      if (needsInitialization)
      {
        for (int i = 0; i < dim; i++)
        {
          imag.set(i, get(i).getImag());
        }
      }
    }
    return imag;
  }

  /**
   * 
   * @param prec
   * @param r
   * @return the multiplicative inverse of r 
   */
  public Complex inv( int prec, Complex r )
  {
    bits = prec;
    arblib.acb_inv(r, this, prec);
    return r;
  }

  /**
   * The secant of r is the multiplicative inverse of the cosine of r
   * 
   * @param prec
   * @param result
   * @return r after calling {@link arblib#acb_sec(Complex, Complex, int)}
   */
  public Complex sec(int prec, Complex result)
  {
    bits = prec;
    arblib.acb_sec(result, this, prec);
    return result;
  }
  
  public boolean isReal()
  {
    return arblib.acb_is_real(this) != 0 ;
  }


   /**
   * Calls {@link arblibJNI#mprotect(long, long, int)} with
   * {@link Protections#PROT_READ} only so that the contents become immutable. Any
   * code that attempts to change the variable will trigger an access violation
   * @return 
   * 
   * @throws IllegalArgumentException if {@link #swigCPtr} is not aligned on a
   *                                  page-boundary, the length of which is
   *                                  determined by {@link arb#getpagesize()}
   */
  @Override
  public Complex lock()
  {
    if (swigCPtr % PAGESIZE != 0)
    {
      throw new IllegalArgumentException("swigCPtr does not point to a page-aligned buffer");
    }
    int status = arblibJNI.mprotect(swigCPtr, BYTES * dim, Protections.PROT_READ.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arblib.errorNumber();
    locked = true;
    return this;
  }

  /**
   * Calls {@link arblibJNI#mprotect(long, long, int)} with
   * {@link Protections#PROT_READ} and {@link Protections#PROT_WRITE} so that the contents 
   * become mutable again
   * @return 
   */
  @Override
  public Complex unlock()
  {
    int status = arblibJNI.mprotect(swigCPtr,
                                 BYTES * dim,
                                 Protections.PROT_READ.bitfield | Protections.PROT_WRITE.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arblib.errorNumber();
    locked = false;
    return this;
  }

  boolean locked = false;

  
  @Override
  public boolean locked()
  {
    return locked;
  }      
  
  @Override
  public String getName()
  {
   return name;
  }
  
%};