%typemap(javaimports) acb_struct %{
import java.util.concurrent.TimeUnit;
import java.util.Iterator;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import java.util.Spliterator;
import java.util.Spliterators;
import java.io.IOException;
import static arb.Constants.*;
import java.io.Serializable;
import static arb.arb.*;
/**
 * The complex numbers constitute an algebraically closed field, a commutative
 * algebra over the reals, and a Euclidean vector space of dimension two.
 */
%}

%typemap(javafinalize) acb_struct ""

%typemap(javainterfaces) acb_struct "Field,Iterable<Complex>,Serializable"

%typemap(javacode) acb_struct %{
  static { System.loadLibrary( "arblib" ); }

  public Complex(String realStr, String imagStr, int precision)
  {
    getReal().set(realStr, precision);
    getImag().set(imagStr, precision);
  }

  public Complex sqrt(int prec, Complex r)
  {
    arb.acb_sqrt(r, this, prec);
    return r;
  }

  public Complex sqrt(int prec)
  {
    return sqrt(prec,this);
  }

  public Complex log(int prec, Complex r)
  {
    arb.acb_log(r, this, prec);
    return r;
  }

  public Complex tanh(int prec, Complex res)
  {
    arb.acb_tanh(res, this, prec );
    return res;
  }

  public boolean printPrecision = false;

 /**
   * Wick rotation is called a rotation because when we represent complex numbers
   * as a plane, the multiplication of a complex number by i is equivalent to
   * rotating the vector representing that number by an angle of π/2 about the
   * origin.
   * 
   * @param s result
   * 
   * @return s
   */
  public Complex muli(Complex s)
  {
    arb.acb_mul_onei(s, this);
    return s;
  }
  
  /**
   * @see this{@link #mul(int, int, Complex)}
   * @return this 
   */
  public Complex muli()
  {
    return muli(this);
  }
  
  public Complex tan(int prec, Complex s)
  {
    arb.acb_tan(s, this, prec);
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
   * @see {@link arb#acb_swap(Complex, Complex)}
   * 
   * @param that
   * @return this
   */
  public Complex swap(Complex that)
  {
    acb_swap(this, that);
    return this;
  }
  
  public Complex one()
  {
    arb.acb_one(this);
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
  
  public Complex div(int i, int prec, Complex res )
  {
    arb.acb_div_si(res, this, i, prec);
    return res; 
  }
  
  public Complex negate(Complex res)
  {
    arb.acb_neg(res, this);
    return this;
  }
  
  public Complex setIndeterminate()
  {
    acb_indeterminate(this);
    return this;
  }

  /**
   * @return {@link arb#acb_equal(Real, Real)} != 0
   */
  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Complex))
    {
      return false;
    }
    Complex that = (Complex)obj;
    return arb.acb_equal(this, that) != 0;
  }
  
  public Complex resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arb.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                                false),
                                                            2 * alloc * Complex.BYTES));
    this.dim = alloc;                                                            
    return this;
  }
    
  private static final long serialVersionUID = 1L;
    
  private void writeObject(java.io.ObjectOutputStream stream)
                throws IOException {
                // TODO implement
        }

        private void readObject(java.io.ObjectInputStream stream)
                throws IOException, ClassNotFoundException {
                // TODO implement
        }
        
  public Iterator<Real> realIterator()
  {
    return new ComplexRealPartIterator(this);
  }

  public Iterator<Real> imaginaryIterator()
  {
    return new ComplexImaginaryPartIterator(this);
  }

  public Stream<Real> realStream()
  {
    return StreamSupport.stream(Spliterators.spliterator(realIterator(), dim, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

  public Stream<Real> imaginaryStream()
  {
    return StreamSupport.stream(Spliterators.spliterator(imaginaryIterator(),
                                                         dim,
                                                         Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

  public int getAllocatedBytes()
  {
    return getReal().getAllocatedBytes() + getImag().getAllocatedBytes();
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
   * @param y        the other vector
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
  public Complex dot(Complex y, Complex initial, int subtract, int xstep, int ystep, int len, int prec, Complex res)
  {
    arb.acb_dot(res, initial, subtract, this, xstep, y, ystep, len, prec);
    return res;
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
   this(arbJNI.new_Complex(), true);
   getReal().set(firstRoot);
  }
 
  public int relAccuracyBits()
  {
    return arb.acb_rel_accuracy_bits(this);
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
    arb.acb_poly_interpolate_newton(res, this, y, n, prec);
    return res;
  }
  
  public Complex cosh( int prec, Complex res )
  {
    arb.acb_cosh( res, this, prec );
    return this;
  }
  
  public static final int BYTES = 96;
  
  public Complex conj( Complex res )
  {
    arb.acb_conj( res, this );
    return res;
  }
  
  /**
   * @param prec precision
   * @param res Complex vector to store the result, the length of the array is the number 
            of terms of the Taylor series of the zeta function to compute 
   */
  public Complex ζ( int prec, Complex res )
  {
    arb.acb_dirichlet_zeta_jet(res, this, 0, res.dim, prec);
    return res;
  }
  
  public boolean isFinite()
  {
    return arb.acb_is_finite(this) != 0;
  }
   
  public Complex slice( int startInclusive, int endExclusive )
  {
    int sliceDim = endExclusive - startInclusive;
    Complex array = new Complex( swigCPtr + startInclusive * BYTES, false );
    array.elements = new Complex[array.dim = sliceDim];
    return array;
  }
    
 public Complex mul( int i, int prec, Complex r )
 {
   arb.acb_mul_si( r, this, i, prec );
   return r;
 }

  public Complex add( Complex q, int prec, Complex s )
  {
  
    arb.acb_add( s, this, q, prec );
    return s;
  }

  public Complex normalize(Complex res, int prec )
  {
    try ( Real magnitude = new Real()) { return div(norm(prec, magnitude ), prec, res); }
  }

  public Complex div(Real a, int prec, Complex r)
  {
    arb.acb_div_arb(r, this, a, prec);
    return r;
  }
    
  public Complex ellipticK(int prec, Complex res)
  {
    arb.acb_elliptic_k(res, this, prec);
    return res;
  }
  
  public Complex neg( Complex r)
  {
    arb.acb_neg( r, this );
    return r;
  }


 public Complex midpoint( Complex res )
 {
   arb.acb_get_mid( res, this );
   return res;
 }
 
 
 public Complex mul( Complex s, int prec, Complex r )
 {
      assert s != this;
 
   arb.acb_mul(r, this, s, prec);
   return r;
 }
 
  public Complex div( Complex s, int prec, Complex r )
  {
   arb.acb_div(r, this, s, prec);
   return r;
  }
 
  public Complex init()
  {
    arb.acb_init(this);
    return this;
  }
  
  public Real arg( int prec, Real result )
  {
    arb.acb_arg(result, this, prec );
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
  @Override   
  public Real abs(int prec, Real real)
  {
    arb.acb_abs(real, this, prec);
    return real;
  }
  
  public Complex set(Complex complex)
  {
    if (dim == 1)
    {
      arb.acb_set(this, complex);
    }
    else
    {
      int N = Math.min(dim,complex.dim);
      for (int i = 0; i < N; i++)
      {
        arb.acb_set(get(i), complex.get(i));
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
    
  public String toString()
  {
    StringBuilder sb = new StringBuilder();
    if ( dim > 1 ) 
    {
      sb.append("[");
    }
    for (int i = 0; i < dim; i++)
    {
      if ( i > 0 )
      {
        sb.append(",\n ");
      }
      Real real2 = get(i).getReal();
      Real imag2 = get(i).getImag();
      if ( printPrecision )
      {
        real2.printPrecision = true;
        imag2.printPrecision = true;
      }
      sb.append(String.format("(%s) + i(%s)",
                              printPrecision ? real2.toString() : real2.getMid().toString(),
                              printPrecision ? imag2.toString() : imag2.getMid().toString()));
    }
    if ( dim > 1 )
    {
      sb.append("]");
    }
    return sb.toString();
  }
  
  public int dim = 1;
  
  public int size()
  {
    return dim;
  }
  
  public Complex cos(int prec, Complex result )
  {
    arb.acb_cos(result, this, prec );
    return result;
  }

  public Complex sin(int prec, Complex result )
  {
    arb.acb_sin(result, this, prec );
    return result;
  }
  
  public int bits()
  {
    return getReal().bits() + getImag().bits();
  }
  
  public Complex[] elements;

  public Complex get(int index)
  {
    assert index < dim;
    if ( index == 0 && dim == 1 )
    {
      return this;
    }
    Complex element = elements[index];
    if (element == null)
    {
      element = new Complex(swigCPtr + index * Complex.BYTES,
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
    arb.acb_abs(res, this, prec);
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
    return arb.acb_contains_zero(this) != 0;
  }
  
  public boolean contains( Complex x )
  {
    return arb.acb_contains(this, x) != 0;
  }

  public Complex exp(int prec, Complex res)
  {
    arb.acb_exp(res, this, prec);
    return res;
  }

  public Complex mul( Real a, int prec, Complex r )
  {
    arb.acb_mul_arb( r, this, a, prec );
    return r;
  }
  
  public boolean overlaps( Complex x )
  {
    return arb.acb_overlaps(this, x) != 0;
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
    arb.acb_pow_ui(r, this, k, prec);
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
    arb.acb_add_ui(r, this, k, prec);
    return r;
  }
   
   public Complex(Real norm, Real imag)  
  {
    getReal().set(norm);
    getImag().set(imag);
  }
 
  public Complex clear()
  {
    if (swigCMemOwn)
    {
      arb._acb_vec_clear(this, dim);
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
    arb.acb_sub_ui(r, this, k, prec);
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
   arb.acb_sub(r, this, s, prec);
   return r;
 }
 
  public Complex tan(int bits)
  {
    return tan(bits,this);
  }
  
 public static Complex newVector(int dim)
 {
    Complex array = arb._acb_vec_init(dim);    
    array.elements = new Complex[array.dim = dim];
    return array;
 }
   
  @Override
  public void close()
  {
   clear();
  }
  
  Real real;

  public Real getReal()
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

  Real imag;

  public Real getImag()
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

  /**
   * 
   * @param prec
   * @param r
   * @return the multiplicative inverse of r 
   */
  public Complex inv( int prec, Complex r )
  {
    arb.acb_inv(r, this, prec);
    return r;
  }

  /**
   * The secant of r is the multiplicative inverse of the cosine of r
   * 
   * @param prec
   * @param r
   * @return
   */
  public Complex sec(int prec, Complex r)
  {
    return cos(prec, r).inv(prec, r);
  }

  public boolean isReal()
  {
    return arb.acb_is_real(this) != 0 ;
  }

       
%};