%typemap(javafinalize) arb_struct ""

%typemap(javainterfaces) arb_struct "Serializable, Comparable<Real>, Iterable<Real>, Field<Real>, Lockable, EuclideanVectorSpace<Real>"

%typemap(javaimports) arb_struct %{
import java.io.Serializable; 
import org.lwjgl.system.*;
import static arb.IntegerConstants.*;
import static arb.arb.*;
import java.util.*;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.topological.spaces.EuclideanVectorSpace;

/**
 * Real numbers are points on an infinitely long line known as the real number
 * line, where the points corresponding to integers are equally spaced. Any real
 * number can be determined by a possibly infinite decimal representation. The
 * real line is part of the complex plane, and the real numbers are part of the
 * complex numbers.<br>
 * 
 */
%}

%typemap(javacode) arb_struct %{
  static { System.loadLibrary( "arblib" ); }

  public Real normalize(int prec)
  {
    return normalize(prec,this);
  }

  @SuppressWarnings("resource")
  public Real(int dim)
  {
    this(arb._arb_vec_init(dim).swigCPtr,
         true);    
    this.elements = new Real[this.dim = dim];
  }
  
  /**
   * Divides the elements of this by the standard deviation
   * 
   * @param prec
   * @param result
   * @return this / this{@link #standardDeviation(int, Real)}
   */
  public Real normalize(int prec, Real result)
  {
    try ( Real σ = standardDeviation(prec, new Real() ))
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).div(σ, prec, result.get(i));
      }
      return result;
    }
  }

  /*
   * The covariance of x and y is Σ(x[i]-mean(x))*(y[i]-mean(y)),i=1..dim)
   * 
   * @param that
   * @param prec
   * @param res
   * @return the covariance of this and that
   */
  public Real covariance(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    try ( Real a = mean(prec, new Real()); 
          Real b = that.mean(prec, new Real());
          Real aCentered = vecScalarSub(a, prec, Real.newVector(dim));
          Real bCentered = that.vecScalarSub(b, prec, Real.newVector(dim)))
    {
      return aCentered.innerProduct(bCentered, prec, res).div(dim, prec);
    }
  }
  
  /**
   * 
   * @param a      scalar (single real value, only element 0 is used, it is NOT
   *               treated as a vector)
   * @param prec
   * @param result
   * @return newVector=this-a where a is a scalar subtracted from each element of
   *         this
   */
  public Real vecScalarSub(Real a, int prec, Real result)
  {
    assert dim == result.dim;
    for (int i = 0; i < dim; i++)
    {
      get(i).sub(a, prec, result.get(i));
    }
    return result;
  }

  public Real vecNegate(Real res)
  {
    arb._arb_vec_neg(res, this, dim);
    return res;
  }
    
  @Override
  public void lock()
  {
    int status = arbJNI.mprotect(swigCPtr, BYTES * dim, Protections.PROT_READ.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arb.errorNumber();
    locked = true;
  }

  @Override
  public void unlock()
  {
    int status = arbJNI.mprotect(swigCPtr, BYTES * dim, Protections.PROT_READ.bitfield | Protections.PROT_WRITE.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arb.errorNumber();
    locked = false;
  }

  boolean locked = false;
  
  @Override
  public boolean locked()
  {
    return locked;
  }
  
  /**
   * @see {@link Real#log(int, Real)}
   * 
   * @param prec
   * @return log(prec,this)
   */
  public Real log(int prec)
  {
    return log(prec, this);
  }
  
  /**
   * Calls {@link Real#random(RandomState, int)} on each element of this
   * 
   * @param pdf
   * @param randomState
   * @param prec
   */
  public void randomlyGenerate(ProbabilityDistributionFunction pdf, RandomState randomState, int prec)
  {
    forEach(element -> pdf.sample(randomState, prec, element));
  }
    
  /**
   * Self-referencing this{@link #add(int, int, Real)}
   * 
   * @param i
   * @param prec
   * @return
   */
  public Real add(int i, int prec)
  {
    return add(i, prec, this);
  }

  public Real sub(int x, int prec, Real res)
  {
    arb.arb_sub_si(res, this, x, prec);
    return res;
  }

  /**
   * Add an integer to this
   * 
   * @param d    possibly signed integer to add
   * @param prec precision
   * @param res  where to store the result
   * @return the result of the addition
   */
  public Real add(int d, int prec, Real res)
  {
    if (d > 0)
    {
      arb.arb_add_ui(res, this, d, prec);
    }
    else if (d < 0)
    {
      arb.arb_sub_ui(res, this, -d, prec);
    }
    return res;
  }
  
  public Real sub(int i, int prec)
  {
    return sub(i,prec,this);
  }
  
  public Real variance(int prec, Real result)
  {
    try ( Real mean = new Real())
    {
      return variance(prec, mean(prec, mean), result);
    }
  }

  public Real variance(int prec, Real mean, Real result)
  {
    result.zero();
    try ( Real x = new Real(); )
    {
      for (Real element : this)
      {	    
        result.add( element.sub(mean, prec, x).pow(2, prec), prec );
      }
    }
    return result.div(dim, prec);
  }
  
  public Real standardDeviation(int prec, Real result)
  {
    try ( Real mean = new Real())
    {
      return standardDeviation(prec, mean(prec, mean), result);
    }  
  }
  
  public Real standardDeviation(int prec, Real mean, Real result)
  {
    return variance(prec, mean, result).sqrt(prec);
  }
  
 
  @Override
  public int dim()
  {
    return dim;    
  }

  public Stream<Real> stream()
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(), dim, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }
  
  public Real abs()
  {
    return abs(this);
  }
  
  @Override
  public Iterator<Real> iterator()
  {
    return new RealIterator(this);
  }
  
  /**
    * Copy constructor
    */
  public Real(Float div, Magnitude mag)
  {
    this();
    setMid(div);
    setRad(mag);
  }

  public Real pow(int i, int prec)
  {
    return pow(i,prec,this);
  }

  public Real(String string, int prec)
  {
    this();
    assign(string, prec);
  }
  
  public Real log(int prec, Real res)
  {
    arb.arb_log(res, this, prec);
    return res;    
  }

  
  public Real mul2e( int e, Real res )
  {
    arb_mul_2exp_si(res, this, e);
    return res;
  }

  /**
   * Sets this to a uniformly distributed (pseudo) random number
   * 
   * @param state the {@link RandomState}
   * @param bits  precision
   * @return uniformly distributed pseudo-random number
   */
  public Real random(RandomState state, int bits)
  {
    arb.arb_urandom(this, state, bits);
    return this;
  }
  
  
  public Real resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arb.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                                false),
                                                            2 * alloc * Real.BYTES));
    this.dim = alloc;                                                            
    return this;
  }

  @Override
  public Real abs(int prec, Real w)
  {
    arb.arb_abs(w, this);
    return w;
  }
  
  /**
   * Computes the (Normal Gaussian) error function using an automatic algorithm
   * choice. If z is too small to use the asymptotic expansion, a working
   * precision sufficient to circumvent cancellation in the hypergeometric series
   * is determined automatically, and a bound for the propagated error is computed
   * with acb_hypgeom_erf_propagated_error().
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erf(int prec, Real res)
  {
    arb.arb_hypgeom_erf(res, this, prec);
    return res;
  }

  /**
   * Computes the complementary (Normal Gaussian) error function  1-this{@link #erf(int, Real)}
   * whilst avoiding the catastrophic cancellation for large positive z.
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erfc(int prec, Real res)
  {
    arb.arb_hypgeom_erfc(res, this, prec);
    return res;
  }
    
 /**
   * The inverse of this{@link #erf(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erfinv(Real, Real, int)}
   */
  public Real erfinv(int prec, Real res)
  {
    arb.arb_hypgeom_erfinv(res, this, prec);
    return res;
  }

  /**
   * The inverse of this{@link #erfc(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_ercfinv(Real, Real, int)}
   */
  public Real erfcinv(int prec, Real res)
  {
    arb.arb_hypgeom_erfcinv(res, this, prec);
    return res;
  }
      
  public Complex div(Complex divisor, int prec, Complex w)
  {  
    return mul( divisor.inv(prec, w), prec, w );   
  }

  public Real sech(int prec, Real w)
  {
    arb.arb_sech(w, this, prec);
    return w;
  }
  
  public Complex sub(Complex a, int prec, Complex res)
  {
    try ( Complex subtrahend = new Complex())
    {
      return add(a.neg(subtrahend), prec, res);
    }
  }
  
  public Complex add(Complex a, int prec, Complex res)
  {
    arb.acb_add_arb(res, a, this, prec);
    return res;
  }

  public Real neg()
  {
    return negate(this);
  }

  
  /**
   * Adds the magnitude to the radius of this 
   * 
   * @param err
   * @return
   */
  public Real addUncertainty(Magnitude err)
  {
    arb.arb_add_error_mag(this, err);
    return this;
  }
  
  public Real clear()
  {
    if ( swigCMemOwn )
    {
      swigCMemOwn = false;    
      for ( int i = 0; i < dim; i++ )
      {
        get(i).clear();
      }
    }
    return this;
  }
    
  /**
   * Compares the midpoint of this to another Real, disregarding the uncertainty
   * radius if they are not equal. If they are equal, then compare the radius
   */
  @Override
  public int compareTo(Real o)
  {
    int cmp = getMid().compareTo(o.getMid());
    if ( cmp == 0 )
    {
      cmp = getRad().compareTo(o.getRad());
    }
    return cmp;
  }
  
  public Real set(int i)
  {
    arb.arb_set_si(this, i);;
    return this;
  }

  public Real exp(int prec, Real res)
  {
    arb.arb_exp(res, this, prec);
    return res;
  }

  /**
   * @return {@link arb#arb_equal(Real, Real)} != 0
   */
  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Real))
    {
      return false;
    }
    Real that = (Real)obj;
    return arb.arb_equal(this, that) != 0;
  }
  
  /**
   * 
   * @param prec
   * @param interval
   * @return {@link arb#arb_get_interval_arf(Float, Float, Real, int)
   */
  public FloatInterval getInterval(int prec, FloatInterval interval)
  {
    arb.arb_get_interval_arf(interval.getA(), interval.getB(), this, prec);
    return interval;
  }
  
  /**
   * @return {@link arb#arb_allocated_bytes(Real)}
   */
  public int getAllocatedBytes()
  {
    return arb.arb_allocated_bytes(this);
  }
  
  public Real negate(Real res)
  {
    arb.arb_neg(res, this);
    return this;
  }
  
  public Real sqrt( int prec )  
  {
    return sqrt(prec,this);
  }
  
  public Real sqrt( int prec, Real res )
  {
    arb.arb_sqrt(res, this, prec);
    return res;
  }
  
  @Override
  public Real innerProduct(Real that, int prec, Real result)
  {
    assert dim == that.dim : String.format("this.dim = %d != that.dim = %d", dim, that.dim);
    result.zero();
    for (int i = 0; i < dim; i++)
    {
      this.get(i).addmul(that.get(i), prec, result );
    }
    return result;
  }


  /**
   * @see arb#arb_addmul(Real, Real, Real, int)
   * @param that
   * @param prec
   * @param result
   * @return result = result + this * that
   */
  public Real addmul(Real that, int prec, Real result)
  {
    arb.arb_addmul( result, this, that, prec );
    return result;
  }
  
  @Override
  public int dimension()
  {
    return 1;
  }

  @Override
  public Real getCoordinate(int dim)
  {
    assert dim == 0;
    return this;
  }
    
 public boolean isFinite()
 {
   return arb.arb_is_finite(this) != 0;
 }

 public Real floor( int prec, Real res )
 {
   arb.arb_floor( res, this, prec );
   return res;
 }

 public Real ceil( int prec, Real res )
 {
   arb.arb_ceil( res, this, prec );
   return res;
 }
 
  /**
   * @return this after calling arb#arb_indeterminate(Real)
   */
  public Real indeterminate()
  {
    arb_indeterminate(this);
    return this;
  }
 
  public Real frac(int prec, Real res)
  {
    try (Real f = new Real() )
    {
      return sub(floor(prec, f), prec, res);
    }
  }
 
   public int dim = 1;
  
  public int size()
  {
    return dim;
  }
 
  public Real slice( int startInclusive, int endExclusive )
  {
    int sliceDim = endExclusive - startInclusive;
    Real array = new Real( swigCPtr + startInclusive * BYTES, false );    
    array.elements = new Real[array.dim = sliceDim];
    return array;
  }
     
 public static Real newAlignedVector(int i)
  {
    long pointer = SWIGTYPE_p_void.getCPtr(arb.memalign(arb.getpagesize(), i * Real.BYTES));
    arb.memset(new SWIGTYPE_p_void(pointer,
                                   false),
               0,
               i * Real.BYTES);
    Real x = new Real(pointer,
                      true); // Real.newVector(5);
    x.elements = new Real[x.dim = i];
    for (int j = 0; j < i; j++)
    {
      Real y = x.elements[j] = new Real(pointer + (Real.BYTES * j),
                                        false);
      y.init();

    }
    return x;
  }
       
  public static Real newVector( int dim )
  {
    Real array = arb._arb_vec_init(dim);    
    array.swigCMemOwn = true;    
    array.dim = dim;
    array.elements = new Real[array.dim = dim];
    return array;
  }
 
  public Real cos(int prec, Real result )
  {
    arb.arb_cos(result, this, prec );
    return result;
  }

  public Real sin(int prec, Real result )
  {
    arb.arb_sin(result, this, prec );
    return result;
  }
 
  @Override
  public Real mul(int i, int prec, Real res)
  {
    arb.arb_mul_si(res, this, i, prec);
    return res;
  }
 
  public Complex mul(Complex exp, int prec, Complex r)
  {
    arb.acb_mul_arb(r, exp, this, prec );
    return r;
  }
  
  public Real tanh(Real result, int prec )
  {   
    arb.arb_tanh(result, this, prec );
    return result;
  }
  
  public Real swap(Real u)
  {
    arb.arb_swap(this, u);
    return this;
  }

  @Override
  public Real div(Real exp, int prec, Real r)
  {
    arb.arb_div(r, this, exp, prec );
    return r;
  }
  

  public int relAccuracyBits()
  {
   return arb.arb_rel_accuracy_bits(this);
  }

  public synchronized void relocateToPageBoundary()                                             
  {                                                                                           
    long pointer = SWIGTYPE_p_void.getCPtr(arb.memalign(arb.getpagesize(), Real.BYTES * dim));  
    MemoryUtil.memCopy(swigCPtr, pointer, Real.BYTES * dim );                                   
    delete();                                                                                   
    swigCPtr = pointer;                                                                         
  }                                                                                             
                                                                                              
 
 
  public Real sub(Real real, int prec, Real res)
  {
    arb.arb_sub(res, this, real, prec);
    return res;
  }

  public Real setIntervalMagnitude( Magnitude a, Magnitude b, int prec )
  {
    arb.arb_set_interval_mag(this, a, b, prec);
    return this;
  }
  
  public static final int BYTES = 48;
  
  public Real π( int prec )
  {
    arb.arb_const_pi(this, prec);
    return this;
  }
  
  public Real init()
  {
    arb.arb_init(this);
    return this;
  }
  
  @Override
  public void close() 
  { 
    clear();
  }

  public Real add(Real d, int prec, Real res)
  {
    arb.arb_add(res, this, d, prec );
    return res;
  }
  
    public Real[] elements;
  
  public Real get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return this;
    }
    Real element = elements[index];
    if (element == null)
    {
      element = elements[index] = new Real(swigCPtr + index * Real.BYTES,
                                           false);
    }
    return element;
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
      sb.append(String.format("%010.010f", get(i).doubleValue() ) );
    }
    sb.append("]");
    return sb.toString();
  }
  
  public String toString()
  {
    return ( name == null ? "" : name + " " ) + toString(digits());
  }

  public String name;
    
  public int digits()
  {
    try ( Magnitude d = new Magnitude())
    {
      return Math.max(10, (int) getRad().inv(d).log().div(MagnitudeConstants.log10mag, d).doubleValue() + 2);
    }
  }
  
  public boolean  printPrecision = true;
    
  public String toString(int digits)
  {
    return toString(digits, printPrecision);
  }

  public String toString(int digits, boolean precise)
  {
    if (dim == 1)
    {
      return arb.arb_get_str(this,
                             digits,
                             (printPrecision
                                           || precise) ? IntegerConstants.ARB_STR_MORE : IntegerConstants.ARB_STR_NO_RADIUS);
    }
    else
    {
      StringBuilder sb = new StringBuilder();
      sb.append("[");
      for (int i = 0; i < dim; i++)
      {
        if (i > 0)
        {
          sb.append(",\n ");
        }
        sb.append(String.format("%s", get(i).toString(digits, printPrecision)));
      }
      sb.append("]");
      return sb.toString();
    }
  }
      
  public Real abs(Real res)  
  {
    arb.arb_abs(this, res);
    return res;
  }

        
  public Real set(Real real)
  {
     arb.arb_set( this, real );
     return this;    
  }
  
  public int bits()
  {
    return arb.arb_bits(this);
  }

  public Real posInf()
  {
    arb.arb_pos_inf(this);
    return this;
  }
  
  public Real negInf()
  {
    arb.arb_neg_inf(this);
    return this;
  }
  
  public Real zero()
  {
    arb.arb_zero(this);
    return this;
  }

  public Real one()
  {
    arb.arb_one(this);
    return this;
  }
         
  public Real set(String string, int prec)
  {
    arb.arb_set_str(this, string, prec);
    return this;
  }
  
  
  public boolean overlaps( Real interval )
  {
    return arb.arb_overlaps(this, interval) != 0;
  }
  
  public boolean contains( Real interval )
  {
    return arb.arb_contains(this, interval) != 0;
  }
  
  
  public Real assign( String string, int prec )
  {
    arb.arb_set_str(this, string, prec);
    return this;
  }
  
  public Real set(double d)
  {
    arb.arb_set_d(this, d);
    return this;
  }
  
  @Override
  public Real div(int k, int prec, Real res)
  {
    arb.arb_div_si(res, this, k, prec);
    return res;
  }
  
  public double doubleValue()
  {
    return getMid().doubleValue();
  }

  public double doubleValue(RoundingMode rm)
  {
    return getMid().doubleValue(rm);
  }
  
  /**
   * @return arb#arb_sgn_nonzero(Real)
   */
  public int sign()
  {
    return arb.arb_sgn_nonzero(this);
  }

  public boolean isPositive()
  {
    return arb.arb_is_positive(this) != 0;
  }

  public boolean isNegative()
  {
    return arb.arb_is_negative(this) != 0;
  }
  
  public boolean containsZero()
  {
    return arb.arb_contains_zero(this) != 0;
  }
  
  public Real set(FloatInterval interval, int prec)
  {
    Float a = interval.getA();
    Float b = interval.getB();

    /* [-inf, -inf] or [+inf, +inf] */
    if (a.isInfinite() && a.equals(b) )
    {
      setMid(a);
      getRad().zero();
      return this;
    }

    /* any nan -> [nan +/- inf] */
    if (a.isNotANumber() || b.isNotANumber() )
    {
      arb_indeterminate(this);
      return this;
    }

    /* [-inf, x] or [x, +inf] = [+/- inf] */
    if (arf_is_neg_inf(a) != 0 || arf_is_pos_inf(b) != 0)
    {
      arf_zero(getMid());
      mag_inf(getRad());
      return this;
    }

    try ( Float t = new Float();)
    {
      /* [(a + b) +/- (b - a)] / 2 */
      arf_sub(t, b, a, MAG_BITS, ARF_RND_UP);

      if (arf_sgn(t) < 0)
      {
        throw new IllegalArgumentException("endpoints are out of order");
      }

      arf_get_mag(getRad(), t);

      int inexact = arf_add(getMid(), a, b, prec, ARB_RND);
      if (inexact != 0)
      {
        Magnitude xrad = getRad();
        arf_mag_add_ulp(xrad, xrad, getMid(), prec);
      }

      arb_mul_2exp_si(this, this, -1);

      return this;
    }
  }

  /**
   * 
   * @param prec
   * @param r
   * @return the multiplicative inverse of r 
   */
  public Real inv( int prec, Real r )
  {
    arb.arb_inv(r, this, prec);
    return r;
  }

  /**
   * The secant of r is the multiplicative inverse of the cosine of r
   * 
   * @param prec
   * @param r
   * @return
   */
  public Real sec(int prec, Real r)
  {
    return cos(prec, r).inv(prec, r);
  }
  
  public Real pow(int i, int prec, Real r)
  {
    assert i >= 0;  
    arb.arb_pow_ui(r, this, i, prec);
    return r;
  }
  
  public Real tan(int prec, Real r)
  {
    arb.arb_tan(r, this, prec);
    return r;
  }
  
  public boolean isZero()
  {
    return arb_is_zero(this) != 0;
  }

  /**
   * Calls this{@link #setMid(Float)} and zeros out the radius
   * @param u value to set the midpoint of this real number ball to 
   * @return this
   */
  public Real set(Float u)
  {
    setMid(u);
    getRad().zero();
    return this;
  }  
   
  public Real mul(Real x, int prec, Real result)
  {
    arb.arb_mul(result, this, x, prec );
    return result;
  }

  public Real dotProduct(Real other, int prec, Real res)
  {
    assert dim == other.dim;
    res.zero();
    try ( Real x = new Real();)
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).mul(other.get(i), prec, x);
        res.add(x, prec);
      }
    }
    return res;
  }

  @Override
  public Real newFieldElement()
  {
    return new Real();
  }


  /**
   * <pre>
   *                 n*Σ(this*that)-Σthis*Σthat 
   *      ----------------------------------------------------- 
   *       √(n*Σ(this^2)-(Σthis)^2) * √( n*Σ(that^2)-(that)^2) 
   * </pre>
   *  
   * @param other vector to compare with
   * @param res where to store the result∈[-1,1] 
   * @return the correlation between this and that
   */
  public Real correlation(Real that, int prec, Real res)
  {
    assert dim == that.dim : "dimensions must match, this.dim=" + dim + " != that.dim = " + that.dim;
    try ( Real thisSum = new Real(); Real thatSum = new Real(); Real thisThatDotProduct = new Real();)
    {
      this.Σ(prec, thisSum);
      that.Σ(prec, thatSum);
      dotProduct(that, prec, thisThatDotProduct);
      // return ( n*Σ(this*that)-Σthis*Σthat ) / (
      // √(n*Σ(this^2)-(Σthis)^2)*√(n*Σ(that^2)-(that)^2) )
      assert false : "TODO: return ( n*Σ(this*that)-Σthis*Σthat ) / ( √(n*Σ(this^2)-(Σthis)^2)*√(n*Σ(that^2)-(that)^2) )";
    }
    return null;
  }
  
  
%};

